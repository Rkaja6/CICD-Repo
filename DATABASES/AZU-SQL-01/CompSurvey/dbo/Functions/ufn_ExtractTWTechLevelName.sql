


CREATE FUNCTION [dbo].[ufn_ExtractTWTechLevelName]	
	(@Level nvarchar(280))
RETURNS nvarchar(280)
AS
BEGIN
	
	DECLARE 
		@Name nvarchar(280),
		@Delim nvarchar(10) = N'-';

	SELECT 
		@Name = t.value
	FROM 
		(
		SELECT 
		value, 
-- this is needed so we have something in the Order by clause
-- surround the value and the input string in the delimiter so we don't have a problem with the 1st or last entry in the list
		CHARINDEX(@Delim + value + @Delim,@Delim + @Level + @Delim) as idx 
		FROM STRING_SPLIT(@Level, @Delim) 
		) t
	ORDER BY idx ASC
	OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;
	
	RETURN LTRIM(RTRIM(@Name))

END