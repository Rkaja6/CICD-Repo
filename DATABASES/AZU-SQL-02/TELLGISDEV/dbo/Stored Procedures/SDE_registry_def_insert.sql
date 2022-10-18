CREATE PROCEDURE dbo.SDE_registry_def_insert        @regIdVal INTEGER, @dbNameVal NVARCHAR(32), @tabNameVal sysname, @ownerVal NVARCHAR(32),       @rowidColVal NVARCHAR(32), @descVal NVARCHAR(65), @objFlagsVal INTEGER,       @regDate INTEGER, @conKeyWordVal  NVARCHAR(32), @minIdVal INTEGER,        @imvNameVal NVARCHAR(128) AS SET NOCOUNT ON       INSERT INTO dbo.SDE_table_registry (registration_id, database_name, table_name, owner,       rowid_column,description,object_flags,registration_date,       config_keyword,minimum_id,imv_view_name) VALUES ( @regIdVal, @dbNameVal, @tabNameVal,       @ownerVal,@rowidColVal, @descVal, @objFlagsVal, @regDate, @conKeyWordVal, @minIdVal,       @imvNameVal)
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_registry_def_insert] TO PUBLIC
    AS [dbo];

