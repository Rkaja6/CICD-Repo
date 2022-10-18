

/******************************
** Name:  [vw_BOLOLandDeckInterestStageData]
** Desc:
** Auth:  Dee Glazebrook
** Date:  11/19/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/19/2019   Dee       Object creation
** 2    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/
CREATE VIEW [DW].[vw_BOLOLandDeckInterestStageData] AS

SELECT 
	HASHBYTES('SHA2_256', CONCAT('DIV','|',DIV_NRI_ID)) AS [LandDeckInterestHashKey],
	'DIV' AS Deck_Type,
	DIV_NRI_ID AS Interest_ID,
	HASHBYTES('SHA2_256', CONCAT('DIV','|',DIV_NRI_ID,'|',u2_id,'|',NRI_OWNERS)) AS [LinkLandDeckInterestHashKey],
	HASHBYTES('SHA2_256', CONCAT('DIV','|',u2_id)) AS [LandDeckHashKey],
	HASHBYTES('SHA2_256', NRI_OWNERS) AS [Owner_PartyHashKey],
	'BOLO DIV_NRI' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2 (7), NULL) AS LoadEndDate,
	NRI_EFF_DATES AS Effective_Date,
	NRI_EXP_DATES AS Expiration_Date,
	NRI_INTEREST_TYPES,
	NET_REVENUE_INTERESTS,
	NRI_PAY_CODES,
	CONVERT(varchar(6), NULL) AS [WI_PARENT_DECK],
	CONVERT(numeric(19,8), NULL) AS [WORKING_INTERESTS]
FROM
	[StageBOLO].DIV_NRI WITH (NOLOCK)

UNION ALL

SELECT 
	CONVERT(CHAR(32), HASHBYTES('SHA2_256', CONCAT('BDECK','|',BDECK_WI_ID))) AS [LandDeckInterestHashKey],
	'BDECK' AS Deck_Type,
	BDECK_WI_ID AS Interest_ID,
	CONVERT(CHAR(32), HASHBYTES('SHA2_256', CONCAT('BDECK','|',BDECK_WI_ID,'|',u2_id,'|',WI_OWNERS))) AS [LinkLandDeckInterestHashKey],
	CONVERT(CHAR(32), HASHBYTES('SHA2_256', CONCAT('BDECK','|',u2_id))) AS [LandDeckHashKey],
	CONVERT(CHAR(32), HASHBYTES('SHA2_256', WI_OWNERS)) AS [Owner_PartyHashKey],
	'BOLO BDECK_WI' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2 (7), NULL) AS LoadEndDate,
	WI_EFF_DATES AS Effective_Date,
	WI_EXP_DATES AS Expiration_Date,
	CONVERT(varchar(4), NULL) AS NRI_INTEREST_TYPES,
	CONVERT(numeric(19,8), NULL) AS NET_REVENUE_INTERESTS,
	CONVERT(varchar(4), NULL) AS NRI_PAY_CODES,
	PARENT_DECK AS [WI_PARENT_DECK],
	[WORKING_INTERESTS]
FROM
	[StageBOLO].BDECK_WI WITH (NOLOCK)