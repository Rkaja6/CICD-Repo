﻿CREATE PROCEDURE dbo.SDE_state_lock_def_delete_user @sdeIdVal INTEGER AS SET NOCOUNT ON     BEGIN TRAN state_lock_tran     DELETE FROM dbo.SDE_state_locks WHERE  sde_id = @sdeIdVal     COMMIT TRAN state_lock_tran
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_state_lock_def_delete_user] TO PUBLIC
    AS [dbo];

