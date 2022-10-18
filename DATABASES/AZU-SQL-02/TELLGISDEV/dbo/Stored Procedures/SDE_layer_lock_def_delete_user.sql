CREATE PROCEDURE dbo.SDE_layer_lock_def_delete_user @sdeIdVal INTEGER AS SET NOCOUNT ON     BEGIN TRAN layer_lock_tran     DELETE FROM dbo.SDE_layer_locks WHERE  sde_id = @sdeIdVal     COMMIT TRAN layer_lock_tran
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_layer_lock_def_delete_user] TO PUBLIC
    AS [dbo];

