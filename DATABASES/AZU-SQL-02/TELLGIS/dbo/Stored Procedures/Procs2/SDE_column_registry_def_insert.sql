CREATE PROCEDURE dbo.SDE_column_registry_def_insert        @dbNameVal NVARCHAR(32), @tabNameVal sysname, @ownerVal NVARCHAR(32),       @colNameVal NVARCHAR(32), @sdeTypeVal INTEGER, @colSizeVal INTEGER,        @decDigitVal INTEGER, @descVal NVARCHAR(65), @objFlagsVal INTEGER,       @objIdVal INTEGER AS SET NOCOUNT ON       INSERT INTO dbo.SDE_column_registry (database_name, table_name, owner, column_name, sde_type,        column_size, decimal_digits,description,object_flags, object_id )        VALUES ( @dbNameVal, @tabNameVal, @ownerVal, @colNameVal, @sdeTypeVal,        @colSizeVal ,@decDigitVal, @descVal, @objFlagsVal, @objIdVal)
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_column_registry_def_insert] TO PUBLIC
    AS [dbo];

