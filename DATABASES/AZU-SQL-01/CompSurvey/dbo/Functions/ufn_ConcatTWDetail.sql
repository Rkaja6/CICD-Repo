





CREATE FUNCTION [dbo].[ufn_ConcatTWDetail]	
	(@Location nvarchar(280), @Specialty nvarchar(280), @TypeOfOp nvarchar(280), @UnionStatus nvarchar(280), @Specialization nvarchar(280))
RETURNS nvarchar(280)
AS
BEGIN
	
	DECLARE @Detail nvarchar(280)

	SET @Detail =
	
	CASE WHEN (@Location IS NULL AND @Specialty IS NULL AND @TypeOfOp IS NULL AND @UnionStatus IS NULL AND @Specialization IS NULL) THEN NULL 
	ELSE 
		CASE WHEN @Location IS NULL OR @Location = '--' OR @Location = '''--' THEN '' ELSE @Location END + 
		CASE WHEN @Specialty IS NULL OR @Specialty = '--' OR @Specialty = '''--' THEN '' ELSE '_' + @Specialty END + 
		CASE WHEN @TypeOfOp IS NULL OR @TypeOfOp = '--' OR @TypeOfOp = '''--' THEN '' ELSE '_' + @TypeOfOp END + 
		CASE WHEN @UnionStatus IS NULL OR @UnionStatus = '--' OR @UnionStatus = '''--' THEN '' ELSE '_' + @UnionStatus END +
		CASE WHEN @Specialization IS NULL OR @Specialization = '--' OR @Specialization = '''--' THEN '' ELSE '_' + @Specialization END 
	END;

	RETURN @Detail

END