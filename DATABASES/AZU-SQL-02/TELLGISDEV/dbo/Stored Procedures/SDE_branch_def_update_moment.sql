﻿CREATE PROCEDURE dbo.SDE_branch_def_update_moment 
@branchIdVal INTEGER, @momentVal DATETIME2 AS SET NOCOUNT ON 
DECLARE @result INTEGER
SET @result = 0 /* SE_SUCCESS */ 
IF @branchIdval = 0 
  SET @result = -25 /* SE_NO_PERMISSIONS */ 
ELSE
BEGIN
  UPDATE dbo.SDE_branches SET branch_moment = @momentVal WHERE branch_id = @branchIdVal 
  IF @@ROWCOUNT = 0 
    SET @result = -587 /* SE_BRANCH_NOEXIST */ 
END
RETURN @result
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_branch_def_update_moment] TO PUBLIC
    AS [dbo];

