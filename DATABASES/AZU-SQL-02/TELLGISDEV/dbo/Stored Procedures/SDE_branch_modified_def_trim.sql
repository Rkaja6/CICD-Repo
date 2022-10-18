CREATE PROCEDURE dbo.SDE_branch_modified_def_trim 
@branchIdVal INTEGER, @branchMomentVal DATETIME2, @trimMomentVal DATETIME2 AS SET NOCOUNT ON
DELETE __bm FROM dbo.SDE_branch_tables_modified __bm WHERE __bm.branch_id = @branchIdVal AND NOT EXISTS
(SELECT * FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY registration_id
                ORDER BY edit_moment DESC) rn FROM dbo.SDE_branch_tables_modified
                WHERE branch_id = @branchIdVal) __a 
 WHERE  rn = 1 AND __bm.branch_id = __a.branch_id AND 
 __bm.registration_id = __a. registration_id AND __bm.edit_moment = __a.edit_moment)

UPDATE dbo.SDE_branch_tables_modified SET edit_moment = @trimMomentVal WHERE branch_id = @branchIdVal AND edit_moment > @branchMomentVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_branch_modified_def_trim] TO PUBLIC
    AS [dbo];

