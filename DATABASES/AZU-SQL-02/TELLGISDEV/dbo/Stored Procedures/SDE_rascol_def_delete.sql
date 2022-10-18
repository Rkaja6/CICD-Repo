CREATE PROCEDURE dbo.SDE_rascol_def_delete @rascol_idVal        INTEGER AS SET NOCOUNT ON DELETE FROM dbo.SDE_raster_columns WHERE rastercolumn_id =       @rascol_idVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_rascol_def_delete] TO PUBLIC
    AS [dbo];

