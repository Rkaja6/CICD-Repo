

/******************************
** Name: [vw_BOLOAFEBudgetsSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/11/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/11/2019   Aaron     Object creation
*******************************/
CREATE VIEW [DW].[vw_BOLOAFEBudgetsSatStageData] AS
SELECT
	HASHBYTES('SHA2_256', proj.PROJ_NO) AS [AFEHashKey],
	hdr.SEQ AS [AFEBudgetSequence],
	hdr.ACCT AS [Account],
	hdr.COMPANY AS [Company],
	dtl.ACCTG_PERIODS AS [AccountingPeriod],
	'BOLO GL Budget' AS [RecordSource],
	CONVERT(DATETIME2(7), dtl.time_stamp) AS [LoadDate],
	CONVERT(DATETIME2(7), NULL) AS [LoadEndDate],
	dtl.AMTS AS Amount
FROM 
	[StageBOLO].[GL_BUD] hdr WITH (NOLOCK)
INNER JOIN
	[StageBOLO].[GL_BUD_ACCTG_PER] dtl WITH (NOLOCK)
ON 
	hdr.u2_id = dtl.u2_id
INNER JOIN
	[StageBOLO].[PROJ] proj WITH (NOLOCK)
ON
	hdr.PROJECT = proj.u2_id