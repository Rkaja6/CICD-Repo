CREATE PROCEDURE MergeAGSIStagedData
AS
BEGIN
MERGE dbo.AGSI AS Destination
USING
(
SELECT
      [Column2] AS name
      ,LEFT([Column4], 100) AS EICCode
      ,[Column6] AS url
      ,LEFT([Column8], 100) AS gasDayStartedOn
      ,LEFT([Column10], 100) AS gasInStorage
      ,LEFT([Column12], 100) AS injection
      ,LEFT([Column14], 100) AS withdrawal
      ,LEFT([Column16], 100) AS workingGasVolume
      ,LEFT([Column18], 100) AS injectionCapacity
      ,LEFT([Column20], 100) AS withdrawalCapacity
      ,LEFT([Column22], 100) AS status
      ,LEFT([Column24], 100) AS trend
      ,LEFT([Column26], 100) AS [full]
      ,REPLACE(REPLACE(LEFT([Column27], 107), 'info[', ''), ']', '') AS info
 FROM [GIE].[dbo].[StagingTable]
 WHERE Column1 = 'name'
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
[info],
[DateUpdated]
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
Source.[info],
GETDATE()
);
END