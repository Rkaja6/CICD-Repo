CREATE PROCEDURE dbo.SDE_layer_def_delete               @layer_idVal INTEGER AS SET NOCOUNT ON             DELETE FROM dbo.SDE_layers WHERE layer_id = @layer_idVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_layer_def_delete] TO PUBLIC
    AS [dbo];

