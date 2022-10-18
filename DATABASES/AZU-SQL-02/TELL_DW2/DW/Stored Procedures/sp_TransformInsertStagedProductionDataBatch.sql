


/******************************
** Name:  sp_TransformInsertStagedProductionDataBatch
** Desc:
** Auth:  Aaron Vogt
** Date:  1/19/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    1/19/2020   Aaron V    Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedProductionDataBatch]
@apiPrefix VARCHAR(200)
AS
BEGIN

PRINT 'Executing [sp_TransformInsertStagedProductionDataBatch] for prefix ' + @apiPrefix

DELETE
	sp
FROM
	DW.SatProduction sp
INNER JOIN
	DW.HubWell h
ON
	sp.WellHashKey = h.WellHashKey
	AND sp.RecordSource = 'IHS Monthly Production'
	AND h.API14 LIKE @apiPrefix + '%'
WHERE
	sp.RecordSource = 'IHS Monthly Production'
	and h.API14 LIKE @apiPrefix + '%'

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
	WHERE 
		prod.API LIKE @apiPrefix + '%'
	GROUP BY
		prod.API, prod.[YEAR], prod.[MONTH], prod.[ENTITY_TYPE]
	) A
WHERE ProductionMonthSequence = 1;

DELETE
	sp
FROM
	DW.SatProduction sp
INNER JOIN
	DW.HubWell h
ON
	sp.WellHashKey = h.WellHashKey AND
	sp.RecordSource = 'DI Producing Entities'
	and h.API14 LIKE @apiPrefix + '%'
WHERE
	sp.RecordSource = 'DI Producing Entities'
	and h.API14 LIKE @apiPrefix + '%'

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
	HASHBYTES('SHA2_256', LEFT(prod.ApiNo, 14)) AS [WellHashKey],
    'DI Producing Entities' AS [RecordSource],
    COALESCE(MAX(prod.UpdatedDate), MAX(prod.CreatedDate)) AS [LoadDate],
    CONVERT(DATETIME2(7), NULL) AS [LoadEndDate],
	prod.ProdDate AS [ProductionDate],
    SUM(prod.Liq) AS [Liquid],
    SUM(prod.Gas) AS [Gas],
    SUM(prod.Wtr) AS [Water],
    SUM(prod.Wcnt) AS [WellCount],
    AVG(prod.Days) AS [DaysOn]
FROM 
	StageDI.ProducingEntityDetails prod WITH (NOLOCK)
WHERE
	prod.ApiNo LIKE @apiPrefix + '%' AND
	(prod.DeletedDate IS NULL OR
	prod.DeletedDate = '01/01/1900')
GROUP BY
	prod.ApiNo, prod.ProdDate

END