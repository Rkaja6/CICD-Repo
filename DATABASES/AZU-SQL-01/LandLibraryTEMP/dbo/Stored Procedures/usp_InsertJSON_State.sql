

CREATE PROC [dbo].[usp_InsertJSON_State] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.State;
	INSERT INTO dbo.State
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