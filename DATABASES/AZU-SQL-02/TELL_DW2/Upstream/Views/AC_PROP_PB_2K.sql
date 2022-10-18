/******************************
** Name:  AC_PROP_PB_2K
** Desc:  View to replace the view from IHS Meridian with data from the data warehouse
** Auth:  Aaron Vogt
** Date:  11/18/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/18/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [Upstream].[AC_PROP_PB_2K]
	AS
WITH MP AS
	(
	SELECT 
		MAX(PeakProdDate) AS PeakProdDate,
		MAX(FirstProdDate) AS FirstProdDate, 
		API 
	FROM [Upstream].[AC_PRODUCT_PB_2K]
	GROUP BY API
	),
	Peak1Month AS
	(
	select 
		prod.API, 
		sum(prod.TOT_GAS) as gas_1m, 
		sum(prod.TOT_LIQUID) as liq_1m, 
		sum(prod.TOT_WATER) as water_1m, 
		sum(prod.TOT_BOE) as boe_1m
	from [Upstream].[AC_PRODUCT_PB_2K] prod
	where prod.Months_Since_PeakProd = 0
	group by prod.API
	),
	Peak3Month AS
	(
	select 
		prod.API, 
		sum(prod.TOT_GAS) as gas_3m, 
		sum(prod.TOT_LIQUID) as liq_3m, 
		sum(prod.TOT_WATER) as water_3m, 
		sum(prod.TOT_BOE) as boe_3m
	from [Upstream].[AC_PRODUCT_PB_2K] prod
	where prod.Months_Since_PeakProd <= 0 and prod.Months_Since_PeakProd >= 2
	group by prod.API
	),
	Peak6Month AS
	(
	select 
		prod.API, 
		sum(prod.TOT_GAS) as gas_6m, 
		sum(prod.TOT_LIQUID) as liq_6m, 
		sum(prod.TOT_WATER) as water_6m, 
		sum(prod.TOT_BOE) as boe_6m
	from [Upstream].[AC_PRODUCT_PB_2K] prod
	where prod.Months_Since_PeakProd <= 0 and prod.Months_Since_PeakProd >= 5
	group by prod.API
	),
	Peak12Month AS
	(
	select 
		prod.API, 
		sum(prod.TOT_GAS) as gas_12m, 
		sum(prod.TOT_LIQUID) as liq_12m, 
		sum(prod.TOT_WATER) as water_12m, 
		sum(prod.TOT_BOE) as boe_12m
	from [Upstream].[AC_PRODUCT_PB_2K] prod
	where prod.Months_Since_PeakProd <= 0 and prod.Months_Since_PeakProd >= 11
	group by prod.API
	)
	SELECT
		H.*,
		MP.PeakProdDate,
		MP.FirstProdDate,
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
		P12.water_12m,
		'IHS' as Record_Source
	FROM [Upstream].[AC_PROP_PB] H
	LEFT JOIN MP
	ON H.UWI = MP.API
	LEFT JOIN Peak1Month P1
	ON P1.API = MP.API
	LEFT JOIN Peak3Month P3
	ON P3.API = MP.API
	LEFT JOIN Peak6Month P6
	ON P6.API = MP.API
	LEFT JOIN Peak12Month P12
	ON P12.API = MP.API;