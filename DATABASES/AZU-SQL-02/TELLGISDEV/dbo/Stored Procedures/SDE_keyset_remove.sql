CREATE PROCEDURE dbo.SDE_keyset_remove
@tableNameVal sysname
AS
BEGIN
BEGIN TRAN keyset_tran
DECLARE @sql AS NVARCHAR(256)
SET @sql = N'DROP TABLE dbo.' + @tableNameVal
EXECUTE (@sql)
COMMIT TRAN keyset_tran
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_keyset_remove] TO PUBLIC
    AS [dbo];

