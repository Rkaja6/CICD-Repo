

CREATE FUNCTION [dbo].[ufn_ConvertAmtString]	(@InputString nvarchar(280)
)
RETURNS numeric(18,2)
AS
BEGIN
	
	DECLARE @ReturnNum numeric(18,2)

	SET @ReturnNum = TRY_CAST(REPLACE(REPLACE(@InputString,',',''),'%','') AS numeric(18,2))

	RETURN @ReturnNum

END