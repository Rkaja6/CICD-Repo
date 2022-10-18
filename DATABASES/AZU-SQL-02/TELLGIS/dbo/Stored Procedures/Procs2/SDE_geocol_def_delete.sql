CREATE PROCEDURE dbo.SDE_geocol_def_delete                 @fTableCatalogVal NVARCHAR(32), @fTableSchemaVal NVARCHAR(32),                @fTableNameVal sysname, @fGeometryColumnVal NVARCHAR(32) AS                 SET NOCOUNT ON                BEGIN                BEGIN TRAN geocol_delete                DELETE FROM dbo.SDE_geometry_columns WHERE f_table_catalog = @fTableCatalogVal AND                 f_table_schema = @fTableSchemaVal AND                 f_table_name = @fTableNameVal AND                 f_geometry_column = @fGeometryColumnVal                COMMIT TRAN geocol_delete                END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_geocol_def_delete] TO PUBLIC
    AS [dbo];

