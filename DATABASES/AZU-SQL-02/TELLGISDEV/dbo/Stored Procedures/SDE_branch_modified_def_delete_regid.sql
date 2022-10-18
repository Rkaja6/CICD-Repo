CREATE PROCEDURE dbo.SDE_branch_modified_def_delete_regid 
@regIdVal INTEGER AS SET NOCOUNT ON
DELETE FROM dbo.SDE_branch_tables_modified WHERE registration_id = @regIdVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_branch_modified_def_delete_regid] TO PUBLIC
    AS [dbo];

