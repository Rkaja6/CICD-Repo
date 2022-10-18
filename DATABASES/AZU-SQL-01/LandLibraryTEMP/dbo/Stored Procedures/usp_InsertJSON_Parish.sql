

CREATE PROC [dbo].[usp_InsertJSON_Parish] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.Parish;
	INSERT INTO dbo.Parish
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