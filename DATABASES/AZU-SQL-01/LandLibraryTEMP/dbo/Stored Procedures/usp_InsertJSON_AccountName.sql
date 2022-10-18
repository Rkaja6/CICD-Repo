


CREATE PROC [dbo].[usp_InsertJSON_AccountName] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.AccountName;
	INSERT INTO dbo.AccountName
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