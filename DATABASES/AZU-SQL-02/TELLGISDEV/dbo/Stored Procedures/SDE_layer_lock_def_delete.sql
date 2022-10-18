CREATE PROCEDURE dbo.SDE_layer_lock_def_delete @sdeIdVal INTEGER, @layerIdVal INTEGER,     @autoLockVal VARCHAR(1) AS SET NOCOUNT ON     BEGIN TRAN layer_lock_del_tran     DECLARE @ret_val INTEGER     DELETE FROM dbo.SDE_layer_locks WHERE  sde_id = @sdeIdVal AND layer_id = @layerIdVal AND     autolock = @autoLockVal     IF @@ROWCOUNT = 0 SET @ret_val = -48 /* SE_NO_LOCKS */     ELSE SET @ret_val = 0 /* SE_SUCCESS */     COMMIT TRAN layer_lock_del_tran     RETURN @ret_val
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_layer_lock_def_delete] TO PUBLIC
    AS [dbo];

