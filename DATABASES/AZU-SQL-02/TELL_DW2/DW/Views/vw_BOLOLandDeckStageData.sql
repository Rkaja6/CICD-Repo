

/******************************
** Name: [vw_BOLOLandDeckStageData]
** Desc:
** Auth:  Dee Glazebrook
** Date:  11/19/19
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/19/2019   Dee       Object creation
** 2    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/
CREATE VIEW [DW].[vw_BOLOLandDeckStageData] AS
SELECT  
	HASHBYTES('SHA2_256', CONCAT('DIV','|',u2_id)) AS [LandDeckHashKey],
	'BOLO DIV' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2 (7), NULL) AS LoadEndDate,
	'DIV' AS [Deck_Type],
	u2_id AS [Deck_ID],
	[DESCRIPTION],
	[INACTIVE_DATE],
    [INACTIVE_REASON],
	CONVERT(varchar(12), NULL) AS [MAJOR_ACCT],
	CONVERT(varchar(12), NULL) AS [SUB_ACCT],
	CONVERT(varchar(10), NULL) AS [PROJECT],
	[PROPERTY],
	[PRODUCT],
	[PARENT_DOI],
	[NRI_RPTG_DOI],
	CONVERT(varchar(4), NULL) AS [WI_RPTG_DECK],
	[NRI_COMPLETE_FLAG],
	[RI_COMPLETE_FLAG],
	[WI_COMPLETE_FLAG],
	[BUR_COMPLETE_FLAG],
	[CPT_COMPLETE_FLAG],
	CONVERT(varchar(4), NULL) AS [SUSPEND_FLAG],
	[TOTAL_NRI_ENTERED],
	[TOTAL_ROYALTIES_ENTERED],
	[TOTAL_WI_ENTERED],
	HASHBYTES('SHA2_256', COMPANY) AS [InternalCo_PartyHashKey],
	HASHBYTES('SHA2_256', COST_CENTER) AS [CostCenterHashKey],
	HASHBYTES('SHA2_256', CONCAT('DIV','|',u2_id,'|',COMPANY,'|',COST_CENTER)) AS [LinkLandDeckHashKey]
FROM 
	[StageBOLO].[DIV] WITH (NOLOCK)
UNION ALL
SELECT  
	HASHBYTES('SHA2_256', CONCAT('BDECK','|',u2_id)) AS [LandDeckHashKey],
	'BOLO BDECK' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2 (7), NULL) AS LoadEndDate,
	'BDECK' AS [Deck_Type],
	u2_id AS [Deck_ID],
	[DESCRIPTION],
	[INACTIVE_DATE],
    CONVERT(varchar(50), NULL) AS [INACTIVE_REASON],
	[MAJOR_ACCT],
	[SUB_ACCT],
	[PROJECT],
	[PROPERTY],
	CONVERT(varchar(3), NULL) AS [PRODUCT],
	CONVERT(varchar(6), NULL) AS [PARENT_DOI],
	CONVERT(varchar(4), NULL) AS [NRI_RPTG_DOI],
	[WI_RPTG_DECK],
	CONVERT(varchar(4), NULL) AS [NRI_COMPLETE_FLAG],
	CONVERT(varchar(4), NULL) AS [RI_COMPLETE_FLAG],
	[WI_COMPLETE_FLAG],
	CONVERT(varchar(4), NULL) AS [BUR_COMPLETE_FLAG],
	CONVERT(varchar(4), NULL) AS [CPT_COMPLETE_FLAG],
	[SUSPEND_FLAG],
	CONVERT(numeric(19,8), NULL) AS [TOTAL_NRI_ENTERED],
	CONVERT(numeric(19,8), NULL) AS [TOTAL_ROYALTIES_ENTERED],
	[TOTAL_WI_ENTERED],
	HASHBYTES('SHA2_256', COMPANY) AS [InternalCo_PartyHashKey],
	HASHBYTES('SHA2_256', COST_CENTER) AS [CostCenterHashKey],
	HASHBYTES('SHA2_256', CONCAT('BDECK','|',u2_id,'|',COMPANY,'|',COST_CENTER)) AS [LinkLandDeckHashKey]
FROM 
	[StageBOLO].[BDECK] WITH (NOLOCK)