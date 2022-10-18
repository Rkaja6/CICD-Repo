CREATE PROCEDURE dbo.SDE_branch_modified_def_reconcile_regid 
@branchIdVal INTEGER, @regIdVal INTEGER, @reconcileMomentVal DATETIME2 
AS SET NOCOUNT ON 
DELETE __bm FROM	dbo.SDE_branch_tables_modified __bm 
WHERE __bm.branch_id = @branchIdVal 
  AND __bm.registration_id = @regIdVal 
AND NOT EXISTS 
(SELECT * 
FROM (SELECT	*, ROW_NUMBER() OVER(PARTITION BY registration_id 
                ORDER BY edit_moment DESC) rn 
      FROM	dbo.SDE_branch_tables_modified 
      WHERE branch_id = @branchIdVal 
        AND registration_id = @regIdVal) __a 
WHERE rn = 1 
  AND __bm.branch_id = __a.branch_id 
  AND __bm.registration_id = __a.registration_id 
  AND __bm.edit_moment = __a.edit_moment) 

UPDATE dbo.SDE_branch_tables_modified 
SET edit_moment = @reconcileMomentVal 
WHERE branch_id = @branchIdVal 
  AND registration_id = @regIdVal
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_branch_modified_def_reconcile_regid] TO PUBLIC
    AS [dbo];

