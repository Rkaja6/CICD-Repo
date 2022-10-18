CREATE PROCEDURE dbo.SDE_col_registry_def_update        @dbNameVal NVARCHAR(32), @tabNameVal sysname, @ownerVal NVARCHAR(32),       @colNameVal NVARCHAR(32), @sdeTypeVal INTEGER, @colSizeVal INTEGER,        @decDigitVal INTEGER, @descVal NVARCHAR(65), @objFlagsVal INTEGER,       @objIdVal INTEGER, @oldColNameVal NVARCHAR(32) AS SET NOCOUNT ON       UPDATE dbo.SDE_column_registry SET column_name = @colNameVal, sde_type = @sdeTypeVal,       column_size = @colSizeVal,        decimal_digits = @decDigitVal, description = @descVal,       object_flags = @objFlagsVal ,object_id = @objIdVal        WHERE database_name = @dbNameVal AND table_name = @tabNameVal AND              owner = @ownerVal AND column_name = @oldColNameVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_col_registry_def_update] TO PUBLIC
    AS [dbo];

