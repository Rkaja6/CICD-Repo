CREATE PROCEDURE dbo.next_globalid
@guid NVARCHAR(38) OUTPUT
AS SET NOCOUNT ON
BEGIN
SELECT @guid =  '{' + CAST (NEWID() AS NVARCHAR(38)) + '}'
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[next_globalid] TO PUBLIC
    AS [dbo];

