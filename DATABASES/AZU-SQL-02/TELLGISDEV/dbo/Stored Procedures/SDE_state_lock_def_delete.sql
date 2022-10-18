CREATE PROCEDURE dbo.SDE_state_lock_def_delete
@sdeIdVal INTEGER,
@stateIdVal BIGINT,
@autoLockVal VARCHAR(1),
@markedVal INTEGER AS SET NOCOUNT ON
BEGIN TRAN state_lock_del_tran
DECLARE @ret_val INTEGER
IF (@markedVal = 0)
 DELETE FROM dbo.SDE_state_locks WITH (TABLOCKX) WHERE  sde_id = @sdeIdVal AND state_id = @stateIdVal AND autolock = @autoLockVal AND lock_type <> 'M'
ELSE
 DELETE FROM dbo.SDE_state_locks WITH (TABLOCKX) WHERE  sde_id = @sdeIdVal AND state_id = @stateIdVal AND autolock = @autoLockVal
IF @@ROWCOUNT = 0 SET @ret_val = -48 /* SE_NO_LOCKS */
ELSE SET @ret_val = 0 /* SE_SUCCESS */
COMMIT TRAN state_lock_del_tran
RETURN @ret_val
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_state_lock_def_delete] TO PUBLIC
    AS [dbo];

