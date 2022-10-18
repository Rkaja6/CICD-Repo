

CREATE PROC [dbo].[usp_InsertJSON_Lessees] @jsonInput AS nvarchar(max)
AS
BEGIN
	TRUNCATE TABLE dbo.Lessees;
	INSERT INTO dbo.Lessees
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