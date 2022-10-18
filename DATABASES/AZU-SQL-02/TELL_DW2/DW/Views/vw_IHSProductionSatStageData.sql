


/******************************
** Name:  [vw_IHSProductionSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  11/06/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/06/2019   Aaron V   Object creation
** 2    03/04/2020   Dee G     Fixed issue where we were double-counting volumes because 
							   there were multiple entity types (Lease, Allocated) for the same API.
*******************************/
CREATE VIEW [DW].[vw_IHSProductionSatStageData]
	AS 
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
	GROUP BY
		prod.API, prod.[YEAR], prod.[MONTH], prod.[ENTITY_TYPE]
	) A
WHERE ProductionMonthSequence = 1