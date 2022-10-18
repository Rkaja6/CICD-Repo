CREATE PROCEDURE dbo.SDE_versions_def_change_state @newStateIdVal BIGINT,      @nameVal NVARCHAR(64), @ownerVal NVARCHAR(32), @oldStateIdVal BIGINT AS      SET NOCOUNT OFF      UPDATE dbo.SDE_versions SET       state_id = @newStateIdVal WHERE name = @nameVal and owner = @ownerVal AND       state_id = @oldStateIdVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_versions_def_change_state] TO PUBLIC
    AS [dbo];

