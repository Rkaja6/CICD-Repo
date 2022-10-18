CREATE PROCEDURE dbo.SDE_branch_modified_def_post 
@branchIdVal INTEGER, @postMomentVal DATETIME2 AS SET NOCOUNT ON
UPDATE dbo.SDE_branch_tables_modified SET branch_id = 0, edit_moment = @postMomentVal WHERE branch_id = @branchIdVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_branch_modified_def_post] TO PUBLIC
    AS [dbo];

