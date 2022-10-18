

/******************************
** Name:  [vw_BOLOTransactionAFELinkStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/11/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/11/2019   Aaron     Object creation
** 2    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/
CREATE VIEW [DW].[vw_BOLOTransactionAFELinkStageData] AS
SELECT 
	HASHBYTES('SHA2_256', CONCAT(trans.u2_id, '|', proj.PROJ_NO)) AS TransactionAFEHashKey,
	HASHBYTES('SHA2_256', trans.u2_id) AS [TransactionHashKey],
	 HASHBYTES('SHA2_256', proj.PROJ_NO) AS [AFEHashKey],
	'BOLO Transaction and Project' AS RecordSource,
	GETDATE() AS LoadDate
FROM
	[StageBOLO].[TRANS] trans WITH (NOLOCK)
INNER JOIN
	[StageBOLO].[PROJ] proj WITH (NOLOCK)
ON
	proj.u2_id = trans.PROJECT