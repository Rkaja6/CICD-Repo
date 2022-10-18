CREATE PROCEDURE dbo.SDE_purge_processes AS SET NOCOUNT ON
BEGIN
  BEGIN TRAN pinfo_tran
  DECLARE @sde_id INTEGER
  DECLARE @table_id INTEGER
  DECLARE @process_cursor CURSOR 
  EXEC sp_executesql N'SET @process_cursor = CURSOR LOCAL FAST_FORWARD FOR
    SELECT PR.sde_id, SO.object_id FROM 
dbo.SDE_process_information PR WITH (TABLOCK,XLOCK,HOLDLOCK) 
      LEFT JOIN tempdb.sys.objects SO
      ON object_id (PR.table_name) = SO.object_id; 
    OPEN @process_cursor', N'@process_cursor cursor OUTPUT', @process_cursor OUTPUT 
  FETCH NEXT FROM @process_cursor INTO @sde_id,@table_id
  WHILE @@FETCH_STATUS = 0
    BEGIN
    IF (@table_id IS NULL)
    BEGIN
      /* We found an invalid connection, clean it up. */
      EXECUTE dbo.SDE_pinfo_def_delete @sde_id
    END
    FETCH NEXT FROM @process_cursor INTO @sde_id,@table_id
  END /* while */
  CLOSE @process_cursor
  DEALLOCATE @process_cursor
  COMMIT TRAN pinfo_tran
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_purge_processes] TO PUBLIC
    AS [dbo];

