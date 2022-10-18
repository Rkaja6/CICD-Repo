
/******************************
** Name:  [vw_DIWellWellBoreLinkStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
*******************************/
CREATE VIEW [DW].[vw_WellWellBoreLinkStageData] AS
SELECT
	HASHBYTES('SHA2_256', CONCAT(wbhub.[WellboreHashKey],'|',whub.[WellHashKey])) AS [WellboreWellHashKey],
	wbhub.[WellboreHashKey],
	whub.[WellHashKey],
	whub.RecordSource,
	CASE
		WHEN whub.LoadDate > wbhub.LoadDate THEN whub.LoadDate
		ELSE wbhub.LoadDate
	END AS LoadDate
FROM
	[DW].[HubWell] whub WITH (NOLOCK)
INNER JOIN
	[DW].[HubWellbore] wbhub WITH (NOLOCK)
ON
	LEFT(whub.API14, 12) = wbhub.API12