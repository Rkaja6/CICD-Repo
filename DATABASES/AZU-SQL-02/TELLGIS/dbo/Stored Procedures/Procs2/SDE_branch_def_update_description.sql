CREATE PROCEDURE dbo.SDE_branch_def_update_description 
@branchIdVal INTEGER, @descVal NVARCHAR(64) 
AS SET NOCOUNT ON 
DECLARE @result INTEGER
SET @result = 0 /* SE_SUCCESS */ 
IF @branchIdval = 0 
  SET @result = -25 /* SE_NO_PERMISSIONS */ 
ELSE
BEGIN
  UPDATE dbo.SDE_branches SET description = @descVal WHERE branch_id = @branchIdVal 
  IF @@ROWCOUNT = 0 
    SET @result = -587 /* SE_BRANCH_NOEXIST */ 
END
RETURN @result
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_branch_def_update_description] TO PUBLIC
    AS [dbo];

