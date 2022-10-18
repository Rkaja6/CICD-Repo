CREATE PROCEDURE dbo.SDE_object_lock_def_delete_user @sdeIdVal INTEGER AS SET NOCOUNT ON     BEGIN TRAN object_lock_tran     DELETE FROM dbo.SDE_object_locks WHERE  sde_id = @sdeIdVal     COMMIT TRAN object_lock_tran
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_object_lock_def_delete_user] TO PUBLIC
    AS [dbo];

