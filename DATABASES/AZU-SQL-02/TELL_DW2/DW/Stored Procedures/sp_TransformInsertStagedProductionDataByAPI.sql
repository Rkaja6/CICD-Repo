/******************************
** Name:  sp_TransformInsertStagedProductionDataByAPI
** Desc:
** Auth:  Dee G 
** Date:  3/04/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    3/04/2020   Dee G      Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedProductionDataByAPI]

AS
BEGIN

IF OBJECT_ID('tempdb..#apilist') IS NOT NULL DROP TABLE #apihash

SELECT DISTINCT
	hub.WellHashKey
INTO
	#apihash
FROM
	DW.HubWell hub
INNER JOIN
	StageIHS.API_Update_List api
ON 
	api.API14 = hub.API14;

CREATE CLUSTERED INDEX cidx_apilist
ON #apihash(WellHashKey);

DELETE
	sp
FROM
	DW.SatProduction sp
INNER JOIN
	#apihash apis
ON
	sp.WellHashKey = apis.WellHashKey
WHERE
	sp.RecordSource = 'IHS Monthly Production'


INSERT INTO
	DW.SatProduction
(
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[ProductionDate],
	[Liquid],
	[Gas],
	[Water],
	[WellCount],
	[DaysOn]
)
SELECT
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[ProductionDate],
	stg.[Liquid],
	stg.[Gas],
	stg.[Water],
	stg.[WellCount],
	stg.[DaysOn]
FROM
	DW.vw_IHSProductionSatStageData stg
INNER JOIN
	#apihash apis
ON
	stg.WellHashKey = apis.WellHashKey
LEFT JOIN
	DW.SatProduction sp WITH (NOLOCK)
ON
	stg.WellHashKey = sp.WellHashKey AND
	stg.RecordSource = sp.RecordSource AND
	stg.ProductionDate = sp.ProductionDate
WHERE
	sp.WellHashKey IS NULL AND
	sp.LoadEndDate IS NULL;

DELETE
	sp
FROM
	DW.SatProduction sp
INNER JOIN
	#apihash apis
ON
	sp.WellHashKey = apis.WellHashKey
WHERE
	sp.RecordSource = 'DI Producing Entities';

INSERT INTO
	DW.SatProduction
(
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[ProductionDate],
	[Liquid],
	[Gas],
	[Water],
	[WellCount],
	[DaysOn]
)
SELECT
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[ProductionDate],
	stg.[Liquid],
	stg.[Gas],
	stg.[Water],
	stg.[WellCount],
	stg.[DaysOn]
FROM
	DW.vw_DIProductionSatStageData stg
INNER JOIN
	#apihash apis
ON
	stg.WellHashKey = apis.WellHashKey
LEFT JOIN
	DW.SatProduction sp WITH (NOLOCK)
ON
	stg.WellHashKey = sp.WellHashKey AND
	stg.RecordSource = sp.RecordSource AND
	stg.ProductionDate = sp.ProductionDate
WHERE
	sp.WellHashKey IS NULL AND
	sp.LoadEndDate IS NULL

END