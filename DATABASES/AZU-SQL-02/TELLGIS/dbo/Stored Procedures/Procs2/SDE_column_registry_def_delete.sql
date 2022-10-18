CREATE PROCEDURE dbo.SDE_column_registry_def_delete                         @dbNameVal NVARCHAR(32), @tabNameVal sysname,                         @ownerVal NVARCHAR(32), @colNameVal NVARCHAR(32) AS                         SET NOCOUNT ON DELETE FROM dbo.SDE_column_registry WHERE                         database_name = @dbNameVal AND table_name = @tabNameVal AND                         owner = @ownerVal AND column_name = @colNameVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_column_registry_def_delete] TO PUBLIC
    AS [dbo];

