

/* Created By Aaron Vogt 1/7/2020 */
CREATE PROCEDURE [dbo].[ENTSOGProcessOperationalData]
	@InputFileName VARCHAR(1000)
AS
BEGIN
	DECLARE @columnNumber int
	DECLARE @sqlStatement nvarchar(max)
	DECLARE @columnName varchar(255)
	DECLARE @columnNameStatement nvarchar(max)
	SET @sqlStatement = 'SELECT RowNumber, '
	SET @columnNumber = 1
	WHILE @columnNumber <= 300
	BEGIN
		SET @columnNameStatement = 'SELECT @columnName = [Column' + CONVERT(VARCHAR, @columnNumber) + '] FROM StagingTable WHERE RowNumber = 1'
		EXEC sp_ExecuteSQL @columnNameStatement, N'@columnName VARCHAR(255) OUT', @columnName=@columnName OUT
		
		IF @columnName IS NOT NULL
			SET @sqlStatement = @sqlStatement + '[Column' + CONVERT(VARCHAR(10), @columnNumber) + '] AS [' + @columnName + '],'
		SET @columnNumber = @columnNumber + 1
	END
	SET @sqlStatement = LEFT(@sqlStatement, LEN(@sqlStatement) -1) + ' INTO ##MappedStagingTable FROM dbo.StagingTable'

	IF OBJECT_ID('tempdb..##MappedStagingTable') IS NOT NULL DROP TABLE ##MappedStagingTable
	PRINT @sqlStatement
	EXEC sp_executeSQL @sqlStatement

	MERGE dbo.OperationalData AS Destination
	USING
	(
SELECT
	   [id]
      ,[dataSet]
      ,[indicator]
      ,[periodType]
      ,[periodFrom]
      ,[periodTo]
      ,[operatorKey]
      ,[tsoEicCode]
      ,[operatorLabel]
      ,[pointKey]
      ,[pointLabel]
      ,[tsoItemIdentifier]
      ,[directionKey]
      ,[unit]
      ,[itemRemarks]
      ,[generalRemarks]
      ,[value]
      ,[lastUpdateDateTime]
      ,CASE
			WHEN ISNUMERIC(LEFT([isUnlimited], 10)) <> 1 THEN NULL
			ELSE CONVERT(SMALLINT, [isUnlimited])
		END AS [isUnlimited]
      ,[flowStatus]
      ,[interruptionType]
      ,[restorationInformation]
      ,[capacityType]
      ,[capacityBookingStatus]
      ,CASE
			WHEN ISNUMERIC(LEFT([isCamRelevant], 10)) <> 1 THEN NULL
			ELSE CONVERT(SMALLINT, [isCamRelevant])
		END AS [isCamRelevant]
      ,[isNA]
      ,[originalPeriodFrom]
	  ,CASE
			WHEN ISNUMERIC(LEFT([isCmpRelevant], 10)) <> 1 THEN NULL
			ELSE CONVERT(SMALLINT, [isCmpRelevant])
		END AS [isCmpRelevant]
      ,[bookingPlatformKey]
      ,[bookingPlatformLabel]
      ,[bookingPlatformURL]
FROM
(SELECT
	   [id]
      ,[dataSet]
      ,[indicator]
      ,[periodType]
      ,[periodFrom]
      ,[periodTo]
      ,[operatorKey]
      ,[tsoEicCode]
      ,[operatorLabel]
      ,[pointKey]
      ,[pointLabel]
      ,[tsoItemIdentifier]
      ,[directionKey]
      ,[unit]
      ,[itemRemarks]
      ,[generalRemarks]
      ,[value]
      ,[lastUpdateDateTime]
      ,[isUnlimited]
      ,[flowStatus]
      ,[interruptionType]
      ,[restorationInformation]
      ,[capacityType]
      ,[capacityBookingStatus]
      ,[isCamRelevant]
      ,[isNA]
      ,[originalPeriodFrom]
      ,[isCmpRelevant]
      ,[bookingPlatformKey]
      ,[bookingPlatformLabel]
      ,[bookingPlatformURL],
ROW_NUMBER() OVER (PARTITION BY id ORDER BY CONVERT(DATETIME, lastUpdateDateTime) DESC) seq 
  FROM ##MappedStagingTable
  WHERE RowNumber > 1) a
WHERE seq = 1
) AS Source
	ON
		Source.[ID] = Destination.[ID]
	WHEN MATCHED THEN
		UPDATE SET
			Destination.[id] = Source.[id], 
			Destination.[dataSet] = Source.[dataSet], 
			Destination.[indicator] = Source.[indicator], 
			Destination.[periodType] = Source.[periodType], 
			Destination.[periodFrom] = Source.[periodFrom], 
			Destination.[periodTo] = Source.[periodTo], 
			Destination.[operatorKey] = Source.[operatorKey], 
			Destination.[tsoEicCode] = Source.[tsoEicCode], 
			Destination.[operatorLabel] = Source.[operatorLabel], 
			Destination.[pointKey] = Source.[pointKey], 
			Destination.[pointLabel] = Source.[pointLabel], 
			Destination.[tsoItemIdentifier] = Source.[tsoItemIdentifier], 
			Destination.[directionKey] = Source.[directionKey], 
			Destination.[unit] = Source.[unit], 
			Destination.[itemRemarks] = Source.[itemRemarks], 
			Destination.[generalRemarks] = Source.[generalRemarks], 
			Destination.[value] = Source.[value], 
			Destination.[lastUpdateDateTime] = Source.[lastUpdateDateTime], 
			Destination.[isUnlimited] = Source.[isUnlimited], 
			Destination.[flowStatus] = Source.[flowStatus], 
			Destination.[interruptionType] = Source.[interruptionType], 
			Destination.[restorationInformation] = Source.[restorationInformation], 
			Destination.[capacityType] = Source.[capacityType], 
			Destination.[capacityBookingStatus] = Source.[capacityBookingStatus], 
			Destination.[isCamRelevant] = Source.[isCamRelevant], 
			Destination.[isNA] = Source.[isNA], 
			Destination.[originalPeriodFrom] = Source.[originalPeriodFrom], 
			Destination.[isCmpRelevant] = Source.[isCmpRelevant], 
			Destination.[bookingPlatformKey] = Source.[bookingPlatformKey], 
			Destination.[bookingPlatformLabel] = Source.[bookingPlatformLabel], 
			Destination.[bookingPlatformURL] = Source.[bookingPlatformURL]
		WHEN NOT MATCHED THEN
			INSERT
		(
                [id], 
                [dataSet], 
                [indicator], 
                [periodType], 
                [periodFrom], 
                [periodTo], 
                [operatorKey], 
                [tsoEicCode], 
                [operatorLabel], 
                [pointKey], 
                [pointLabel], 
                [tsoItemIdentifier], 
                [directionKey], 
                [unit], 
                [itemRemarks], 
                [generalRemarks], 
                [value], 
                [lastUpdateDateTime], 
                [isUnlimited], 
                [flowStatus], 
                [interruptionType], 
                [restorationInformation], 
                [capacityType], 
                [capacityBookingStatus], 
                [isCamRelevant], 
                [isNA], 
                [originalPeriodFrom], 
                [isCmpRelevant], 
                [bookingPlatformKey], 
                [bookingPlatformLabel], 
                [bookingPlatformURL]
		) 
		VALUES
		(
              Source.[id], 
              Source.[dataSet], 
              Source.[indicator], 
              Source.[periodType], 
              Source.[periodFrom], 
              Source.[periodTo], 
              Source.[operatorKey], 
              Source.[tsoEicCode], 
              Source.[operatorLabel], 
              Source.[pointKey], 
              Source.[pointLabel], 
              Source.[tsoItemIdentifier], 
              Source.[directionKey], 
              Source.[unit], 
              Source.[itemRemarks], 
              Source.[generalRemarks], 
              Source.[value], 
              Source.[lastUpdateDateTime], 
              Source.[isUnlimited], 
              Source.[flowStatus], 
              Source.[interruptionType], 
              Source.[restorationInformation], 
              Source.[capacityType], 
              Source.[capacityBookingStatus], 
              Source.[isCamRelevant], 
              Source.[isNA], 
              Source.[originalPeriodFrom], 
              Source.[isCmpRelevant], 
              Source.[bookingPlatformKey], 
              Source.[bookingPlatformLabel], 
              Source.[bookingPlatformURL]
		);
			

END