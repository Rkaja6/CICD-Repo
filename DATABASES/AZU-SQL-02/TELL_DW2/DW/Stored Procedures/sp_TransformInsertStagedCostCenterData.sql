


/******************************
** Name:  [sp_TransformInsertStagedCostCenterData]
** Desc:
** Auth:  Dee Glazebrook
** Date:  11/21/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/21/2019   Dee       Object creation
** 2    12/30/2019   Dee       Fixed bugs creating duplicates in loading the link tables
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedCostCenterData] AS

BEGIN

--Ensure pending transactions are not queued
--Consider specifying transaction id's, but be careful not to orphan transactions as these will consume and hold resources on the host
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

BEGIN TRANSACTION

--INSERT Records that don't exist at all into the CostCenter Hub
INSERT INTO 
	[DW].HubCostCenter
(	   
	CostCenterHashKey,
	[RecordSource],
	[LoadDate],
	CCu2_id
)
SELECT
	stg.CostCenterHashKey,
	stg.[RecordSource],
	stg.[LoadDate],
	stg.CC_UID
FROM
	 [DW].vw_BOLOCostCenterStageData stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.HubCostCenter hub WITH (NOLOCK)
		WHERE stg.CostCenterHashKey = hub.CostCenterHashKey
		) 
	AND	stg.CostCenterHashKey IS NOT NULL

--INSERT Records that don't exist at all into the WellCostCenter Link
INSERT INTO 
	[DW].LinkWellCostCenter
(	   
	WellCostCenterHashKey,
	[RecordSource],
	[LoadDate],
	WellHashKey,
	CostCenterHashKey
)
SELECT
	stg.WellCostCenterHashKey,
	stg.[RecordSource],
	stg.[LoadDate],
	stg.WellHashKey,
	stg.CostCenterHashKey
FROM
	 [DW].vw_BOLOCostCenterStageData stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.LinkWellCostCenter link WITH (NOLOCK)
		WHERE stg.WellCostCenterHashKey = link.WellCostCenterHashKey
		) 
	AND	stg.WellHashKey IS NOT NULL
	AND	stg.CostCenterHashKey IS NOT NULL

--INSERT Records that don't exist at all into the CostCenterCompany Link
INSERT INTO 
	[DW].[LinkCostCenterCompany]
(	   
	CostCenterCompanyHashKey,
	CostCenterHashKey,
	CompanyPartyHashKey,
	[RecordSource],
	[LoadDate]
)
SELECT
	stg.CostCenterPartiesHashKey,
	stg.CostCenterHashKey,
	stg.CompanyPartyHashKey,
	stg.[RecordSource],
	stg.[LoadDate]
FROM
	 [DW].vw_BOLOCostCenterStageData stg
WHERE
	stg.CompanyPartyHashKey IS NOT NULL
	AND NOT EXISTS 
		(
		SELECT 1 
		FROM DW.[LinkCostCenterCompany] link  WITH (NOLOCK)
		WHERE stg.CostCenterHashKey = link.CostCenterHashKey
		AND stg.CompanyPartyHashKey = link.CompanyPartyHashKey
		) 
	AND	stg.CostCenterHashKey IS NOT NULL
	AND	stg.CompanyPartyHashKey IS NOT NULL

--INSERT Records that don't exist at all into the CostCenterOperator Link
INSERT INTO 
	[DW].[LinkCostCenterOperator]
(	   
	CostCenterOperatorHashKey,
	CostCenterHashKey,
	OperatorPartyHashKey,
	[RecordSource],
	[LoadDate]
)
SELECT
	stg.CostCenterPartiesHashKey,
	stg.CostCenterHashKey,
	stg.OperatorPartyHashKey,
	stg.[RecordSource],
	stg.[LoadDate]
FROM
	 [DW].vw_BOLOCostCenterStageData stg
WHERE
	stg.OperatorPartyHashKey IS NOT NULL
	AND NOT EXISTS 
		(
		SELECT 1 
		FROM DW.[LinkCostCenterOperator] link  WITH (NOLOCK)
		WHERE stg.CostCenterHashKey = link.CostCenterHashKey
		AND stg.OperatorPartyHashKey = link.OperatorPartyHashKey
		) 
	AND	stg.CostCenterHashKey IS NOT NULL
	AND	stg.OperatorPartyHashKey IS NOT NULL

--We can commit now since new inserts are completed
COMMIT TRANSACTION

--Roll back open transactions
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

--New transactions for end dating and insertion of new satellite records
BEGIN TRANSACTION

--Get list of CostCenterHashKeys that have changed
IF OBJECT_ID('tempdb..#cc_changes') IS NOT NULL DROP TABLE #cc_changes

SELECT DISTINCT
	stg.CostCenterHashKey
INTO
	#cc_changes
FROM 
	dw.vw_BOLOCostCenterStageData stg
LEFT JOIN
	dw.SatCostCenter sat WITH (NOLOCK)
ON
	stg.CostCenterHashKey = sat.CostCenterHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.EXP_DATE, '') <> ISNULL(sat.LoadEndDate, '')
	OR ISNULL(stg.[CostCenterName], '') <> ISNULL(sat.[CostCenterName], '')
	OR ISNULL(stg.[CostCenterNumber], '') <> ISNULL(sat.[CostCenterNumber], '')
	OR ISNULL(stg.[CostCenterType], '') <> ISNULL(sat.[CostCenterType], '')
	OR ISNULL(stg.[INPUT_DATE], '') <> ISNULL(sat.[INPUT_DATE], '')
	OR ISNULL(stg.[INPUT_USER], '') <> ISNULL(sat.[INPUT_USER], '')
	OR ISNULL(stg.TERMINATION_DATE, '') <> ISNULL(sat.TERMINATION_DATE, '')
	OR ISNULL(stg.TERMINATION_REMARKS, '') <> ISNULL(sat.TERMINATION_REMARKS, '')
	OR ISNULL(stg.TERMINATION_TYPE, '') <> ISNULL(sat.TERMINATION_TYPE, '')
	OR ISNULL(stg.LAST_STATUS, '') <> ISNULL(sat.LAST_STATUS, '')
	OR ISNULL(stg.MANAGER, '') <> ISNULL(sat.MANAGER, '')
	OR ISNULL(stg.CC_API_Number, '') <> ISNULL(sat.CC_API_Number, '')
	OR ISNULL(stg.County, '') <> ISNULL(sat.County, '')
	OR ISNULL(stg.[DESCRIPTION], '') <> ISNULL(sat.[DESCRIPTION], '')
	OR ISNULL(stg.Field, '') <> ISNULL(sat.FIELD, '')
	OR ISNULL(stg.[STATE], '') <> ISNULL(sat.[STATE], '')

--INSERT new IDs into the CostCenter Sat
INSERT INTO 
	DW.SatCostCenter
(
	CostCenterHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	CostCenterName,
	CostCenterNumber,
	CostCenterType,
	INPUT_DATE,
	INPUT_USER,
	TERMINATION_DATE,
	TERMINATION_REMARKS,
	TERMINATION_TYPE,
	LAST_STATUS,
	MANAGER,
	CC_API_Number,
	COUNTY,
	[DESCRIPTION],
	FIELD,
	[STATE]
)
SELECT
	stg.CostCenterHashKey,
	stg.RecordSource,
	stg.LoadDate,
	stg.LoadEndDate,
	stg.CostCenterName,
	stg.CostCenterNumber,
	stg.CostCenterType,
	stg.INPUT_DATE,
	stg.INPUT_USER,
	stg.TERMINATION_DATE,
	stg.TERMINATION_REMARKS,
	stg.TERMINATION_TYPE,
	stg.LAST_STATUS,
	stg.MANAGER,
	stg.CC_API_Number,
	stg.COUNTY,
	stg.[DESCRIPTION],
	stg.FIELD,
	stg.[STATE]
FROM 
	dw.vw_BOLOCostCenterStageData stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.SatCostCenter sat  WITH (NOLOCK)
		WHERE stg.CostCenterHashKey = sat.CostCenterHashKey
		) 
	AND	stg.CostCenterHashKey IS NOT NULL
-- check if not expired
	AND stg.EXP_DATE IS NULL

--INSERT changed data for exisitng IDs in the CostCenter Sat
INSERT INTO 
	DW.SatCostCenter
(
	CostCenterHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	CostCenterName,
	CostCenterNumber,
	CostCenterType,
	INPUT_DATE,
	INPUT_USER,
	TERMINATION_DATE,
	TERMINATION_REMARKS,
	TERMINATION_TYPE,
	LAST_STATUS,
	MANAGER,
	CC_API_Number,
	COUNTY,
	[DESCRIPTION],
	FIELD,
	[STATE]
)
SELECT DISTINCT
	stg.CostCenterHashKey,
	stg.RecordSource,
	stg.LoadDate,
	stg.EXP_DATE,
	stg.CostCenterName,
	stg.CostCenterNumber,
	stg.CostCenterType,
	stg.INPUT_DATE,
	stg.INPUT_USER,
	stg.TERMINATION_DATE,
	stg.TERMINATION_REMARKS,
	stg.TERMINATION_TYPE,
	stg.LAST_STATUS,
	stg.MANAGER,
	stg.CC_API_Number,
	stg.COUNTY,
	stg.[DESCRIPTION],
	stg.FIELD,
	stg.[STATE]
FROM 
	dw.vw_BOLOCostCenterStageData stg
LEFT JOIN
	dw.SatCostCenter sat WITH (NOLOCK)
ON
	stg.CostCenterHashKey = sat.CostCenterHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.EXP_DATE, '') <> ISNULL(sat.LoadEndDate, '')
	OR ISNULL(stg.[CostCenterName], '') <> ISNULL(sat.[CostCenterName], '')
	OR ISNULL(stg.[CostCenterNumber], '') <> ISNULL(sat.[CostCenterNumber], '')
	OR ISNULL(stg.[CostCenterType], '') <> ISNULL(sat.[CostCenterType], '')
	OR ISNULL(stg.[INPUT_DATE], '') <> ISNULL(sat.[INPUT_DATE], '')
	OR ISNULL(stg.[INPUT_USER], '') <> ISNULL(sat.[INPUT_USER], '')
	OR ISNULL(stg.TERMINATION_DATE, '') <> ISNULL(sat.TERMINATION_DATE, '')
	OR ISNULL(stg.TERMINATION_REMARKS, '') <> ISNULL(sat.TERMINATION_REMARKS, '')
	OR ISNULL(stg.TERMINATION_TYPE, '') <> ISNULL(sat.TERMINATION_TYPE, '')
	OR ISNULL(stg.LAST_STATUS, '') <> ISNULL(sat.LAST_STATUS, '')
	OR ISNULL(stg.MANAGER, '') <> ISNULL(sat.MANAGER, '')
	OR ISNULL(stg.CC_API_Number, '') <> ISNULL(sat.CC_API_Number, '')
	OR ISNULL(stg.County, '') <> ISNULL(sat.County, '')
	OR ISNULL(stg.[DESCRIPTION], '') <> ISNULL(sat.[DESCRIPTION], '')
	OR ISNULL(stg.Field, '') <> ISNULL(sat.FIELD, '')
	OR ISNULL(stg.[STATE], '') <> ISNULL(sat.[STATE], '')

--UPDATE load end dates for changed data. 
UPDATE
	SatCostCenter
SET 
	LoadEndDate = 
		(
		SELECT
			DATEADD(ss, -1, MIN(z.LoadDate))
		FROM 
			SatCostCenter z WITH (NOLOCK)
		WHERE
			z.CostCenterHashKey = a.CostCenterHashKey
		AND 
			z.LoadDate > a.LoadDate
		AND
			z.LoadEndDate IS NULL
		)
FROM 
	SatCostCenter a WITH (NOLOCK)
WHERE
	LoadEndDate IS NULL
AND EXISTS
	(
	SELECT 1
	FROM #cc_changes b
	WHERE b.CostCenterHashKey = a.CostCenterHashKey
	)

--Release temp space used
IF OBJECT_ID('tempdb..#cc_changes') IS NOT NULL DROP TABLE #cc_changes

COMMIT TRANSACTION
END