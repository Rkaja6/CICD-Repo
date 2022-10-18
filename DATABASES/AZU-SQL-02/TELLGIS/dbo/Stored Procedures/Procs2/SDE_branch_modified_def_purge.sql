CREATE PROCEDURE dbo.SDE_branch_modified_def_purge 
@branchIdVal INTEGER, @regIdVal INTEGER 
AS SET NOCOUNT ON
DELETE FROM dbo.SDE_branch_tables_modified 
WHERE  registration_id = @regIdVal 
  AND  branch_id       = @branchIdVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_branch_modified_def_purge] TO PUBLIC
    AS [dbo];

