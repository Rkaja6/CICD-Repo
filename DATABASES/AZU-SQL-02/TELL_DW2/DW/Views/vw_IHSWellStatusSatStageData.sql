
/******************************
** Name:  [vw_IHSWellStatusSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
** 2    10/01/2019   Dee       Added Activity and changed source of Classification
*******************************/
CREATE VIEW [DW].[vw_IHSWellStatusSatStageData] AS
SELECT * FROM
(SELECT 
	HASHBYTES('SHA2_256', LEFT(wh.UWI, 14)) AS WellHashKey,
	'IHS Well Header' AS [RecordSource],
	CONVERT(DATETIME2(7), wh.CADIS_SYSTEM_UPDATED) AS [LoadDate],
	CONVERT(DATETIME2(7), NULL) AS [LoadEndDate],
	wh.CURRENT_STATUS AS [Status],
	wh.ACTIVITY_CODE AS [Activity],
	wh.STATUS_FINAL_CODE AS Classification,
	ROW_NUMBER() OVER (PARTITION BY LEFT(wh.UWI, 14) ORDER BY wh.CADIS_SYSTEM_UPDATED DESC, wh.UWI DESC) AS WellHeaderSequence
FROM 
	[StageIHS].[T_WELL_HEADER] wh WITH (NOLOCK)
	) wh1
WHERE
	wh1.WellHeaderSequence = 1