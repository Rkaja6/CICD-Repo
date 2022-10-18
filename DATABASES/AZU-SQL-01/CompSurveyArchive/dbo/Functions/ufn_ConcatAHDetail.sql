


CREATE FUNCTION [dbo].[ufn_ConcatAHDetail]	
	(@Scope nvarchar(280), @ScopeCriteria nvarchar(280))
RETURNS nvarchar(280)
AS
BEGIN
	
	DECLARE @Detail nvarchar(280)

	SET @Detail = 
	CASE WHEN (@Scope IS NULL AND @ScopeCriteria IS NULL) THEN NULL
	ELSE
		CASE WHEN @Scope = @ScopeCriteria 
			THEN @Scope
			ELSE CONCAT(@Scope, '-', @ScopeCriteria)
		END
	END;

	RETURN @Detail

END