

CREATE PROC [dbo].[usp_InsertJSON_DocTypes] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.DocTypes;
	INSERT INTO dbo.DocTypes
		(
		[Id],
	[Title],
	[ShortName]
		  ) 
	SELECT *  
	FROM OPENJSON(@jsonInput) 
	WITH 
	(
[Id] int ,
[Title] varchar(200),
[ShortName] varchar(10)
	)
		
END