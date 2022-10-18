
CREATE PROCEDURE [dbo].[ParseALSIInputFile]
@inputFile VARCHAR(8000)
AS
BEGIN
--SET @inputFile = 'F:\AIParE\AGSI\SSO_11XNERGIE------1_https---agsi-gie-eu-api-data-11XNERGIE------1-DE_20191210063659.json'

DECLARE @SQL VARCHAR(MAX)
IF OBJECT_ID('tempdb..##aieJSON') IS NOT NULL DROP TABLE ##aieJSON
CREATE TABLE ##aieJSON (Content VARCHAR(MAX) NULL) 

SET @SQL = 'INSERT INTO ##aieJSON (Content) SELECT BulkColumn FROM OPENROWSET'
SET @SQL = @SQL + '(BULK ''' + @inputFile + ''', SINGLE_CLOB) AS fileContent'

EXEC sp_sqlexec @SQL

DECLARE @filename VARCHAR(500)
DECLARE @fileType VARCHAR(20)
DECLARE @eicCode VARCHAR(50)
DECLARE @JSON VARCHAR(MAX)
DECLARE @filenamePosition INT

SET @filenamePosition = LEN(@inputFile) - CHARINDEX('\', REVERSE(@inputFile))
SET @filename = SUBSTRING(@inputFile, @filenamePosition + 2, LEN(@inputFile))
SET @filenamePosition = CHARINDEX('_', @filename)
SET @fileType = LEFT(@filename, @filenamePosition - 1)
SET @filename = SUBSTRING(@filename, @filenamePosition + 1, LEN(@filename))
SET @filenamePosition = CHARINDEX('_', @filename)
SET @eicCode = LEFT(@filename, @filenamePosition - 1)

PRINT @fileType
PRINT @eicCode
PRINT @filename

SELECT TOP 1 @JSON = Content FROM ##aieJSON

--IF @fileType = 'SSO'
--BEGIN
MERGE dbo.ALSI AS Destination
USING
(
SELECT @eicCode AS [EICCode], *
FROM OPENJSON (@JSON) 
WITH (
[status] VARCHAR(100),
[gasDayStartedOn] VARCHAR(100),
[lngInventory] VARCHAR(100),
[sendOut] VARCHAR(100),
[dtmi] VARCHAR(100),
[dtrs] VARCHAR(100),
[info] VARCHAR(100)
)
) AS Source
ON
(
	Source.EICCode = Destination.EICCode AND
	Source.gasDayStartedOn = Destination.gasDayStartedOn 
)
WHEN MATCHED THEN
UPDATE SET
Destination.[status] = Source.[status],
Destination.[gasDayStartedOn] = Source.[gasDayStartedOn],
Destination.[lngInventory] = REPLACE(Source.[lngInventory], '-', '0'),
Destination.[sendOut] = REPLACE(Source.[sendOut], '-', '0'),
Destination.[dtmi] = REPLACE(Source.[dtmi], '-', '0'),
Destination.[dtrs] = REPLACE(Source.[dtrs], '-', '0'),
Destination.[info] = Source.[info],
Destination.[DateUpdated] = GETDATE()
WHEN NOT MATCHED THEN
INSERT
(
[EICCode],
[status],
[gasDayStartedOn],
[lngInventory],
[sendOut],
[dtmi],
[dtrs],
[info]
)
VALUES
(
Source.[EICCode],
Source.[status],
Source.[gasDayStartedOn],
REPLACE(Source.[lngInventory], '-', '0'),
REPLACE(Source.[sendOut], '-', '0'),
REPLACE(Source.[dtmi], '-', '0'),
REPLACE(Source.[dtrs], '-', '0'),
Source.[info]
);
--END

END