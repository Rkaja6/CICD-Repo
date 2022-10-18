


/******************************
** Name:  sp_Generate_UV_AC_Production_Aggregations_v2
** Desc:  Expansion of the views (e.g. vw_Upstream_UV_AC_PRODUCT_AT) that were originally able to build out the UV_AC_PRODUCT_AT and UV_PEAK_PROD_AT tables.
**			creation of this SP was necessary to get around resources constraints on the hosts that exist as of the date of creation.
** Auth:  Aaron Vogt
** Date:  03/03/2020
**************************
** Change History
**************************
** PR   Date         Author           Description 
** --   ----------   -------		  ------------------------------------
** 1    03/03/2020   Aaron Vogt       Object creation
** 2    03/04/2020   Dee G			  Fixing issues with BOE calc, adding columns for ease of use on Tableau end
*******************************/
CREATE PROCEDURE [DW].[sp_Generate_UV_AC_Production_Aggregations_v2]
	@APIPrefix VARCHAR(50) = ''
AS
BEGIN

DECLARE @CheckpointDateTime DATETIME2(7)

SET @CheckpointDateTime = GETDATE()

PRINT CONVERT(VARCHAR(100), DATEDIFF(MINUTE, @CheckpointDateTime, GETDATE())) + ' Minutes since last checkpoint'
SET @CheckpointDateTime = GETDATE()
PRINT '#ProductionWellHashList creation starting'

IF OBJECT_ID('tempdb..#ProductionWellHashList') IS NOT NULL DROP TABLE #ProductionWellHashList

	SELECT DISTINCT
		prod.WellHashKey,
		hub.API14,
		prod.ProductionDate, 
		wh.[State],
		wh.County,
		CAST(NULL AS varchar(60)) as TPC_Play_Name,
		CAST(NULL AS varchar(60)) as EIA_Play_Name
	INTO
		#ProductionWellHashList
	FROM
		DW.HubWell hub WITH (NOLOCK)
	INNER JOIN
		DW.SatWellHeader wh WITH (NOLOCK)
	ON
		hub.WellHashKey = wh.WellHashKey AND
		hub.API14 LIKE @APIPrefix + '%'
	INNER JOIN		
		[DW].[SatProduction] prod WITH (NOLOCK)
	ON
		prod.WellHashKey = hub.WellHashKey AND
		hub.API14 LIKE @APIPrefix + '%'
	WHERE 
		hub.API14 LIKE @APIPrefix + '%' AND
		prod.ProductionDate IS NOT NULL;

	UPDATE A
	SET A.[State] = B.New_State
	FROM 
		#ProductionWellHashList A
	INNER JOIN
		[Upstream].[RefWell_State] B
	ON B.[State] = A.[State];

	UPDATE A
	SET A.County = B.New_County
	FROM 
		#ProductionWellHashList A
	INNER JOIN
		[Upstream].[RefWell_County] B
	ON B.County = A.County;

	UPDATE A
	SET A.TPC_Play_Name = B.New_Play,
		A.EIA_Play_Name = B.EIA_Play
	FROM 
		#ProductionWellHashList A
	INNER JOIN
		[Upstream].RefWell_PlayByStateCounty B
	ON B.[State] = A.[State]
		AND B.County = A.County;

PRINT CONVERT(VARCHAR(100), DATEDIFF(MINUTE, @CheckpointDateTime, GETDATE())) + ' Minutes since last checkpoint'
SET @CheckpointDateTime = GETDATE()
PRINT '#MPBySource creation starting'

IF OBJECT_ID('tempdb..#MPBySource') IS NOT NULL DROP TABLE #MPBySource

SELECT
	prod.RecordSource, 
	whl.WellHashKey,
	prod.ProductionDate,
	SUM(prod.Liquid) AS TOT_LIQUID,
	SUM(prod.Gas) AS TOT_GAS,
	SUM(prod.Water) AS TOT_WATER,
	MAX(prod.WellCount) AS MAX_NUM_WELLS,
	MAX(prod.DaysOn) AS MAX_DAYS_ON,
	MIN(prod.LoadDate) AS RECORD_CREATION_DATE,
	MAX(prod.LoadDate) AS RECORD_UPDATE_DATE
INTO
	#MPBySource
FROM
	#ProductionWellHashList whl
INNER JOIN
	[DW].[SatProduction] prod WITH (NOLOCK)	
ON
	prod.WellHashKey = whl.WellHashKey AND
	whl.API14 LIKE @APIPrefix + '%'
WHERE
	prod.ProductionDate IS NOT NULL AND
	prod.LoadEndDate IS NULL AND
	whl.API14 LIKE @APIPrefix + '%'
GROUP BY
	prod.RecordSource, whl.WellHashKey, prod.ProductionDate

PRINT CONVERT(VARCHAR(100), DATEDIFF(MINUTE, @CheckpointDateTime, GETDATE())) + ' Minutes since last checkpoint'
SET @CheckpointDateTime = GETDATE()
PRINT '#MP creation starting'

IF OBJECT_ID('tempdb..#MP') IS NOT NULL DROP TABLE #MP

SELECT
	whl.API14 AS API,
	whl.TPC_Play_Name,
	whl.EIA_Play_Name,
	COALESCE(IHS.ProductionDate, DI.ProductionDate) AS ProductionDate,
	COALESCE(IHS.TOT_LIQUID, DI.TOT_LIQUID,0) AS TOT_LIQUID,
	COALESCE(IHS.TOT_GAS, DI.TOT_GAS,0) AS TOT_GAS,
	COALESCE(IHS.TOT_WATER, DI.TOT_WATER,0) AS TOT_WATER,
	COALESCE(IHS.MAX_NUM_WELLS, DI.MAX_NUM_WELLS) AS MAX_NUM_WELLS,
	COALESCE(IHS.MAX_DAYS_ON, DI.MAX_DAYS_ON) AS MAX_DAYS_ON,
	COALESCE(IHS.TOT_LIQUID, DI.TOT_LIQUID,0) + COALESCE(IHS.TOT_GAS, DI.TOT_GAS,0)/6 AS TOT_BOE,
	COALESCE(IHS.RECORD_CREATION_DATE, DI.RECORD_CREATION_DATE) AS RECORD_CREATION_DATE,
	COALESCE(IHS.RECORD_UPDATE_DATE, DI.RECORD_UPDATE_DATE) AS RECORD_UPDATE_DATE
INTO
	#MP
FROM
	#ProductionWellHashList whl
LEFT JOIN
	#MPBySource ihs
ON
	ihs.WellHashKey = whl.WellHashKey AND
	ihs.RecordSource = 'IHS Monthly Production' AND
	ihs.ProductionDate = whl.ProductionDate AND
	whl.API14 LIKE @APIPrefix + '%'
LEFT JOIN
	#MPBySource di
ON
	di.WellHashKey = whl.WellHashKey AND
	di.RecordSource = 'DI Producing Entities' AND
	di.ProductionDate = whl.ProductionDate AND
	whl.API14 LIKE @APIPrefix + '%'

PRINT CONVERT(VARCHAR(100), DATEDIFF(MINUTE, @CheckpointDateTime, GETDATE())) + ' Minutes since last checkpoint'
SET @CheckpointDateTime = GETDATE()
PRINT '#PeakProd creation starting'

IF OBJECT_ID('tempdb..#PeakProd') IS NOT NULL DROP TABLE #PeakProd

SELECT 
	MAX(TOT_BOE) AS MaxBOE, 
	API 
INTO 
	#PeakProd
FROM #MP MP
GROUP BY API

PRINT CONVERT(VARCHAR(100), DATEDIFF(MINUTE, @CheckpointDateTime, GETDATE())) + ' Minutes since last checkpoint'
SET @CheckpointDateTime = GETDATE()
PRINT '#PeakProdDate creation starting'

IF OBJECT_ID('tempdb..#PeakProdDate') IS NOT NULL DROP TABLE #PeakProdDate

SELECT 
	MAX(MP.ProductionDate) AS PeakProdDate,
	MP.API
INTO
	#PeakProdDate
FROM #MP MP
INNER JOIN #PeakProd PeakProd
ON MP.API = PeakProd.API
AND MP.TOT_BOE = PeakProd.MaxBOE
GROUP BY MP.API

PRINT CONVERT(VARCHAR(100), DATEDIFF(MINUTE, @CheckpointDateTime, GETDATE())) + ' Minutes since last checkpoint'
SET @CheckpointDateTime = GETDATE()
PRINT '#FirstProdDate creation starting'

IF OBJECT_ID('tempdb..#FirstProdDate') IS NOT NULL DROP TABLE #FirstProdDate

SELECT 
	MIN(MP.ProductionDate) AS FirstProdDate,
	MP.API
INTO
	#FirstProdDate
FROM #MP MP
WHERE TOT_BOE > 0
GROUP BY MP.API

PRINT CONVERT(VARCHAR(100), DATEDIFF(MINUTE, @CheckpointDateTime, GETDATE())) + ' Minutes since last checkpoint'
SET @CheckpointDateTime = GETDATE()
PRINT 'Main Aggregation starting'

--TO DO: May want to archive the old table here before generation
--These tables are huge, so a transaction probably would choke the host


DELETE FROM [Upstream].[UV_AC_PRODUCT_AT] 
WHERE API LIKE @APIPrefix + '%';

INSERT INTO [Upstream].[UV_AC_PRODUCT_AT] 
(
	[API]
      ,[Month_Start_Date]
      ,[YEAR]
      ,[MONTH]
      ,[TOT_LIQUID]
      ,[TOT_GAS]
      ,[TOT_WATER]
      ,[TOT_BOE]
      ,[MAX_NUM_WELLS]
      ,[MAX_DAYS_ON]
      ,[RECORD_CREATION_DATE]
      ,[RECORD_UPDATE_DATE]
      ,[PeakProdDate]
      ,[FirstProdDate]
      ,[Months_Since_PeakProd]
      ,[Months_Since_FirstProd]
	  ,TPC_Play_Name
	  ,EIA_Play_Name
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
	MP.TPC_Play_Name,
	MP.EIA_Play_Name
FROM #MP MP
LEFT JOIN #PeakProdDate PeakProdDate
ON MP.API = PeakProdDate.API
LEFT JOIN #FirstProdDate FirstProdDate
ON MP.API = FirstProdDate.API;

PRINT CONVERT(VARCHAR(100), DATEDIFF(MINUTE, @CheckpointDateTime, GETDATE())) + ' Minutes since last checkpoint'

END