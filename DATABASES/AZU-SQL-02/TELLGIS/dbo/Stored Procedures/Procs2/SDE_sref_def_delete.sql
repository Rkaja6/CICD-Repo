CREATE PROCEDURE dbo.SDE_sref_def_delete       @sridVal INTEGER AS SET NOCOUNT ON DELETE FROM dbo.SDE_spatial_references WHERE srid = @sridVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_sref_def_delete] TO PUBLIC
    AS [dbo];

