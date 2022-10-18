CREATE PROCEDURE dbo.SDE_registry_def_delete        @regIdVal INTEGER AS SET NOCOUNT ON       DELETE FROM dbo.SDE_mvtables_modified WHERE registration_id = @regIdVal 
       DELETE FROM dbo.SDE_table_registry WHERE registration_id = @regIdVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_registry_def_delete] TO PUBLIC
    AS [dbo];

