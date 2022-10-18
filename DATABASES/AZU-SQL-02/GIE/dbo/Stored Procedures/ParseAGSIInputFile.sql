
CREATE PROCEDURE [dbo].[ParseAGSIInputFile]
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
MERGE dbo.AGSI AS Destination
USING
(
SELECT @eicCode AS [EICCode], *
FROM OPENJSON (@JSON) 
WITH (
[status] VARCHAR(100),
[gasDayStartedOn] VARCHAR(100),
[gasInStorage] VARCHAR(100),
[full] VARCHAR(100),
[trend] VARCHAR(100),
[injection] VARCHAR(100),
[withdrawal] VARCHAR(100),
[workingGasVolume] VARCHAR(100),
[injectionCapacity] VARCHAR(100),
[withdrawalCapacity] VARCHAR(100),
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
Destination.[gasInStorage] = REPLACE(Source.[gasInStorage], '-', '0'),
Destination.[full] = REPLACE(Source.[full], '-', '0'),
Destination.[trend] = REPLACE(Source.[trend], '-', '0'),
Destination.[injection] = REPLACE(Source.[injection], '-', '0'),
Destination.[withdrawal] = REPLACE(Source.[withdrawal], '-', '0'),
Destination.[workingGasVolume] = REPLACE(Source.[workingGasVolume], '-', '0'),
Destination.[injectionCapacity] = REPLACE(Source.[injectionCapacity], '-', '0'),
Destination.[withdrawalCapacity] = REPLACE(Source.[withdrawalCapacity], '-', '0'),
Destination.[info] = Source.[info],
Destination.[DateUpdated] = GETDATE()
WHEN NOT MATCHED THEN
INSERT
(
[EICCode],
[status],
[gasDayStartedOn],
[gasInStorage],
[full],
[trend],
[injection],
[withdrawal],
[workingGasVolume],
[injectionCapacity],
[withdrawalCapacity],
[info]
)
VALUES
(
Source.[EICCode],
Source.[status],
Source.[gasDayStartedOn],
REPLACE(Source.[gasInStorage], '-', '0'),
REPLACE(Source.[full], '-', '0'),
REPLACE(Source.[trend], '-', '0'),
REPLACE(Source.[injection], '-', '0'),
REPLACE(Source.[withdrawal], '-', '0'),
REPLACE(Source.[workingGasVolume], '-', '0'),
REPLACE(Source.[injectionCapacity], '-', '0'),
REPLACE(Source.[withdrawalCapacity], '-', '0'),
Source.[info]
);
--END

END