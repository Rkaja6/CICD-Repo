CREATE PROCEDURE dbo.SDE_rascol_srid_update              @sridVal INTEGER, @rastercolumn_idVal INTEGER AS             SET NOCOUNT ON UPDATE dbo.SDE_raster_columns               SET srid = @sridVal WHERE rastercolumn_id = @rastercolumn_idVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_rascol_srid_update] TO PUBLIC
    AS [dbo];

