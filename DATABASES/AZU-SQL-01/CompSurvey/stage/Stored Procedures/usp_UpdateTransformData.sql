






CREATE PROC [stage].[usp_UpdateTransformData]
AS
BEGIN
	-- Create table variable to store file/sheetnames for interating over
	DECLARE @SurveyList Table
	(
	FileName NVARCHAR(280),
	SheetName NVARCHAR(280)
	);

	INSERT INTO @SurveyList
	SELECT DISTINCT FileName, SheetName from stage.LoadedFileInfo;

	-- Declare variables to store the specific file and sheet names for each iteration
	DECLARE @filename NVARCHAR(280), @sheetname NVARCHAR(280);

	-- Clean up previous data
	TRUNCATE TABLE stage.TransformData;

	-- Set up loop
	WHILE EXISTS (SELECT * FROM @SurveyList)
	BEGIN
		
		-- Set up variables
		DECLARE 
			@sql  NVARCHAR(MAX) = N'',
			@cols NVARCHAR(MAX) = N'';
		SELECT TOP 1
			@filename = Filename,
			@sheetname = SheetName
		FROM @SurveyList;
		
		SELECT
			@cols += ', ' + ColumnNumber + ' as ' + QUOTENAME(ColumnName)
		FROM stage.ColumnMapping
		WHERE filename = @filename
			AND sheetname = @sheetname;

		-- Insert only the columns identified by the ColumnMapping table into the Stage.TransformData table 
		SELECT
			@sql = 
			N'INSERT INTO stage.TransformData
			SELECT 
				A.rownumber as [Index], 
				B.EffDate as [Effective Date],
				A.filename as [Source], 
				A.sheetname as [TabName]' 
				+ @cols + ', 
				GETDATE() as CreatedDate
			FROM stage.StagingTable A
			LEFT JOIN stage.LoadedFileInfo B
			ON A.filename = B.filename
			AND A.sheetname = B.sheetname
			WHERE A.RowNumber > B.HeaderRowNumber
			AND A.filename = ' + QUOTENAME(@filename,'''') + 
			' AND A.sheetname = ' + QUOTENAME(@sheetname,'''');
		--PRINT(@sql)
		EXEC(@sql);

		-- Delete the processed row from the table to advance to the next row
		DELETE FROM @SurveyList WHERE FileName = @filename and SheetName = @sheetname;
	
	END
	
	-- Make some updates in place by combining columns for the [Rev Responsibility-Location-Other] field:
	UPDATE T
		SET 
			[Job Title] = [dbo].[ufn_ConcatTWJobTitleCode]([Function], [Level]),
			[Job Code] = [dbo].[ufn_ConcatTWJobTitleCode]([Function Code], [Level Code])
	FROM stage.TransformData T
	LEFT JOIN dbo.Code_Source S
	ON T.Source = S.Source
	AND T.TabName = S.TabName
	WHERE S.PublisherCode = 'TW' and S.TypeCode = 'CHEM'

	UPDATE T
		SET 
			[Rev Responsibility-Location-Other] = [dbo].[ufn_ConcatAHDetail]([Rev Responsibility-Location-Other], [AonHewitt Scope Desc])
	FROM stage.TransformData T
	LEFT JOIN dbo.Code_Source S
	ON T.Source = S.Source
	AND T.TabName = S.TabName
	WHERE S.PublisherCode = 'AH' and S.TypeCode = 'ENG'
	
	-- Warning! Unlike the previous transformations, the ones below are not easily reversible. And you can't just run it over again to fix something--it's fundmentally additive.

	UPDATE T
		SET [Rev Responsibility-Location-Other] =
			CASE WHEN [Rev Responsibility-Location-Other] LIKE 'All%' OR [Rev Responsibility-Location-Other] IS NULL OR [Rev Responsibility-Location-Other] = '--' OR [Rev Responsibility-Location-Other] = '''--' 
			THEN  [dbo].[ufn_ConcatTWDetail]([dbo].[ufn_GenerateLocString]([Metropolitan Area], [State], [Sub Region], [Region]), [Specialty], [Type of Operations], [Union Status], [Specialization])
			ELSE [Rev Responsibility-Location-Other] END
	FROM stage.TransformData T
	LEFT JOIN dbo.Code_Source S
	ON T.Source = S.Source
	AND T.TabName = S.TabName
	WHERE S.PublisherCode = 'TW'

	UPDATE T
		SET 
			[Job Title] = [dbo].[ufn_ExtractTWTechLevelName]([Job Code])
	FROM stage.TransformData T
	LEFT JOIN dbo.Code_Source S
	ON T.Source = S.Source
	AND T.TabName = S.TabName
	WHERE S.PublisherCode = 'TW' and S.TypeCode in ('TECH') and [Job Title] IS NULL

	UPDATE T
		SET 
			[Job Code] = [dbo].[ufn_ExtractTWTechLevelCode]([Job Code])
	FROM stage.TransformData T
	LEFT JOIN dbo.Code_Source S
	ON T.Source = S.Source
	AND T.TabName = S.TabName
	WHERE S.PublisherCode = 'TW' and S.TypeCode in ('TECH') and CHARINDEX(' - ',[Job Code]) > 0

	UPDATE T
		SET 
			[Job Title] = [dbo].[ufn_ConcatTWJobTitleCode]([Job Title],[dbo].[ufn_ExtractTWTechLevelName]([Level])),
			[Job Code] = [dbo].[ufn_ConcatTWJobTitleCode]([Job Code],[dbo].[ufn_ExtractTWTechLevelCode]([Level]))
	FROM stage.TransformData T
	LEFT JOIN dbo.Code_Source S
	ON T.Source = S.Source
	AND T.TabName = S.TabName
	WHERE S.PublisherCode = 'TW' and S.TypeCode in ('TECH') 

	UPDATE T
		SET Industry = LTRIM(RTRIM(Industry))
	FROM stage.TransformData T
END