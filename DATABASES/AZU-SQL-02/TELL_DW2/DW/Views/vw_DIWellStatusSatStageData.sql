
/******************************
** Name:  [vw_DIWellStatusSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
** 2    10/01/2019   Dee       Added Activity & changed Classification source
*******************************/
CREATE VIEW [DW].[vw_DIWellStatusSatStageData] AS
SELECT * FROM
(SELECT 
	HASHBYTES('SHA2_256', wr1.API14) AS WellHashKey,
	'DI Well Rollups' AS RecordSource,
	COALESCE(wr1.UpdatedDate, GETDATE()) AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	wr1.[WellStatus] AS [Status],
	CONVERT(VARCHAR(60), NULL) AS [Activity],
	wr1.[WellStatus] AS [Classification],
	ROW_NUMBER() OVER (PARTITION BY wr1.API14 ORDER BY UpdatedDate DESC) AS UniqueKeySequence
FROM 
	[StageDI].[WellRollups] wr1 WITH (NOLOCK)) wr
WHERE
	wr.UniqueKeySequence = 1