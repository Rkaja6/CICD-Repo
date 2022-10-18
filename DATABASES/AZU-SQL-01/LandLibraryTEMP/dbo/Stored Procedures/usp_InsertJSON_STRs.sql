

CREATE PROC [dbo].[usp_InsertJSON_STRs] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.STRs;
	INSERT INTO dbo.STRs
		(
		[Id],
	[Title]
		  ) 
	SELECT *  
	FROM OPENJSON(@jsonInput) 
	WITH 
	(
[Id] int ,
[Title] varchar(200)
	)
		
END