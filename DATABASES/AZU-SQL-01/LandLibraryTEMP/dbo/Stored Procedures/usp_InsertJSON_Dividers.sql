

CREATE PROC [dbo].[usp_InsertJSON_Dividers] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.Dividers;
	INSERT INTO dbo.Dividers
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