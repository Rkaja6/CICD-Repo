

CREATE PROC [dbo].[usp_InsertJSON_Operators] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.Operators;
	INSERT INTO dbo.Operators
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