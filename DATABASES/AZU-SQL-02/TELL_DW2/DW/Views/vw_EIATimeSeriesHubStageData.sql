/******************************
** Name: [vw_EIATimeSeriesHubStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  01/27/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    01/27/2020   Aaron     Object creation
*******************************/
CREATE VIEW [DW].[vw_EIATimeSeriesHubStageData] AS
SELECT
	SUBSTRING(Column1, 11, LEN(Column1) - 10) AS SeriesID,
	CASE
		WHEN LEFT(Column9, 7) = 'source:' THEN SUBSTRING(Column9, 8, LEN(Column9) - 6)
		WHEN LEFT(Column10, 7) = 'source:' THEN SUBSTRING(Column10, 8, LEN(Column10) - 6)
		WHEN LEFT(Column11, 7) = 'source:' THEN SUBSTRING(Column11, 8, LEN(Column11) - 6)
		WHEN LEFT(Column12, 7) = 'source:' THEN SUBSTRING(Column12, 8, LEN(Column12) - 6)
		ELSE NULL
	END AS OperatorID,
	NULL AS RegulatorCode,
	NULL AS MeterID,
	NULL AS Location,
	NULL AS Direction,
	REPLACE(CASE
		WHEN LEFT(Column6, 11) = 'unitsshort:' THEN SUBSTRING(Column6, 12, LEN(Column6) - 10)
		WHEN LEFT(Column7, 11) = 'unitsshort:' THEN SUBSTRING(Column7, 12, LEN(Column7) - 10)
		WHEN LEFT(Column8, 11) = 'unitsshort:' THEN SUBSTRING(Column8, 12, LEN(Column8) - 10)
		WHEN LEFT(Column9, 11) = 'unitsshort:' THEN SUBSTRING(Column9, 12, LEN(Column9) - 10)
		ELSE NULL
	END, '\/', '/') AS UnitOfMeasure,
	RowNumber
FROM
	StageEIA.RawEIATimeSeries WITH (NOLOCK)
WHERE
	LEN(LTRIM(RTRIM(Column1))) > 0