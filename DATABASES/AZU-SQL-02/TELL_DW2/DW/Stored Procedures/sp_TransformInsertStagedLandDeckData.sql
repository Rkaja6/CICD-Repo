

/******************************
** Name:  [sp_TransformInsertStagedLandDeckData]
** Desc:
** Auth:  Dee Glazebrook
** Date:  11/12/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/12/2019   Dee       Object creation
** 2    12/30/2019   Dee       Fixed bugs creating duplicates in loading the link tables
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedLandDeckData] AS

BEGIN

--Ensure pending transactions are not queued
--Consider specifying transaction id's, but be careful not to orphan transactions as these will consume and hold resources on the host
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

BEGIN TRANSACTION

--INSERT Records that don't exist at all into the LandDeck Hub
INSERT INTO 
	[DW].[HubLandDeck]
(	   
	[LandDeckHashKey],
	[RecordSource],
	[LoadDate],
	[Deck_Type],
	[Deck_ID]
)
SELECT
	stg.[LandDeckHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[Deck_Type],
	stg.[Deck_ID]
FROM
	 [DW].[vw_BOLOLandDeckStageData] stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.[HubLandDeck] hub  WITH (NOLOCK)
		WHERE stg.[LandDeckHashKey] = hub.[LandDeckHashKey]
		) 
	AND	stg.[LandDeckHashKey] IS NOT NULL

--INSERT Records that don't exist at all into the LandDeckInterest Hub
INSERT INTO 
	[DW].[HubLandDeckInterest]
(	   
	[LandDeckInterestHashKey],
	[RecordSource],
	[LoadDate],
	[Deck_Type],
	[Interest_ID]
)
SELECT
	stg.[LandDeckInterestHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[Deck_Type],
	stg.[Interest_ID]
FROM
	 [DW].[vw_BOLOLandDeckInterestStageData] stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.[HubLandDeckInterest] hub  WITH (NOLOCK)
		WHERE stg.[LandDeckInterestHashKey] = hub.[LandDeckInterestHashKey]
		) 
	AND	stg.[LandDeckInterestHashKey] IS NOT NULL

--INSERT Records that don't exist at all into the LandDeck Link
INSERT INTO 
	[DW].[LinkLandDeck]
(	   
	[LinkLandDeckHashKey],
	[LandDeckHashKey],
	[PartyHashKey],
	[CostCenterHashKey],
	[RecordSource],
	[LoadDate]
)
SELECT
	stg.[LinkLandDeckHashKey],
	stg.[LandDeckHashKey],
	stg.[InternalCo_PartyHashKey],
	stg.[CostCenterHashKey],
	stg.[RecordSource],
	stg.[LoadDate]
FROM
	 [DW].vw_BOLOLandDeckStageData stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.[LinkLandDeck] link  WITH (NOLOCK)
		WHERE stg.[LandDeckHashKey] = link.[LandDeckHashKey]
		AND stg.[InternalCo_PartyHashKey] = link.PartyHashKey
		AND stg.[CostCenterHashKey] = link.[CostCenterHashKey]
		) 
	AND	stg.[LandDeckHashKey] IS NOT NULL
	AND	stg.[InternalCo_PartyHashKey] IS NOT NULL
	AND	stg.[CostCenterHashKey] IS NOT NULL

--INSERT Records that don't exist at all into the LandDeck Interest Link
INSERT INTO
	DW.LinkLandDeckInterest
(
	[LinkLandDeckInterestHashKey],
	[LandDeckInterestHashKey],
	LandDeckHashKey,
	PartyHashKey,
	RecordSource,
	LoadDate
)
SELECT
	stg.[LinkLandDeckInterestHashKey],
	stg.[LandDeckInterestHashKey],
	stg.LandDeckHashKey,
	stg.Owner_PartyHashKey,
	stg.RecordSource,
	stg.LoadDate
FROM
	DW.vw_BOLOLandDeckInterestStageData stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.LinkLandDeckInterest link  WITH (NOLOCK)
		WHERE stg.[LandDeckInterestHashKey] = link.[LandDeckInterestHashKey]
		and stg.[LandDeckHashKey] = link.[LandDeckHashKey]
		AND stg.Owner_PartyHashKey = link.PartyHashKey
		) 
	AND	stg.[LandDeckInterestHashKey] IS NOT NULL
	AND	stg.[LandDeckHashKey] IS NOT NULL
	AND	stg.Owner_PartyHashKey IS NOT NULL

--We can commit now since new inserts are completed
COMMIT TRANSACTION

--Roll back open transactions
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

--New transactions for end dating and insertion of new satellite records
BEGIN TRANSACTION

--Get list of LandDeckHashKeys that have changed
IF OBJECT_ID('tempdb..#landdeck_changes') IS NOT NULL DROP TABLE #landdeck_changes

SELECT DISTINCT
	stg.[LandDeckHashKey]
INTO
	#landdeck_changes
FROM 
	dw.vw_BOLOLandDeckStageData stg
LEFT JOIN
	dw.SatLandDeck sat WITH (NOLOCK)
ON
	stg.[LandDeckHashKey] = sat.[LandDeckHashKey]
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.[DESCRIPTION], '') <> ISNULL(sat.[DESCRIPTION], '')
	OR ISNULL(stg.[INACTIVE_DATE], '') <> ISNULL(sat.[INACTIVE_DATE], '')
	OR ISNULL(stg.[INACTIVE_REASON], '') <> ISNULL(sat.[INACTIVE_REASON], '')
	OR ISNULL(stg.[MAJOR_ACCT], '') <> ISNULL(sat.[MAJOR_ACCT], '')
	OR ISNULL(stg.[SUB_ACCT], '') <> ISNULL(sat.[SUB_ACCT], '')
	OR ISNULL(stg.PROJECT, '') <> ISNULL(sat.PROJECT, '')
	OR ISNULL(stg.PROPERTY, '') <> ISNULL(sat.PROPERTY, '')
	OR ISNULL(stg.PRODUCT, '') <> ISNULL(sat.PRODUCT, '')
	OR ISNULL(stg.[PARENT_DOI], '') <> ISNULL(sat.[PARENT_DOI], '')
	OR ISNULL(stg.[NRI_RPTG_DOI], '') <> ISNULL(sat.[NRI_RPTG_DOI], '')
	OR ISNULL(stg.[WI_RPTG_DECK], '') <> ISNULL(sat.[WI_RPTG_DECK], '')
	OR ISNULL(stg.[NRI_COMPLETE_FLAG], '') <> ISNULL(sat.[NRI_COMPLETE_FLAG], '')
	OR ISNULL(stg.[RI_COMPLETE_FLAG], '') <> ISNULL(sat.[RI_COMPLETE_FLAG], '')
	OR ISNULL(stg.[WI_COMPLETE_FLAG], '') <> ISNULL(sat.[WI_COMPLETE_FLAG], '')
	OR ISNULL(stg.BUR_COMPLETE_FLAG, '') <> ISNULL(sat.BUR_COMPLETE_FLAG, '')
	OR ISNULL(stg.CPT_COMPLETE_FLAG, '') <> ISNULL(sat.CPT_COMPLETE_FLAG, '')
	OR ISNULL(stg.[SUSPEND_FLAG], '') <> ISNULL(sat.[SUSPEND_FLAG], '')
	OR ISNULL(stg.[TOTAL_NRI_ENTERED], 0) <> ISNULL(sat.[TOTAL_NRI_ENTERED], 0)
	OR ISNULL(stg.TOTAL_ROYALTIES_ENTERED, 0) <> ISNULL(sat.TOTAL_ROYALTIES_ENTERED, 0)
	OR ISNULL(stg.TOTAL_WI_ENTERED, 0) <> ISNULL(sat.TOTAL_WI_ENTERED, 0)

--INSERT new IDs into the LandDeck Sat
INSERT INTO 
	DW.SatLandDeck
(
	LandDeckHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	[DESCRIPTION],
	INACTIVE_DATE,
	INACTIVE_REASON,
	MAJOR_ACCT,
	SUB_ACCT,
	PROJECT,
	PROPERTY,
	PRODUCT,
	PARENT_DOI,
	NRI_RPTG_DOI,
	WI_RPTG_DECK,
	NRI_COMPLETE_FLAG,
	RI_COMPLETE_FLAG,
	WI_COMPLETE_FLAG,
	BUR_COMPLETE_FLAG,
	CPT_COMPLETE_FLAG,
	SUSPEND_FLAG,
	TOTAL_NRI_ENTERED,
	TOTAL_ROYALTIES_ENTERED,
	TOTAL_WI_ENTERED
)
SELECT
	stg.LandDeckHashKey,
	stg.RecordSource,
	stg.LoadDate,
	stg.LoadEndDate,
	stg.[DESCRIPTION],
	stg.INACTIVE_DATE,
	stg.INACTIVE_REASON,
	stg.MAJOR_ACCT,
	stg.SUB_ACCT,
	stg.PROJECT,
	stg.PROPERTY,
	stg.PRODUCT,
	stg.PARENT_DOI,
	stg.NRI_RPTG_DOI,
	stg.WI_RPTG_DECK,
	stg.NRI_COMPLETE_FLAG,
	stg.RI_COMPLETE_FLAG,
	stg.WI_COMPLETE_FLAG,
	stg.BUR_COMPLETE_FLAG,
	stg.CPT_COMPLETE_FLAG,
	stg.SUSPEND_FLAG,
	stg.TOTAL_NRI_ENTERED,
	stg.TOTAL_ROYALTIES_ENTERED,
	stg.TOTAL_WI_ENTERED
FROM 
	dw.vw_BOLOLandDeckStageData stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.SatLandDeck sat  WITH (NOLOCK)
		WHERE stg.LandDeckHashKey = sat.LandDeckHashKey
		) 
	AND	stg.LandDeckHashKey IS NOT NULL

--INSERT changed data for exisitng IDs in the LandDeck Sat
INSERT INTO 
	DW.SatLandDeck
(
	LandDeckHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	[DESCRIPTION],
	INACTIVE_DATE,
	INACTIVE_REASON,
	MAJOR_ACCT,
	SUB_ACCT,
	PROJECT,
	PROPERTY,
	PRODUCT,
	PARENT_DOI,
	NRI_RPTG_DOI,
	WI_RPTG_DECK,
	NRI_COMPLETE_FLAG,
	RI_COMPLETE_FLAG,
	WI_COMPLETE_FLAG,
	BUR_COMPLETE_FLAG,
	CPT_COMPLETE_FLAG,
	SUSPEND_FLAG,
	TOTAL_NRI_ENTERED,
	TOTAL_ROYALTIES_ENTERED,
	TOTAL_WI_ENTERED
)
SELECT DISTINCT
	stg.LandDeckHashKey,
	stg.RecordSource,
	stg.LoadDate,
	NULL,
	stg.[DESCRIPTION],
	stg.INACTIVE_DATE,
	stg.INACTIVE_REASON,
	stg.MAJOR_ACCT,
	stg.SUB_ACCT,
	stg.PROJECT,
	stg.PROPERTY,
	stg.PRODUCT,
	stg.PARENT_DOI,
	stg.NRI_RPTG_DOI,
	stg.WI_RPTG_DECK,
	stg.NRI_COMPLETE_FLAG,
	stg.RI_COMPLETE_FLAG,
	stg.WI_COMPLETE_FLAG,
	stg.BUR_COMPLETE_FLAG,
	stg.CPT_COMPLETE_FLAG,
	stg.SUSPEND_FLAG,
	stg.TOTAL_NRI_ENTERED,
	stg.TOTAL_ROYALTIES_ENTERED,
	stg.TOTAL_WI_ENTERED
FROM 
	dw.vw_BOLOLandDeckStageData stg
LEFT JOIN
	dw.SatLandDeck sat WITH (NOLOCK)
ON
	stg.LandDeckHashKey = sat.LandDeckHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.[DESCRIPTION], '') <> ISNULL(sat.[DESCRIPTION], '')
	OR ISNULL(stg.[INACTIVE_DATE], '') <> ISNULL(sat.[INACTIVE_DATE], '')
	OR ISNULL(stg.[INACTIVE_REASON], '') <> ISNULL(sat.[INACTIVE_REASON], '')
	OR ISNULL(stg.[MAJOR_ACCT], '') <> ISNULL(sat.[MAJOR_ACCT], '')
	OR ISNULL(stg.[SUB_ACCT], '') <> ISNULL(sat.[SUB_ACCT], '')
	OR ISNULL(stg.PROJECT, '') <> ISNULL(sat.PROJECT, '')
	OR ISNULL(stg.PROPERTY, '') <> ISNULL(sat.PROPERTY, '')
	OR ISNULL(stg.PRODUCT, '') <> ISNULL(sat.PRODUCT, '')
	OR ISNULL(stg.[PARENT_DOI], '') <> ISNULL(sat.[PARENT_DOI], '')
	OR ISNULL(stg.[NRI_RPTG_DOI], '') <> ISNULL(sat.[NRI_RPTG_DOI], '')
	OR ISNULL(stg.[WI_RPTG_DECK], '') <> ISNULL(sat.[WI_RPTG_DECK], '')
	OR ISNULL(stg.[NRI_COMPLETE_FLAG], '') <> ISNULL(sat.[NRI_COMPLETE_FLAG], '')
	OR ISNULL(stg.[RI_COMPLETE_FLAG], '') <> ISNULL(sat.[RI_COMPLETE_FLAG], '')
	OR ISNULL(stg.[WI_COMPLETE_FLAG], '') <> ISNULL(sat.[WI_COMPLETE_FLAG], '')
	OR ISNULL(stg.BUR_COMPLETE_FLAG, '') <> ISNULL(sat.BUR_COMPLETE_FLAG, '')
	OR ISNULL(stg.CPT_COMPLETE_FLAG, '') <> ISNULL(sat.CPT_COMPLETE_FLAG, '')
	OR ISNULL(stg.[SUSPEND_FLAG], '') <> ISNULL(sat.[SUSPEND_FLAG], '')
	OR ISNULL(stg.[TOTAL_NRI_ENTERED], 0) <> ISNULL(sat.[TOTAL_NRI_ENTERED], 0)
	OR ISNULL(stg.TOTAL_ROYALTIES_ENTERED, 0) <> ISNULL(sat.TOTAL_ROYALTIES_ENTERED, 0)
	OR ISNULL(stg.TOTAL_WI_ENTERED, 0) <> ISNULL(sat.TOTAL_WI_ENTERED, 0)

--UPDATE load end dates for changed data. 
UPDATE
	SatLandDeck
SET 
	LoadEndDate = 
		(
		SELECT
			DATEADD(ss, -1, MIN(z.LoadDate))
		FROM 
			SatLandDeck z WITH (NOLOCK)
		WHERE
			z.LandDeckHashKey = a.LandDeckHashKey
		AND 
			z.LoadDate > a.LoadDate
		AND
			z.LoadEndDate IS NULL
		)
FROM 
	SatLandDeck a WITH (NOLOCK)
WHERE
	LoadEndDate IS NULL
AND EXISTS
	(
	SELECT 1
	FROM #landdeck_changes b
	WHERE b.LandDeckHashKey = a.LandDeckHashKey
	)

--Release temp space used
IF OBJECT_ID('tempdb..#landdeck_changes') IS NOT NULL DROP TABLE #landdeck_changes

COMMIT TRANSACTION

--Roll back open transactions
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

BEGIN TRANSACTION

--Get list of LandDeckInterestHashKeys that have changed
IF OBJECT_ID('tempdb..#landinterest_changes') IS NOT NULL DROP TABLE #landinterest_changes

SELECT DISTINCT
	stg.[LandDeckInterestHashKey]
INTO
	#landinterest_changes
FROM 
	dw.vw_BOLOLandDeckInterestStageData stg
LEFT JOIN
	dw.SatLandDeckInterest sat WITH (NOLOCK)
ON
	stg.[LandDeckInterestHashKey] = sat.LandDeckInterestHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.Effective_Date, '') <> ISNULL(sat.Effective_Date, '')
	OR ISNULL(stg.Expiration_Date, '') <> ISNULL(sat.Expiration_Date, '')
	OR ISNULL(stg.NRI_INTEREST_TYPES, '') <> ISNULL(sat.NRI_INTEREST_TYPES, '')
	OR ISNULL(stg.NET_REVENUE_INTERESTS, 0) <> ISNULL(sat.NET_REVENUE_INTERESTS, 0)
	OR ISNULL(stg.NRI_PAY_CODES, '') <> ISNULL(sat.NRI_PAY_CODES, '')
	OR ISNULL(stg.WI_PARENT_DECK, '') <> ISNULL(sat.WI_PARENT_DECK, '')
	OR ISNULL(stg.WORKING_INTERESTS, 0) <> ISNULL(sat.WORKING_INTERESTS, 0)

--INSERT new IDs into the LandDeckInterest Sat
INSERT INTO 
	DW.SatLandDeckInterest
(
	LandDeckInterestHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	Effective_Date,
	Expiration_Date,
	NRI_INTEREST_TYPES,
	NET_REVENUE_INTERESTS,
	NRI_PAY_CODES,
	WI_PARENT_DECK,
	WORKING_INTERESTS
)
SELECT
	stg.LandDeckInterestHashKey,
	stg.RecordSource,
	stg.LoadDate,
	stg.LoadEndDate,
	stg.Effective_Date,
	stg.Expiration_Date,
	stg.NRI_INTEREST_TYPES,
	stg.NET_REVENUE_INTERESTS,
	stg.NRI_PAY_CODES,
	stg.WI_PARENT_DECK,
	stg.WORKING_INTERESTS
FROM 
	dw.vw_BOLOLandDeckInterestStageData stg
WHERE
	NOT EXISTS 
		(
		SELECT 1 
		FROM DW.SatLandDeckInterest sat  WITH (NOLOCK)
		WHERE stg.LandDeckInterestHashKey = sat.LandDeckInterestHashKey
		) 
	AND	stg.LandDeckInterestHashKey IS NOT NULL

--INSERT changed data for exisitng IDs in the Party Sat
INSERT INTO 
	DW.SatLandDeckInterest
(
	LandDeckInterestHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	Effective_Date,
	Expiration_Date,
	NRI_INTEREST_TYPES,
	NET_REVENUE_INTERESTS,
	NRI_PAY_CODES,
	WI_PARENT_DECK,
	WORKING_INTERESTS
)
SELECT DISTINCT
	stg.LandDeckInterestHashKey,
	stg.RecordSource,
	stg.LoadDate,
	NULL,
	stg.Effective_Date,
	stg.Expiration_Date,
	stg.NRI_INTEREST_TYPES,
	stg.NET_REVENUE_INTERESTS,
	stg.NRI_PAY_CODES,
	stg.WI_PARENT_DECK,
	stg.WORKING_INTERESTS
FROM 
	dw.vw_BOLOLandDeckInterestStageData stg
LEFT JOIN
	dw.SatLandDeckInterest sat WITH (NOLOCK)
ON
	stg.LandDeckInterestHashKey = sat.LandDeckInterestHashKey
	AND sat.LoadEndDate IS NULL
WHERE
	ISNULL(stg.Effective_Date, '') <> ISNULL(sat.Effective_Date, '')
	OR ISNULL(stg.Expiration_Date, '') <> ISNULL(sat.Expiration_Date, '')
	OR ISNULL(stg.NRI_INTEREST_TYPES, '') <> ISNULL(sat.NRI_INTEREST_TYPES, '')
	OR ISNULL(stg.NET_REVENUE_INTERESTS, 0) <> ISNULL(sat.NET_REVENUE_INTERESTS, 0)
	OR ISNULL(stg.NRI_PAY_CODES, '') <> ISNULL(sat.NRI_PAY_CODES, '')
	OR ISNULL(stg.WI_PARENT_DECK, '') <> ISNULL(sat.WI_PARENT_DECK, '')
	OR ISNULL(stg.WORKING_INTERESTS, 0) <> ISNULL(sat.WORKING_INTERESTS, 0)

--UPDATE load end dates for changed data.
UPDATE
	SatLandDeckInterest
SET 
	LoadEndDate = 
		(
		SELECT
			DATEADD(ss, -1, MIN(z.LoadDate))
		FROM 
			SatLandDeckInterest z WITH (NOLOCK)
		WHERE
			z.LandDeckInterestHashKey = a.LandDeckInterestHashKey
		AND 
			z.LoadDate > a.LoadDate
		)
FROM 
	SatLandDeckInterest a WITH (NOLOCK)
WHERE
	LoadEndDate IS NULL
AND EXISTS
	(
	SELECT 1
	FROM #landinterest_changes b
	WHERE b.LandDeckInterestHashKey = a.LandDeckInterestHashKey
	)

--Release temp space used
IF OBJECT_ID('tempdb..#landinterest_changes') IS NOT NULL DROP TABLE #landinterest_changes

COMMIT TRANSACTION
END