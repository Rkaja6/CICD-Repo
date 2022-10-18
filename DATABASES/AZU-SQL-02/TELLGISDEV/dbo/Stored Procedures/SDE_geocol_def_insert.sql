CREATE PROCEDURE dbo.SDE_geocol_def_insert @fTabCatVal NVARCHAR(32),     @fTabSchVal NVARCHAR(32), @fTabNameVal sysname, @fGeoColVal NVARCHAR(32), @gTabCatVal     NVARCHAR(32), @gTabSchVal NVARCHAR(32), @gTabNameVal sysname,    @storageTypeVal INTEGER, @geometryTypeVal INTEGER,    @CoordDimensionVal INTEGER, @sridVal INTEGER AS    SET NOCOUNT ON    BEGIN    BEGIN TRAN geocol_insert    INSERT INTO dbo.SDE_geometry_columns (f_table_catalog,f_table_schema,f_table_name, f_geometry_column,     g_table_catalog,g_table_schema,g_table_name,storage_type, geometry_type,    coord_dimension, srid) VALUES ( @fTabCatVal, @fTabSchVal,    @fTabNameVal, @fGeoColVal, @gTabCatVal, @gTabSchVal, @gTabNameVal,    @storageTypeVal, @geometryTypeVal, @CoordDimensionVal, @sridVal)    COMMIT TRAN geocol_insert    END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_geocol_def_insert] TO PUBLIC
    AS [dbo];

