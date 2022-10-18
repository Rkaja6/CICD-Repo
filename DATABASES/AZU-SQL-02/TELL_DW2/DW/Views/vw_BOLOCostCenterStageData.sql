



/******************************
** Name:  vw_BOLO_CostCenterStageData
** Desc:
** Auth:  Aaron Vogt
** Date:  09/10/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/09/2019   Aaron     Object creation
** 2    11/21/2019   Dee       Added more fields
** 3    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/

-- To Do: include join to LEGAL_DESC table?

CREATE VIEW [DW].[vw_BOLOCostCenterStageData] AS
SELECT 
	HASHBYTES('SHA2_256', CC.u2_id) AS [CostCenterHashKey],
	'BOLO CC' AS RecordSource,
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	CONVERT(CHAR(32), HASHBYTES('SHA2_256', W.COMPANY)) AS [CompanyPartyHashKey],
	CONVERT(CHAR(32), HASHBYTES('SHA2_256', W.OPERATOR)) AS [OperatorPartyHashKey],
	CONVERT(CHAR(32), HASHBYTES('SHA2_256', W.API_WELL_NO)) AS [WellHashKey],
	CONVERT(CHAR(32), HASHBYTES('SHA2_256', CONCAT(W.API_WELL_NO,'|',CC.u2_id))) AS WellCostCenterHashKey,
	CONVERT(CHAR(32), HASHBYTES('SHA2_256', CONCAT(CC.u2_id,'|',W.COMPANY,'|',W.OPERATOR))) AS CostCenterPartiesHashKey,
    CC.u2_id AS CC_UID,
    CC.NAME AS CostCenterName,
    CC.SHADOW_KEY AS CostCenterNumber,
    CC.TYPE AS CostCenterType,
	CC.EXP_DATE,
	CC.MANAGER,
	W.[DESCRIPTION],
    W.[STATE],
    C.NAME AS County,
    D.NAME AS District,
    D.SHADOW_KEY AS DistrictNumber,
    A.NAME AS Area,
    A.SHADOW_KEY AS AreaNumber,
    F.NAME AS Field,
    F.SHADOW_KEY AS FieldNumber,
    P.NAME AS Prospect,
    P.SHADOW_KEY AS ProspectNumber,
    OP.NAME1 as Operator,
	CC.API_WELL_NO AS CC_API_Number,
    W.API_WELL_NO AS API14,
    W.LAST_STATUS,
    W.NAME AS WellName,
	W.COMPANY as CompanyID,
	W.COMPLETION_DATE,
	W.DATE_OF_FIRST_SALE,
	W.FIRST_GAS_PROD_DATE,
	W.FIRST_OIL_PROD_DATE,
	W.FIRST_WATER_PROD_DATE,
	W.SPUD_DATE,
	W.TERMINATION_DATE,
	W.TERMINATION_REMARKS,
	W.TERMINATION_TYPE,
	W.INPUT_DATE,
	W.INPUT_USER,
    W.NRI_RPTG_DOI,
    W.WI_RPTG_DECK
FROM StageBOLO.CC WITH (NOLOCK)
LEFT JOIN StageBOLO.WELL_INFO W WITH (NOLOCK)
    ON CC.u2_id = W.u2_id
LEFT JOIN StageBOLO.AREA A WITH (NOLOCK)
    ON W.AREA = A.u2_id
LEFT JOIN StageBOLO.DISTRICT D WITH (NOLOCK)
    ON W.DISTRICT = D.u2_id
LEFT JOIN StageBOLO.FIELD F WITH (NOLOCK)
    ON W.FIELD_ID = F.u2_id
LEFT JOIN StageBOLO.CTY C WITH (NOLOCK)
    ON W.COUNTY = C.u2_id
LEFT JOIN StageBOLO.PROSPECT P WITH (NOLOCK)
    ON W.PROSPECT = P.u2_id
LEFT JOIN StageBOLO.[NAME] OP WITH (NOLOCK)
	ON W.OPERATOR = OP.u2_id