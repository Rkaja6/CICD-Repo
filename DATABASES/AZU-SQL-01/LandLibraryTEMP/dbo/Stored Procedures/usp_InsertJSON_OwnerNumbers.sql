

CREATE PROC [dbo].[usp_InsertJSON_OwnerNumbers] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.OwnerNumbers;
	INSERT INTO dbo.OwnerNumbers
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