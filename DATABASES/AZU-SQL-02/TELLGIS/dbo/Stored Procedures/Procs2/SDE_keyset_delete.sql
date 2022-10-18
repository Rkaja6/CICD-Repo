CREATE PROCEDURE dbo.SDE_keyset_delete
@tableNameVal sysname,
@keysetIdVal INTEGER
AS
BEGIN
BEGIN TRAN keyset_tran
DECLARE @sql AS NVARCHAR(256)
SET @sql = N'DELETE FROM dbo.' + @tableNameVal + N'WHERE KEYSET_ID = ' + @keysetIdVal
EXECUTE (@sql)
COMMIT TRAN keyset_tran
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_keyset_delete] TO PUBLIC
    AS [dbo];

