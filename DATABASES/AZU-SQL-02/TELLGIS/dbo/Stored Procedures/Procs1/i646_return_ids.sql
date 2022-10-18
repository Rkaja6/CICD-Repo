CREATE PROCEDURE DBO.i646_return_ids
@id_type integer,
@base_id integer,
@num_ids integer
AS SET NOCOUNT ON
BEGIN
  DECLARE @last_id integer
  DECLARE @fetched_base_id integer
  BEGIN TRAN id_tran
  SELECT @last_id = last_id, @fetched_base_id = base_id
    FROM DBO.i646 WITH (tablockx, holdlock)
    WHERE num_ids = -1 AND id_type = @id_type
  IF ( (@last_id < @base_id) AND
       ((@base_id + @num_ids) = @fetched_base_id))
  BEGIN
    /* only return ids if no one else has grabbed a block
       and were returning the remainder of the block. */
    UPDATE DBO.i646 SET base_id = @base_id
       WHERE num_ids = -1 AND id_type = @id_type
  END
  ELSE
  BEGIN
    /* Insert a new fragment */
    INSERT INTO DBO.i646 (base_id, num_ids, id_type)
      VALUES (@base_id, @num_ids, @id_type)
  END
  COMMIT TRAN id_tran /* releases holdlock table lock */
END