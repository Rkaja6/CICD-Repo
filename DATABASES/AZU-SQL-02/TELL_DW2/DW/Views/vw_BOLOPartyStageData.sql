

/******************************
** Name: [vw_BOLOPartyStageData]
** Desc:
** Auth:  Dee Glazebrook
** Date:  11/18/19
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/18/2019   Dee       Object creation
** 2    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/
CREATE VIEW [DW].[vw_BOLOPartyStageData] AS
SELECT  
	HASHBYTES('SHA2_256', BASE_ID) AS [PartyHashKey],
	'BOLO NAME' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	CONVERT(VARCHAR(50), BASE_ID) AS [NAME_Base_ID],
	[ALT_LOOKUP] as [Alt_Name],
	[Entity_Type],
    [LAND_TEN99_EXEMPT] as [Land_1099_Exempt],
    [NAME1] as [Name_Line_1],
    [NAME2] as [Name_Line_2],
    [NAME3] as [Name_Line_3],
    [Name_Control_1099],
    [Residence_State],
    [Sort_Key],
    [Tax_Entity_Type],
    [Tax_ID],
    [W8],
    [W8_Eff_Date],
	[W9],
    [W9_Eff_Date],
	CASE 
		WHEN BASE_ID in ('650','651','652') THEN 'Y'
		ELSE 'N'
	END AS InternalEntityFlag
FROM 
	[StageBOLO].[NAME] N WITH (NOLOCK)
WHERE SITE IS NULL