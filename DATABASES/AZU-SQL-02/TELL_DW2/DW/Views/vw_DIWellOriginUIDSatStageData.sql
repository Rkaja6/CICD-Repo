
/******************************
** Name:  [vw_DIWellOriginUIDSatStageData]
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
CREATE VIEW [DW].[vw_DIWellOriginUIDSatStageData] AS
SELECT * FROM
(SELECT 
	HASHBYTES('SHA2_256', CONVERT(VARCHAR(14), ws1.GovernmentID)) AS WellOriginHashKey,
	'DI Well Origins' AS RecordSource,
	COALESCE(ws1.UpdatedDate, GETDATE()) AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	ws1.UID AS [WellOriginUID],
	ROW_NUMBER() OVER (PARTITION BY ws1.GovernmentID ORDER BY ws1.UpdatedDate DESC, ws1.UID DESC) AS UniqueKeySequence
FROM 
	[StageDI].[WellOrigins] ws1 WITH (NOLOCK)) ws
WHERE
	ws.UniqueKeySequence = 1