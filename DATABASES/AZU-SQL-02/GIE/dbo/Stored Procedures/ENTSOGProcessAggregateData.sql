


/* Created By Dee Glazebrook 6/1/2020 */
CREATE PROCEDURE [dbo].[ENTSOGProcessAggregateData]
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

	MERGE dbo.AggregateData AS Destination
	USING
	(
SELECT
	   [id]
      ,[dataSet]
	  ,[dataSetLabel]
      ,[indicator]
      ,[periodType]
      ,[periodFrom]
      ,[periodTo]
	  ,[countryKey]
	  ,[countryLabel]
	  ,[bzKey]
	  ,[bzShort]
	  ,[bzLong]
      ,[operatorKey]
      ,[operatorLabel]
      ,[tsoEicCode]
	  ,[directionKey]
      ,[adjacentSystemsKey]
	  ,[adjacentSystemsLabel]
	  ,[year]
	  ,[month]
	  ,[day]
	  ,[unit]
      ,[value]
	  ,[countPointPresents]
	  ,[flowStatus]
	  ,[pointsNames]
      ,[lastUpdateDateTime]
FROM
(SELECT
	   [id]
      ,[dataSet]
	  ,[dataSetLabel]
      ,[indicator]
      ,[periodType]
      ,[periodFrom]
      ,[periodTo]
	  ,[countryKey]
	  ,[countryLabel]
	  ,[bzKey]
	  ,[bzShort]
	  ,[bzLong]
      ,[operatorKey]
      ,[operatorLabel]
	  ,[tsoEicCode]
      ,[directionKey]
      ,[adjacentSystemsKey]
	  ,[adjacentSystemsLabel]
	  ,[year]
	  ,[month]
	  ,[day]
	  ,[unit]
      ,[value]
	  ,[countPointPresents]
	  ,[flowStatus]
	  ,[pointsNames]
      ,[lastUpdateDateTime],
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
			Destination.[dataSetLabel] = Source.[dataSetLabel],
			Destination.[indicator] = Source.[indicator], 
			Destination.[periodType] = Source.[periodType], 
			Destination.[periodFrom] = Source.[periodFrom], 
			Destination.[periodTo] = Source.[periodTo], 
			Destination.[countryKey] = Source.[countryKey],
			Destination.[countryLabel] = Source.[countryLabel],
			Destination.[bzKey] = Source.[bzKey],
			Destination.[bzShort] = Source.[bzShort],
			Destination.[bzLong] = Source.[bzLong],
			Destination.[operatorKey] = Source.[operatorKey],  
			Destination.[operatorLabel] = Source.[operatorLabel],
			Destination.[tsoEicCode] = Source.[tsoEicCode], 
			Destination.[directionKey] = Source.[directionKey], 
			Destination.[adjacentSystemsKey] = Source.[adjacentSystemsKey], 
			Destination.[adjacentSystemsLabel] = Source.[adjacentSystemsLabel], 
			Destination.[year] = Source.[year], 
			Destination.[month] = Source.[month], 
			Destination.[day] = Source.[day], 
			Destination.[unit] = Source.[unit], 
			Destination.[value] = Source.[value], 
			Destination.[countPointPresents] = Source.[countPointPresents], 
			Destination.[flowStatus] = Source.[flowStatus], 
			Destination.[pointsNames] = Source.[pointsNames], 
			Destination.[lastUpdateDateTime] = Source.[lastUpdateDateTime]
		WHEN NOT MATCHED THEN
			INSERT
		(
                [id]
			  ,[dataSet]
			  ,[dataSetLabel]
			  ,[indicator]
			  ,[periodType]
			  ,[periodFrom]
			  ,[periodTo]
			  ,[countryKey]
			  ,[countryLabel]
			  ,[bzKey]
			  ,[bzShort]
			  ,[bzLong]
			  ,[operatorKey]
			  ,[operatorLabel]
			  ,[tsoEicCode]
			  ,[directionKey]
			  ,[adjacentSystemsKey]
			  ,[adjacentSystemsLabel]
			  ,[year]
			  ,[month]
			  ,[day]
			  ,[unit]
			  ,[value]
			  ,[countPointPresents]
			  ,[flowStatus]
			  ,[pointsNames]
			  ,[lastUpdateDateTime]
		) 
		VALUES
		(
              Source.[id], 
              Source.[dataSet], 
			  Source.[dataSetLabel],
              Source.[indicator], 
              Source.[periodType], 
              Source.[periodFrom], 
              Source.[periodTo], 
			  Source.[countryKey],
			  Source.[countryLabel],
			  Source.[bzKey],
			  Source.[bzShort],
			  Source.[bzLong],
              Source.[operatorKey], 
              Source.[operatorLabel], 
			  Source.[tsoEicCode], 
              Source.[directionKey],
              Source.[adjacentSystemsKey],
			  Source.[adjacentSystemsLabel],
			  Source.[year],
			  Source.[month],
			  Source.[day],
			  Source.[unit], 
              Source.[value], 
			  Source.[countPointPresents],
			  Source.[flowStatus],
			  Source.[pointsNames],
              Source.[lastUpdateDateTime]
              
		);
			

END