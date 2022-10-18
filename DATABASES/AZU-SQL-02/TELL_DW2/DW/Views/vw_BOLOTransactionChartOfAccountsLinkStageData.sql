

/******************************
** Name:  [vw_BOLOTransactionChartOfAccountsLinkStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/10/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/09/2019   Aaron     Object creation
** 2    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/
CREATE VIEW [DW].[vw_BOLOTransactionChartOfAccountsLinkStageData] AS
SELECT 
	HASHBYTES('SHA2_256', CONCAT(trans.u2_id, '|', coa.u2_id)) AS TransactionChartOfAccountsHashKey,
	HASHBYTES('SHA2_256', trans.u2_id) AS [TransactionHashKey],
	HASHBYTES('SHA2_256', coa.u2_id) AS [ChartOfAccountsHashKey],
	'BOLO Transaction and Chart Of Accounts' AS RecordSource,
	GETDATE() AS LoadDate
FROM
	[StageBOLO].[TRANS] trans WITH (NOLOCK)
INNER JOIN
	[StageBOLO].[COA] coa WITH (NOLOCK)
ON
	coa.u2_id = trans.ACCT