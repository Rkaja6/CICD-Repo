CREATE FUNCTION dbo.check_mv_release () RETURNS VARCHAR(20)
BEGIN
  RETURN 'DEFAULT 1.0'
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[check_mv_release] TO PUBLIC
    AS [dbo];

