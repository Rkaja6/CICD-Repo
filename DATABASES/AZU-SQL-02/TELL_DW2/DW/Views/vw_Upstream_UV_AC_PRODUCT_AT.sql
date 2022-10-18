
/******************************
** Name:  vw_Upstream_UV_AC_PRODUCT_AT
** Desc:  View used to populate the upstream table UV_AC_PRODUCT_AT
** Auth:  Aaron Vogt
** Date:  11/12/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/12/2019   Aaron V   Object creation
** 2    11/20/2019   Aaron V   After loading the production satellite, found that this failed, so combined 
**                             IHS and DI MP extracts to reduce duplicate trips to the satellite
*******************************/
CREATE VIEW [DW].[vw_Upstream_UV_AC_PRODUCT_AT]
	AS 
WITH
ProductionWellHashList AS
(
	SELECT DISTINCT
		prod.WellHashKey,
		hub.API14,
		prod.ProductionDate
	FROM
		[DW].[SatProduction] prod WITH (NOLOCK)
	INNER JOIN
		DW.HubWell hub
	ON
		prod.WellHashKey = hub.WellHashKey
	INNER JOIN
		DW.SatWellHeader wh
	ON
		prod.WellHashKey = wh.WellHashKey
--	WHERE 
--		(wh.State = 'TX' OR wh.State = 'TEXAS') AND
--		(wh.County = 'HARRIS' OR wh.County = 'HARRIS' + ' (' + 'TX' + ')')
),
MPBySource AS
(
SELECT
	prod.RecordSource, 
	whl.WellHashKey,
	prod.ProductionDate,
	SUM(prod.Liquid) AS TOT_LIQUID,
	SUM(prod.Gas) AS TOT_GAS,
	SUM(prod.Water) AS TOT_WATER,
	MAX(prod.WellCount) AS MAX_NUM_WELLS,
	MAX(prod.DaysOn) AS MAX_DAYS_ON,
	SUM(COALESCE(prod.Liquid, 0) + COALESCE(prod.Gas,0) / 6) AS TOT_BOE,
	MIN(prod.LoadDate) AS RECORD_CREATION_DATE,
	MAX(prod.LoadDate) AS RECORD_UPDATE_DATE
FROM
	[DW].[SatProduction] prod WITH (NOLOCK)
INNER JOIN
	ProductionWellHashList whl
ON
	prod.WellHashKey = whl.WellHashKey
WHERE
	prod.ProductionDate IS NOT NULL AND
	prod.LoadEndDate IS NULL
GROUP BY
	prod.RecordSource, whl.WellHashKey, prod.ProductionDate
),
MP AS
(
SELECT
	whl.API14 AS API,
	COALESCE(IHS.ProductionDate, DI.ProductionDate) AS ProductionDate,
	COALESCE(IHS.TOT_LIQUID, DI.TOT_LIQUID,0) AS TOT_LIQUID,
	COALESCE(IHS.TOT_GAS, DI.TOT_GAS,0) AS TOT_GAS,
	COALESCE(IHS.TOT_WATER, DI.TOT_WATER,0) AS TOT_WATER,
	COALESCE(IHS.MAX_NUM_WELLS, DI.MAX_NUM_WELLS) AS MAX_NUM_WELLS,
	COALESCE(IHS.MAX_DAYS_ON, DI.MAX_DAYS_ON) AS MAX_DAYS_ON,
	COALESCE(IHS.TOT_BOE, DI.TOT_BOE) AS TOT_BOE,
	COALESCE(IHS.RECORD_CREATION_DATE, DI.RECORD_CREATION_DATE) AS RECORD_CREATION_DATE,
	COALESCE(IHS.RECORD_UPDATE_DATE, DI.RECORD_UPDATE_DATE) AS RECORD_UPDATE_DATE
FROM
	ProductionWellHashList whl
LEFT JOIN
	MPBySource ihs
ON
	ihs.WellHashKey = whl.WellHashKey AND
	ihs.RecordSource = 'IHS Monthly Production' AND
	ihs.ProductionDate = whl.ProductionDate
LEFT JOIN
	MPBySource di
ON
	di.WellHashKey = whl.WellHashKey AND
	di.RecordSource = 'DI Producing Entities' AND
	di.ProductionDate = whl.ProductionDate
),
PeakProd AS
(
SELECT 
	MAX(TOT_BOE) AS MaxBOE, 
	API 
FROM MP
GROUP BY API
),
PeakProdDate AS
(
SELECT 
	MAX(MP.ProductionDate) AS PeakProdDate,
	MP.API
FROM MP
INNER JOIN PeakProd
ON MP.API = PeakProd.API
AND MP.TOT_BOE = PeakProd.MaxBOE
GROUP BY MP.API
),
FirstProdDate AS
(
SELECT 
	MIN(MP.ProductionDate) AS FirstProdDate,
	MP.API
FROM MP
WHERE TOT_BOE > 0
GROUP BY MP.API
)
SELECT
	MP.API,
	MP.ProductionDate AS Month_Start_Date,
	YEAR(MP.ProductionDate) AS YEAR,
	MONTH(MP.ProductionDate) AS MONTH,
	TOT_LIQUID,
	TOT_GAS,
	TOT_WATER,
	TOT_BOE,
	MAX_NUM_WELLS,
	MAX_DAYS_ON,
	RECORD_CREATION_DATE,
	RECORD_UPDATE_DATE,
	PeakProdDate.PeakProdDate,
	FirstProdDate.FirstProdDate,
	DATEDIFF(month,PeakProdDate,MP.ProductionDate) AS Months_Since_PeakProd,
	DATEDIFF(month,FirstProdDate,MP.ProductionDate) AS Months_Since_FirstProd,
	NULL AS TPC_Play_Name,
	NULL AS EIA_Play_Name
FROM MP
LEFT JOIN PeakProdDate 
ON MP.API = PeakProdDate.API
LEFT JOIN FirstProdDate
ON MP.API = FirstProdDate.API
WHERE
	MP.ProductionDate IS NOT NULL