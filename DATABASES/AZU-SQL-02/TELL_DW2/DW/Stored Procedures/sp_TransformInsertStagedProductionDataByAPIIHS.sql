

/******************************
** Name:  sp_TransformInsertStagedProductionDataByAPIIHS
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
CREATE PROCEDURE [DW].[sp_TransformInsertStagedProductionDataByAPIIHS]

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
	sp.RecordSource = 'IHS Monthly Production';

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
	WellHashKey,
	RecordSource,
	LoadDate,
	LoadEndDate,
	ProductionDate,
	Liquid,
	Gas,
	Water,
	WellCount,
	DaysOn
FROM
	(
	SELECT
		HASHBYTES('SHA2_256', LEFT(prod.API, 14)) AS [WellHashKey],
		'IHS Monthly Production' AS [RecordSource],
		-- Load Date should be date loaded into Data Vault
		GETDATE() AS [LoadDate],
		--COALESCE(MAX(prod.CADIS_SYSTEM_UPDATED), MAX(prod.CADIS_SYSTEM_INSERTED)) AS [LoadDate],
		CONVERT(DATETIME2(7), NULL) AS [LoadEndDate],
		CONVERT(DATETIME2(7), CONVERT(VARCHAR(10), prod.MONTH) + ' 1 ' + CONVERT(VARCHAR(10), prod.YEAR)) AS [ProductionDate],
		SUM(prod.LIQUID) AS [Liquid],
		SUM(prod.GAS) AS [Gas],
		SUM(prod.WATER) AS [Water],
		SUM(prod.WELLS) AS [WellCount],
		AVG(prod.DAYS_ON) AS [DaysOn],
		ROW_NUMBER() OVER 
			(
			PARTITION BY API, [YEAR], [MONTH] 
			ORDER BY 
				CASE prod.ENTITY_TYPE
				WHEN 'WELL' THEN 1 
				WHEN 'LEASE' THEN 2
				WHEN 'ALLOCATED' THEN 3
				WHEN 'DEHYDRATOR' THEN 4
				ELSE 10
			END ASC) AS ProductionMonthSequence
	FROM 
		StageIHS.T_PRODUCTION_MONTHLY_PRODUCTION prod WITH (NOLOCK)
	INNER JOIN 
		StageIHS.API_Update_List api
	ON
		prod.API = api.API14
	GROUP BY
		prod.API, prod.[YEAR], prod.[MONTH], prod.[ENTITY_TYPE]
	) A
WHERE ProductionMonthSequence = 1;

--DELETE
--	sp
--FROM
--	DW.SatProduction sp
--INNER JOIN
--	#apihash apis
--ON
--	sp.WellHashKey = apis.WellHashKey
--WHERE
--	sp.RecordSource = 'DI Producing Entities';

--INSERT INTO
--	DW.SatProduction
--(
--	[WellHashKey],
--	[RecordSource],
--	[LoadDate],
--	[LoadEndDate],
--	[ProductionDate],
--	[Liquid],
--	[Gas],
--	[Water],
--	[WellCount],
--	[DaysOn]
--)
--SELECT
--	stg.[WellHashKey],
--	stg.[RecordSource],
--	stg.[LoadDate],
--	stg.[LoadEndDate],
--	stg.[ProductionDate],
--	stg.[Liquid],
--	stg.[Gas],
--	stg.[Water],
--	stg.[WellCount],
--	stg.[DaysOn]
--FROM
--	DW.vw_DIProductionSatStageData stg
--INNER JOIN
--	#apihash apis
--ON
--	stg.WellHashKey = apis.WellHashKey
--LEFT JOIN
--	DW.SatProduction sp WITH (NOLOCK)
--ON
--	stg.WellHashKey = sp.WellHashKey AND
--	stg.RecordSource = sp.RecordSource AND
--	stg.ProductionDate = sp.ProductionDate
--WHERE
--	sp.WellHashKey IS NULL AND
--	sp.LoadEndDate IS NULL

END