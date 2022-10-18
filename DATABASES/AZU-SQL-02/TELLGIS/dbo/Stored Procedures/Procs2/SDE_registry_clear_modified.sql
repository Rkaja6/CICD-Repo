CREATE PROCEDURE dbo.SDE_registry_clear_modified                         @regIdVal INTEGER AS SET NOCOUNT ON DELETE FROM dbo.SDE_mvtables_modified WHERE                        registration_id = @regIdVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_registry_clear_modified] TO PUBLIC
    AS [dbo];

