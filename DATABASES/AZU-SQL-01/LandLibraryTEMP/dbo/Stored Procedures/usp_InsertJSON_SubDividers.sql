

CREATE PROC [dbo].[usp_InsertJSON_SubDividers] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.SubDividers;
	INSERT INTO dbo.SubDividers
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