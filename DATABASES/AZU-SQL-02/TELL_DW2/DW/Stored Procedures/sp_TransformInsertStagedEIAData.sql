/******************************
** Name:  sp_TransformInsertStagedEIAData
** Desc:
** Auth:  Aaron Vogt
** Date:  01/28/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    01/28/2020   Aaron     Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedEIAData] AS
BEGIN

IF OBJECT_ID('tempdb..#StagedHeaderData') IS NOT NULL DROP TABLE #StagedHeaderData
	SELECT 
		HASHBYTES('SHA2_256', 
								CONVERT(VARCHAR(200), ISNULL([SeriesID],'')) + '|' +
								CONVERT(VARCHAR(200), ISNULL([OperatorID],'')) + '|' +
								CONVERT(VARCHAR(200), ISNULL([RegulatorCode],'')) + '|' +
								CONVERT(VARCHAR(200), ISNULL([MeterID],'')) + '|' +
								CONVERT(VARCHAR(200), ISNULL([Location],'')) + '|' +
								CONVERT(VARCHAR(200), ISNULL([Direction],'')) + '|' +
								CONVERT(VARCHAR(200), ISNULL([UnitOfMeasure],''))) AS TimeSeriesHashKey,
		[SeriesID],
		[OperatorID],
		[RegulatorCode],
		[MeterID],
		[Location],
		[Direction],
		[UnitOfMeasure],
		[RowNumber],
		ROW_NUMBER() OVER (ORDER BY RowNumber) AS RowNumberSequence
	INTO
		#StagedHeaderData
	FROM
		[DW].[vw_EIATimeSeriesHubStageData]

INSERT INTO [DW].[HubTimeSeries]
(
	[TimeSeriesHashKey],
	[RecordSource],
	[LoadDate],
	[SeriesID],
	[OperatorID],
	[RegulatorCode],
	[MeterID],
	[Location],
	[Direction],
	[UnitOfMeasure]
)
SELECT
	stg.[TimeSeriesHashKey],
	'EIA Bulk Data' AS [RecordSource],
	GETDATE() AS [LoadDate],
	stg.[SeriesID],
	stg.[OperatorID],
	stg.[RegulatorCode],
	stg.[MeterID],
	stg.[Location],
	stg.[Direction],
	stg.[UnitOfMeasure]
FROM
	#StagedHeaderData stg
LEFT JOIN
	DW.HubTimeSeries hub
ON
	stg.TimeSeriesHashKey = hub.TimeSeriesHashKey
WHERE
	hub.SeriesID IS NULL AND
	(LEFT(stg.SeriesID, 3) = 'IEO' OR LEFT(stg.SeriesID, 2) = 'NG')

IF OBJECT_ID('tempdb..#StagedCurveData') IS NOT NULL DROP TABLE #StagedCurveData

SELECT
	startheader.TimeSeriesHashKey,
	CONVERT(DATETIME2(7), Column2) AS StartDate,
	CONVERT(DATETIME2(7), NULL) AS EndDate,
	CONVERT(NUMERIC(38, 16), Column3) AS Value
INTO
	#StagedCurveData
FROM
	#StagedHeaderData startheader
INNER JOIN
	#StagedHeaderData endheader
ON
	startheader.RowNumberSequence + 1 = endheader.RowNumberSequence
INNER JOIN
	StageEIA.RawEIATimeSeries stg
ON
	stg.RowNumber BETWEEN startheader.[RowNumber] + 1 AND endheader.[RowNumber] - 1 AND
	(LEFT(startheader.SeriesID, 2) = 'NG' OR LEFT(startheader.SeriesID, 3) = 'IEO') AND
	(LEFT(endheader.SeriesID, 2) = 'NG' OR LEFT(endheader.SeriesID, 3) = 'IEO') AND
	(ISDATE(stg.Column2) = 1 OR ISNUMERIC(stg.Column2) = 1) AND
	ISNUMERIC(stg.Column3) = 1

INSERT INTO DW.SatTimeSeries
(
	TimeSeriesHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	StartDate,
	EndDate,
	Value
)
SELECT
	stg.TimeSeriesHashKey,
	'EIA NG Bulk Data' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	CONVERT(DATETIME2(7), stg.StartDate),
	CONVERT(DATETIME2(7), stg.EndDate),
	CONVERT(NUMERIC(38, 16), stg.Value)
FROM
	#StagedCurveData stg
LEFT JOIN
	DW.SatTimeSeries sat
ON
	stg.TimeSeriesHashKey = sat.TimeSeriesHashKey AND
	stg.StartDate = sat.StartDate
WHERE
	sat.TimeSeriesHashKey IS NULL


END