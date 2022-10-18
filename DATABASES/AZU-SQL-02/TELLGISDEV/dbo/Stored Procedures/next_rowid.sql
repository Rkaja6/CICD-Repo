CREATE PROCEDURE dbo.next_rowid
@owner NVARCHAR(128), @table NVARCHAR(128), @rowid INT OUTPUT
AS SET NOCOUNT ON
BEGIN
DECLARE @regid INT
DECLARE @newid INT
DECLARE @sql NVARCHAR (1024)
SELECT @regid = registration_id FROM dbo.SDE_table_registry  WHERE owner = @owner AND table_name = @table
IF @@ROWCOUNT = 0
BEGIN
  SELECT @regid = registration_id FROM dbo.SDE_table_registry    WHERE owner = @owner AND imv_view_name = @table
  IF @@ROWCOUNT = 0
  BEGIN
    DECLARE @errstr VARCHAR (256)
    SET @errstr = 'Class ' + @table + ' not registered to the Geodatabase.'
    RAISERROR (@errstr,16,-1)
    RETURN
  END
END
SET @sql = 
'DECLARE @num_ids INT ' +
'EXEC ' + @owner + '.i' +cast (@regid AS VARCHAR(10)) + '_get_ids 2,1,@newid OUTPUT,@num_ids OUTPUT'
EXECUTE sp_executesql @sql, N'@newid INTEGER OUTPUT', @newid = @rowid OUTPUT
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[next_rowid] TO PUBLIC
    AS [dbo];

