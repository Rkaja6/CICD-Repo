


CREATE FUNCTION [dbo].[ufn_ConvertPctString]	(@InputString nvarchar(280)
)
RETURNS numeric(18,2)
AS
BEGIN
	
	DECLARE @ReturnNum numeric(18,2)

	SET @ReturnNum = TRY_CAST(@InputString AS numeric(18,2)) * 100

	RETURN @ReturnNum

END