

/******************************
** Name: [vw_BOLOAFEActualsSatStageData]
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
CREATE VIEW [DW].[vw_BOLOAFEActualsSatStageData] AS
SELECT  
	HASHBYTES('SHA2_256', Transactions.u2_id) AS [TransactionHashKey],
	'BOLO Transaction' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	CONVERT(VARCHAR(19), NULL) AS InvoiceNumber,
	Transactions.ACCTG_PERIOD AS AccountingPeriod,
	Transactions.ACTIVITY_DATE AS TransactionDate,
	Transactions.AMT AS Amount,
	CONVERT(CHAR(1), NULL) AS IsPaid
FROM 
	[StageBOLO].[TRANS] Transactions WITH (NOLOCK)