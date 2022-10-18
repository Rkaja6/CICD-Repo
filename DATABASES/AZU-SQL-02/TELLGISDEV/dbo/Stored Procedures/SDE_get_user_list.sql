CREATE PROCEDURE dbo.SDE_get_user_list
WITH EXECUTE AS OWNER
AS
SELECT USER_NAME(principal_id) as user_name ,type  FROM sys.database_principals WHERE is_fixed_role <> 1 AND USER_NAME(principal_id) <> 'dbo'
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SDE_get_user_list] TO PUBLIC
    AS [dbo];

