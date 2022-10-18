CREATE PROCEDURE dbo.SDE_table_lock_def_delete @sdeIdVal INTEGER, @registrationIdVal INTEGER AS     SET NOCOUNT ON BEGIN TRAN table_lock_del_tran     DECLARE @ret_val INTEGER     DELETE FROM dbo.SDE_table_locks WITH (TABLOCKX) WHERE  sde_id = @sdeIdVal AND     registration_id = @registrationIdVal     IF @@ROWCOUNT = 0 SET @ret_val = -48 /* SE_NO_LOCKS */     ELSE SET @ret_val = 0 /* SE_SUCCESS */     COMMIT TRAN table_lock_del_tran     RETURN @ret_val
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_table_lock_def_delete] TO PUBLIC
    AS [dbo];

