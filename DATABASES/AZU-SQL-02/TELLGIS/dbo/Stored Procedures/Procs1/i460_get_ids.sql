CREATE PROCEDURE DBO.i460_get_ids
@id_type integer,
@num_requested_ids integer,
@base_id integer OUTPUT,
@num_obtained_ids integer OUTPUT AS SET NOCOUNT ON
BEGIN
  IF (@num_requested_ids < 0)
  BEGIN 
    BEGIN TRAN id_tran
    /* We are resetting the generator. */
    /* Delete fragments and update the base value.*/
    UPDATE DBO.i460 WITH  (tablockx, holdlock)
      SET base_id = base_id + @num_requested_ids
      WHERE num_ids = -1 AND id_type = @id_type
    DELETE FROM DBO.i460 WHERE id_type = @id_type and num_ids <> -1
    COMMIT TRAN id_tran /* releases holdlock table lock */
  END
  ELSE
  BEGIN
    IF (@num_requested_ids > 0)
    BEGIN
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM DBO.i460 WITH (tablockx, holdlock)
        WHERE id_type = @id_type
        ORDER BY num_ids DESC /* ensures that fragments come first */
        FOR UPDATE /* to get a lock */
    END
    ELSE
    BEGIN
      /* only interested in base id */
      DECLARE I_cursor CURSOR FOR
        SELECT base_id, num_ids
        FROM DBO.i460 WITH (tablockx, holdlock)
        WHERE id_type = @id_type AND num_ids = -1
        FOR UPDATE /* to get a lock */
    END
    BEGIN TRAN id_tran
    OPEN I_cursor
    FETCH NEXT FROM I_cursor INTO @base_id, @num_obtained_ids
    IF (@num_requested_ids = 0)
    BEGIN
      /* Just getting current value */
      SET @num_obtained_ids = 0
    END
    ELSE
    BEGIN
      IF (@num_obtained_ids = -1)
      BEGIN
        /* user got the amount they wanted */
        SET @num_obtained_ids = @num_requested_ids
        /* update the last id and base id */
        UPDATE DBO.i460
          SET base_id = base_id + @num_obtained_ids,
              last_id =  @base_id
          WHERE CURRENT OF I_cursor
      END
      ELSE
      BEGIN
        /* user got a fragment */
        IF (@num_requested_ids = 1) AND (@num_obtained_ids > 1)
        BEGIN
          /* they want one and exactly one id */
          SET @num_obtained_ids = 1
          UPDATE DBO.i460 SET base_id = base_id + 1,
            num_ids =  num_ids - 1 WHERE CURRENT OF I_cursor
        END
        ELSE
        BEGIN
          /* Return the whole fragment, delete the the row */
          DELETE FROM DBO.i460 WHERE CURRENT OF I_cursor
        END
      END
    END
    CLOSE I_cursor
    COMMIT TRAN id_tran /* releases holdlock table lock */
    DEALLOCATE I_cursor
  END
END