
/******************************
** Name:  [sp_TransformInsertStagedChartOfAccountsData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/11/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/11/2019   Aaron     Object creation
** 2    11/21/2019   Dee       Added updates for the satellites
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedChartOfAccountsData] AS

BEGIN
---------------------------------------------------------------------------------------
-----------   BOLO ChartOfAccounts   --------------------------------------------------
---------------------------------------------------------------------------------------

--Ensure pending transactions are not queued
--Consider specifying transaction id's, but be careful not to orphan transactions as these will consume and hold resources on the host
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

BEGIN TRANSACTION

--INSERT Records that don't exist at all in the hub
INSERT INTO 
	[DW].[HubChartOfAccounts]
(	   
	[ChartOfAccountsHashKey],
	[RecordSource],
	[LoadDate],
	[COAu2_id]
)
SELECT
	stg.[ChartOfAccountsHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[COAu2_id]
FROM
	 [DW].[vw_BOLOChartOfAccountsStageData] stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.[HubChartOfAccounts] hub  WITH (NOLOCK)
		WHERE stg.[ChartOfAccountsHashKey] = hub.[ChartOfAccountsHashKey]
		) 
	AND	stg.[ChartOfAccountsHashKey] IS NOT NULL

--We can commit now since new inserts are completed
COMMIT TRANSACTION

--Roll back open transactions
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

--New transactions for end dating and insertion of new satellite records
BEGIN TRANSACTION

--Get list of COAHashKeys that have changed
IF OBJECT_ID('tempdb..#coa_changes') IS NOT NULL DROP TABLE #coa_changes

SELECT DISTINCT
	stg.ChartOfAccountsHashKey
INTO
	#coa_changes
FROM 
	dw.[vw_BOLOChartOfAccountsStageData] stg
LEFT JOIN
	dw.SatChartOfAccounts sat WITH (NOLOCK)
ON
	stg.ChartOfAccountsHashKey = sat.ChartOfAccountsHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.EXP_DATE, '') <> ISNULL(sat.LoadEndDate, '')
	OR ISNULL(stg.[MajorAccountCode], '') <> ISNULL(sat.[MajorAccountCode], '')
	OR ISNULL(stg.[MajorAccountName], '') <> ISNULL(sat.[MajorAccountName], '')
	OR ISNULL(stg.[SubAccountCode], '') <> ISNULL(sat.[SubAccountCode], '')
	OR ISNULL(stg.[SubAccountName], '') <> ISNULL(sat.[SubAccountName], '')
	OR ISNULL(stg.[CATEGORY], '') <> ISNULL(sat.[CATEGORY], '')
	OR ISNULL(stg.[ACCT_DESIGNATION], '') <> ISNULL(sat.[ACCT_DESIGNATION], '')
	OR ISNULL(stg.[JIB_REQ], '') <> ISNULL(sat.[JIB_REQ], '')
	OR ISNULL(stg.[QTY_REQ], '') <> ISNULL(sat.[QTY_REQ], '')
	OR ISNULL(stg.[SL_REQ], '') <> ISNULL(sat.[SL_REQ], '')
	OR ISNULL(stg.[NORMAL_BAL], '') <> ISNULL(sat.[NORMAL_BAL], '')

--INSERT new IDs into the COA Sat
INSERT INTO 
	DW.SatChartOfAccounts
(
	ChartOfAccountsHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	MajorAccountCode,
	MajorAccountName,
	SubAccountCode,
	SubAccountName,
	CATEGORY,
	ACCT_DESIGNATION,
	JIB_REQ,
	QTY_REQ,
	SL_REQ,
	NORMAL_BAL
)
SELECT
	stg.ChartOfAccountsHashKey,
	stg.RecordSource,
	stg.LoadDate,
	NULL,
	stg.MajorAccountCode,
	stg.MajorAccountName,
	stg.SubAccountCode,
	stg.SubAccountName,
	stg.CATEGORY,
	stg.ACCT_DESIGNATION,
	stg.JIB_REQ,
	stg.QTY_REQ,
	stg.SL_REQ,
	stg.NORMAL_BAL
FROM 
	dw.[vw_BOLOChartOfAccountsStageData] stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.SatChartOfAccounts sat  WITH (NOLOCK)
		WHERE stg.ChartOfAccountsHashKey = sat.ChartOfAccountsHashKey
		) 
	AND	stg.ChartOfAccountsHashKey IS NOT NULL
-- Make sure the account hasn't expired
	AND stg.EXP_DATE IS NULL

--INSERT changed data for exisitng IDs in the CostCenter Sat
INSERT INTO 
	DW.SatChartOfAccounts
(
	ChartOfAccountsHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	MajorAccountCode,
	MajorAccountName,
	SubAccountCode,
	SubAccountName,
	CATEGORY,
	ACCT_DESIGNATION,
	JIB_REQ,
	QTY_REQ,
	SL_REQ,
	NORMAL_BAL
)
SELECT DISTINCT
	stg.ChartOfAccountsHashKey,
	stg.RecordSource,
	stg.LoadDate,
	stg.EXP_DATE,
	stg.MajorAccountCode,
	stg.MajorAccountName,
	stg.SubAccountCode,
	stg.SubAccountName,
	stg.CATEGORY,
	stg.ACCT_DESIGNATION,
	stg.JIB_REQ,
	stg.QTY_REQ,
	stg.SL_REQ,
	stg.NORMAL_BAL
FROM 
	dw.[vw_BOLOChartOfAccountsStageData] stg
LEFT JOIN
	dw.SatChartOfAccounts sat WITH (NOLOCK)
ON
	stg.ChartOfAccountsHashKey = sat.ChartOfAccountsHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.EXP_DATE, '') <> ISNULL(sat.LoadEndDate, '')
	OR ISNULL(stg.[MajorAccountCode], '') <> ISNULL(sat.[MajorAccountCode], '')
	OR ISNULL(stg.[MajorAccountName], '') <> ISNULL(sat.[MajorAccountName], '')
	OR ISNULL(stg.[SubAccountCode], '') <> ISNULL(sat.[SubAccountCode], '')
	OR ISNULL(stg.[SubAccountName], '') <> ISNULL(sat.[SubAccountName], '')
	OR ISNULL(stg.[CATEGORY], '') <> ISNULL(sat.[CATEGORY], '')
	OR ISNULL(stg.[ACCT_DESIGNATION], '') <> ISNULL(sat.[ACCT_DESIGNATION], '')
	OR ISNULL(stg.[JIB_REQ], '') <> ISNULL(sat.[JIB_REQ], '')
	OR ISNULL(stg.[QTY_REQ], '') <> ISNULL(sat.[QTY_REQ], '')
	OR ISNULL(stg.[SL_REQ], '') <> ISNULL(sat.[SL_REQ], '')
	OR ISNULL(stg.[NORMAL_BAL], '') <> ISNULL(sat.[NORMAL_BAL], '')

--UPDATE load end dates for changed data. 
UPDATE
	SatChartOfAccounts
SET 
	LoadEndDate = 
		(
		SELECT
			DATEADD(ss, -1, MIN(z.LoadDate))
		FROM 
			SatChartOfAccounts z WITH (NOLOCK)
		WHERE
			z.ChartOfAccountsHashKey = a.ChartOfAccountsHashKey
		AND 
			z.LoadDate > a.LoadDate
		AND
			z.LoadEndDate IS NULL
		)
FROM 
	SatChartOfAccounts a WITH (NOLOCK)
WHERE
	LoadEndDate IS NULL
AND EXISTS
	(
	SELECT 1
	FROM #coa_changes b
	WHERE b.ChartOfAccountsHashKey = a.ChartOfAccountsHashKey
	)

--Release temp space used
IF OBJECT_ID('tempdb..#coa_changes') IS NOT NULL DROP TABLE #coa_changes

COMMIT TRANSACTION
END