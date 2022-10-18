/******************************
** Name:  vw_Upstream_UV_PEAK_PROD_AT
** Desc:  View used to populate the upstream table UV_PEAK_PROD_AT
** Auth:  Aaron Vogt
** Date:  12/4/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    12/4/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [DW].[vw_Upstream_UV_PEAK_PROD_AT] AS 
WITH
ProductionWellHashList AS
(
	SELECT DISTINCT
		prod.WellHashKey,
		hub.API14
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
		--(wh.State = 'TX' OR wh.State = 'TEXAS') AND
		--(wh.County = 'HARRIS' OR wh.County = 'HARRIS' + ' (' + 'TX' + ')')
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
	ihs.RecordSource = 'IHS Monthly Production'
LEFT JOIN
	MPBySource di
ON
	di.WellHashKey = whl.WellHashKey AND
	di.RecordSource = 'DI Producing Entities' AND
	di.ProductionDate = ihs.ProductionDate
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
),
Peak1Month AS
(
select 
	prod.api, 
	sum(prod.tot_gas) as gas_1m, 
	sum(prod.tot_liquid) as liq_1m, 
	sum(prod.tot_water) as water_1m, 
	sum(prod.tot_boe) as boe_1m
from [Upstream].[UV_AC_PRODUCT_AT] prod
where prod.months_since_peakprod = 0
group by prod.api
),
Peak3Month AS
(
select 
	prod.api, 
	sum(prod.tot_gas) as gas_3m, 
	sum(prod.tot_liquid) as liq_3m, 
	sum(prod.tot_water) as water_3m, 
	sum(prod.tot_boe) as boe_3m
from [Upstream].[UV_AC_PRODUCT_AT] prod
where prod.months_since_peakprod <= 0 and prod.Months_Since_PeakProd >= -2
group by prod.api
),
Peak6Month AS
(
select 
	prod.api, 
	sum(prod.tot_gas) as gas_6m, 
	sum(prod.tot_liquid) as liq_6m, 
	sum(prod.tot_water) as water_6m, 
	sum(prod.tot_boe) as boe_6m
from [Upstream].[UV_AC_PRODUCT_AT] prod
where prod.months_since_peakprod <= 0 and prod.Months_Since_PeakProd >= -5
group by prod.api
),
Peak12Month AS
(
select 
	prod.api, 
	sum(prod.tot_gas) as gas_12m, 
	sum(prod.tot_liquid) as liq_12m, 
	sum(prod.tot_water) as water_12m, 
	sum(prod.tot_boe) as boe_12m
from [Upstream].[UV_AC_PRODUCT_AT] prod
where prod.months_since_peakprod <= 0 and prod.Months_Since_PeakProd >= -11
group by prod.api
)
SELECT
	H.API14 AS UWI,
	PeakProdDate.PeakProdDate,
	FirstProdDate.FirstProdDate,
	P1.boe_1m,
	P1.gas_1m,
	P1.liq_1m,
	P1.water_1m,
	P3.boe_3m,
	P3.gas_3m,
	P3.liq_3m,
	P3.water_3m,
	P6.boe_6m,
	P6.gas_6m,
	P6.liq_6m,
	P6.water_6m,
	P12.boe_12m,
	P12.gas_12m,
	P12.liq_12m,
	P12.water_12m
FROM DW.HubWell H
LEFT JOIN PeakProdDate 
ON H.API14 = PeakProdDate.API
LEFT JOIN FirstProdDate
ON H.API14 = FirstProdDate.API
LEFT JOIN Peak1Month P1
ON P1.API = H.API14
LEFT JOIN Peak3Month P3
ON P3.API = H.API14
LEFT JOIN Peak6Month P6
ON P6.API = H.API14
LEFT JOIN Peak12Month P12
ON P12.API = H.API14