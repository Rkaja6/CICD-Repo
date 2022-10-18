CREATE PROCEDURE dbo.SDE_logfile_pool_release_id
@tableIdVal INTEGER
AS SET NOCOUNT ON
BEGIN TRAN logfile_tran
  UPDATE dbo.SDE_logfile_pool SET sde_id = NULL
    WHERE table_id = @tableIdVal
COMMIT TRAN logfile_tran
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_logfile_pool_release_id] TO PUBLIC
    AS [dbo];

