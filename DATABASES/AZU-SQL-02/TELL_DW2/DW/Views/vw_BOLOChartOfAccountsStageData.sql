



/******************************
** Name:  [vw_BOLOChartOfAccountsStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/10/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/10/2019   Aaron     Object creation
** 2    11/21/2019   Dee       Added more fields for updating satellite table as well
** 3    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/
CREATE VIEW [DW].[vw_BOLOChartOfAccountsStageData] AS
SELECT DISTINCT
	HASHBYTES('SHA2_256', ChartOfAccounts.u2_id) AS [ChartOfAccountsHashKey],
	'BOLO COA' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(VARCHAR(50), ChartOfAccounts.u2_id) AS [COAu2_id],
	Major.MajorAccountCode,
	Major.MajorAccountName,
	SUB_CO as SubAccountCode,
	[NAME] as SubAccountName,
	CATEGORY,
	ACCT_DESIGNATION,
	JIB_REQ,
	QTY_REQ,
	SL_REQ,
	NORMAL_BAL,
	EXP_DATE
FROM
	[StageBOLO].[COA] ChartOfAccounts WITH (NOLOCK)
LEFT JOIN
	(
	SELECT DISTINCT
		u2_id as MajorAccountCode,
		[NAME] as MajorAccountName
	FROM 
		StageBOLO.COA WITH (NOLOCK)
	WHERE 
		LEN(u2_id) = 3
	) Major
ON 
	Major.MajorAccountCode = LEFT(ChartOfAccounts.u2_id,3)
WHERE 
	ChartOfAccounts.u2_id IS NOT NULL AND
	-- Only load Major/Sub account combinations
	LEN(u2_id) = 8