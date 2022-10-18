CREATE FUNCTION dbo.retrieve_guid () RETURNS NVARCHAR(38)
BEGIN
  RETURN(SELECT guidstr from dbo.SDE_generate_guid )
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[retrieve_guid] TO PUBLIC
    AS [dbo];

