CREATE PROCEDURE dbo.SDE_pinfo_def_delete @sdeIdVal INTEGER AS SET NOCOUNT ON     BEGIN TRAN pinfo_tran     DELETE FROM dbo.SDE_layer_locks WHERE sde_id = @sdeIdVal     DELETE FROM dbo.SDE_state_locks WHERE sde_id = @sdeIdVal     DELETE FROM dbo.SDE_table_locks WHERE sde_id = @sdeIdVal     DELETE FROM dbo.SDE_object_locks WHERE sde_id = @sdeIdVal     UPDATE dbo.SDE_logfile_pool SET sde_id = NULL WHERE sde_id = @sdeIdVal     DELETE FROM dbo.SDE_process_information WHERE sde_id = @sdeIdVal     COMMIT TRAN pinfo_tran
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_pinfo_def_delete] TO PUBLIC
    AS [dbo];

