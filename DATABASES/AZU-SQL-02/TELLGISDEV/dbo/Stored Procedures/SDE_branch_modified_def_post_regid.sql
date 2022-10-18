CREATE PROCEDURE dbo.SDE_branch_modified_def_post_regid 
@branchIdVal INTEGER, @regIdVal INTEGER, @postMomentVal DATETIME2 
AS SET NOCOUNT ON 
UPDATE dbo.SDE_branch_tables_modified 
SET branch_id = 0, edit_moment = @postMomentVal 
WHERE branch_id = @branchIdVal 
  AND registration_id = @regIdVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_branch_modified_def_post_regid] TO PUBLIC
    AS [dbo];

