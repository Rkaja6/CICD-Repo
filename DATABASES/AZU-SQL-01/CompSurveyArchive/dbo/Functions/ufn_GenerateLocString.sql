



CREATE FUNCTION [dbo].[ufn_GenerateLocString]	
	(@City nvarchar(280), @State nvarchar(280), @SubRegion nvarchar(280), @Region nvarchar(280))
RETURNS nvarchar(280)
AS
BEGIN
	
	DECLARE @Location nvarchar(280)

	SET @Location = 
	
CASE WHEN (@City IS NULL AND @State IS NULL AND @SubRegion IS NULL AND @Region IS NULL) THEN NULL 
ELSE 
	CASE WHEN @City like 'All %' OR @City = '--' OR @City = '''--' OR @City IS NULL THEN 
		CASE WHEN @State like 'All %' OR @State = '--' OR @State = '''--' OR @State IS NULL  THEN 
			CASE WHEN @SubRegion like 'All %' OR @SubRegion = '--' OR @SubRegion = '''--' OR @SubRegion IS NULL THEN @Region
			ELSE @SubRegion
			END
		ELSE @State
		END
		ELSE 
			CASE WHEN @State like 'All %' OR @State IS NULL OR @State = '--' OR @State = '''--' THEN
				@City
			ELSE CONCAT(@City, ' - ', @State)
		END
	END
END;

	RETURN @Location

END