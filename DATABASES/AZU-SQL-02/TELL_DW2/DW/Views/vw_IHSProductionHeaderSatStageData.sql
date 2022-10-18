
/******************************
** Name:  [vw_IHSProductionHeaderSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
*******************************/
CREATE VIEW [DW].[vw_IHSProductionHeaderSatStageData] AS
SELECT
	HASHBYTES('SHA2_256', ph1.API) AS WellHashKey,
	'IHS Production Header' AS RecordSource,
	CONVERT(DATETIME2(7), ph1.CADIS_SYSTEM_UPDATED) AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	ph1.ENTITY AS IHSEntity,
	CONVERT(int, NULL) AS DIEntityID
FROM
	[StageIHS].[T_PRODUCTION_PRODUCTION_HEADER] ph1 WITH (NOLOCK)