CREATE PROCEDURE dbo.SDE_branch_def_update_owner 
@branchIdVal INTEGER, @ownerVal NVARCHAR(255) 
AS SET NOCOUNT ON 
DECLARE @result INTEGER, @resultCount INTEGER, @resultError INTEGER 
SET @result = 0 /* SE_SUCCESS */ 
IF @branchIdVal = 0 
  SET @result = -25 /* SE_NO_PERMISSIONS */ 
ELSE
BEGIN
  UPDATE dbo.SDE_branches SET owner = @ownerVal WHERE branch_id = @branchIdVal 
  SELECT @resultCount = @@ROWCOUNT, @resultError = @@ERROR 
  IF @resultError > 0 
    SET @result = -586 /* SE_BRANCH_EXISTS */ 
  ELSE IF @resultCount = 0 
    SET @result = -587 /* SE_BRANCH_NOEXIST */ 
END
RETURN @result
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_branch_def_update_owner] TO PUBLIC
    AS [dbo];

