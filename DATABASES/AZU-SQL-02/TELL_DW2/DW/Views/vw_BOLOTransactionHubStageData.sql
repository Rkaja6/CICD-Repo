


/******************************
** Name:  [vw_BOLOTransactionSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/10/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/10/2019   Aaron     Object creation
** 2    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/
CREATE VIEW [DW].[vw_BOLOTransactionHubStageData] AS
SELECT
	HASHBYTES('SHA2_256', Transactions.u2_id) AS [TransactionHashKey],
	'BOLO Transaction' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(VARCHAR(50), Transactions.u2_id) AS [Transaction_u2_id]
FROM
	[StageBOLO].[TRANS] Transactions WITH (NOLOCK)