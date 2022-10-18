CREATE PROCEDURE dbo.SDE_branch_modified_def_delete 
@branchIdVal INTEGER, @editMomentVal DATETIME2 AS SET NOCOUNT ON
DELETE FROM dbo.SDE_branch_tables_modified WHERE branch_id = @branchIdVal AND edit_moment > @editMomentVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_branch_modified_def_delete] TO PUBLIC
    AS [dbo];

