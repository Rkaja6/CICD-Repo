


CREATE FUNCTION [dbo].[ufn_ConcatTWJobTitleCode]	
	(@Function nvarchar(280), @Level nvarchar(280))
RETURNS nvarchar(280)
AS
BEGIN
	
	DECLARE @Concat nvarchar(280)

	SET @Concat = 
	CASE WHEN (@Function IS NULL AND @Level IS NULL) THEN NULL 
	ELSE CONCAT(@Function, '-', @Level)
	END;

	RETURN @Concat

END