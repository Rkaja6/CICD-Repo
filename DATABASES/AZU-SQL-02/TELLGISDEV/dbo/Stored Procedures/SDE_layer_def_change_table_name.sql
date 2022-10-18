CREATE PROCEDURE dbo.SDE_layer_def_change_table_name              @tabNameVal sysname, @layerIdVal INTEGER AS SET NOCOUNT ON             UPDATE dbo.SDE_layers SET              table_name = @tabNameVal  WHERE layer_id = @layerIdVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_layer_def_change_table_name] TO PUBLIC
    AS [dbo];

