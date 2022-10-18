CREATE PROCEDURE dbo.SDE_rascol_def_update_migrate @rastercolumn_idVal INTEGER,      @descriptionVal NVARCHAR(65), @config_keywordVal NVARCHAR(32),       @minimum_idVal INTEGER, @rastercolumn_maskVal INTEGER,       @raster_columnVal NVARCHAR(32)       AS SET NOCOUNT ON UPDATE dbo.SDE_raster_columns SET description = @descriptionVal,      config_keyword = @config_keywordVal,       minimum_id = @minimum_idVal, rastercolumn_mask = @rastercolumn_maskVal,       raster_column = @raster_columnVal       WHERE rastercolumn_id = @rastercolumn_idVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_rascol_def_update_migrate] TO PUBLIC
    AS [dbo];

