


CREATE PROC [stage].[usp_UploadExcelMetadata] @json AS nvarchar(max)
AS
BEGIN
TRUNCATE TABLE stage.ExcelMetadata;

	INSERT INTO stage.ExcelMetadata 
		(
		[Name],
		[Folder Path],
		[SheetName],
		[LoadFlag]
		) 
	SELECT 
		[Name],
		[Folder Path],
		[SheetName],
		0 AS [LoadFlag]
	FROM OPENJSON(@json) 
	WITH (
		[Name] [varchar](280) ,
		[Folder Path] [varchar](280) ,
		[SheetName] [varchar](280)
		)
END