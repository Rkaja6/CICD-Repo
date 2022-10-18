CREATE PROCEDURE dbo.SDE_get_primary_oid
@id_type INTEGER,
@num_ids INTEGER,
@base_id BIGINT OUTPUT
AS
BEGIN
  DECLARE @baseidTable table (oldbaseid bigint);
  IF @id_type = -1
    SET @base_id = 4
  ELSE
  BEGIN
    BEGIN TRAN id_tran
    /* update the base id */
    UPDATE dbo.SDE_object_ids SET base_id = base_id + @num_ids
    OUTPUT Deleted.base_id INTO @baseidTable
    WHERE id_type = @id_type
    SELECT @base_id = oldbaseid FROM @baseidTable
    COMMIT TRAN id_tran /* releases update lock */
  END
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_get_primary_oid] TO PUBLIC
    AS [dbo];

