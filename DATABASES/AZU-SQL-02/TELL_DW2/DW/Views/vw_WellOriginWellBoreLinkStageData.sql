
/******************************
** Name:  [vw_WellOriginWellBoreLinkStageData]
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
CREATE VIEW [DW].[vw_WellOriginWellBoreLinkStageData] AS
SELECT
	HASHBYTES('SHA2_256', CONCAT(wohub.[WellOriginHashKey],'|',wbhub.[WellboreHashKey])) AS [WellOriginWellboreHashKey],
	wohub.[WellOriginHashKey],
	wbhub.[WellboreHashKey],
	wohub.RecordSource,
	CASE
		WHEN wohub.LoadDate > wbhub.LoadDate THEN wohub.LoadDate
		ELSE wbhub.LoadDate
	END AS LoadDate
FROM
	[DW].[HubWellOrigin] wohub WITH (NOLOCK)
INNER JOIN
	[DW].[HubWellbore] wbhub WITH (NOLOCK)
ON
	LEFT(wbhub.API12, 10) = wohub.API10