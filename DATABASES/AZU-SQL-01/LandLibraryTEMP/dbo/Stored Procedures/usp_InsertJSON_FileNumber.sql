

CREATE PROC [dbo].[usp_InsertJSON_FileNumber] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.FileNumber;
	INSERT INTO dbo.FileNumber
		(
		[Id],
	[Title] ,
	[LegacyNumber]
		  ) 
	SELECT *  
	FROM OPENJSON(@jsonInput) 
	WITH 
	(
[Id] int ,
[Title] varchar(200),
[LegacyNumber] varchar(2000)
	)
		
END