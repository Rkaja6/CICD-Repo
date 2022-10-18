


/******************************
** Name:  [vw_BOLOAFEStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/10/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/10/2019   Aaron     Object creation
** 2    11/20/2019   Dee       Changed view to include data for loading AFE satellite as well as hub
** 3    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/
CREATE VIEW [DW].[vw_BOLOAFEStageData] AS
SELECT DISTINCT
	HASHBYTES('SHA2_256', u2_id) AS AFEHashKey,
	'BOLO Projects' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2 (7), NULL) AS LoadEndDate,
	CONVERT(VARCHAR(50), PROJ_NO) AS AFENumber,
	[AFE_CATEGORY],
	AFE_DATE,
	AFE_TYPE,
	[NAME],
	[DESCRIPTION],
	[STATUS],
	SUPPLEMENT_NO,
	SUPP_REF,
	APPR,
	APPR_DATE,
	BUDGET_YEAR,
	COMPLETE_FLAG,
	EXP_DATE,
	FORMATION,
	MANAGER,
	OPERATOR_AFE,
	HASHBYTES('SHA2_256', COST_CENTER) AS CostCenterHashKey,
	HASHBYTES('SHA2_256', CONCAT(u2_id,'|',COST_CENTER)) AS [AFECostCenterHashKey],
-- may have to revisit this code when we start doing AFE supplements. don't know how BOLO handles supplements currently.
	HASHBYTES('SHA2_256', SUPPLEMENT_NO) AS SuppAFEHashKey,
	HASHBYTES('SHA2_256', CONCAT(u2_id,'|',SUPPLEMENT_NO)) AS [LinkAFESuppHashKey]
FROM 
	[StageBOLO].[PROJ] WITH (NOLOCK)