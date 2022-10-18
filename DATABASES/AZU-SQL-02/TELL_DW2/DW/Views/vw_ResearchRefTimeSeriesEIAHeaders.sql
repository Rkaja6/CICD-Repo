/******************************
** Name:  vw_ResearchRefTimeSeriesEIAHeaders
** Desc:
** Auth:  Aaron Vogt
** Date:  01/20/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    01/20/2020   Aaron V   Object creation
*******************************/
CREATE VIEW [DW].[vw_ResearchRefTimeSeriesEIAHeaders]
AS 
SELECT
	SUBSTRING(Column1, 11, LEN(Column1) - 10) AS SeriesID,
	CASE
		WHEN LEFT(Column2, 5) = 'name:' THEN SUBSTRING(Column2, 6, LEN(Column2) - 4)
		WHEN LEFT(Column3, 5) = 'name:' THEN SUBSTRING(Column3, 6, LEN(Column3) - 4)
		WHEN LEFT(Column4, 5) = 'name:' THEN SUBSTRING(Column4, 6, LEN(Column4) - 4)
		WHEN LEFT(Column5, 5) = 'name:' THEN SUBSTRING(Column5, 6, LEN(Column5) - 4)
		ELSE NULL
	END + ' ' + LTRIM(RTRIM(Column3)) AS SeriesName,
	CASE
		WHEN LEFT(Column7, 12) = 'description:' THEN SUBSTRING(Column7, 13, LEN(Column7) - 4)
		WHEN LEFT(Column8, 12) = 'description:' THEN SUBSTRING(Column8, 13, LEN(Column8) - 4)
		WHEN LEFT(Column9, 12) = 'description:' THEN SUBSTRING(Column9, 13, LEN(Column9) - 4)
		WHEN LEFT(Column10, 12) = 'description:' THEN SUBSTRING(Column10, 13, LEN(Column10) - 4)
		ELSE NULL
	END AS SeriesDescription,
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
	END, '\/', '/') AS UnitOfMeasure	
FROM
	StageEIA.RawEIATimeSeries WITH (NOLOCK)
WHERE
	LEN(LTRIM(RTRIM(Column1))) > 0