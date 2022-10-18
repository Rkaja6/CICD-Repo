/******************************
** Name:  sp_TransformInsertStagedProductionData
** Desc:
** Auth:  Aaron Vogt
** Date:  11/7/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/7/2019   Aaron V    Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedProductionData]
AS
BEGIN

UPDATE
	sp
SET
	LoadEndDate = sp.LoadDate
FROM
	DW.SatProduction sp
INNER JOIN
	DW.vw_IHSProductionSatStageData stg
ON
	sp.WellHashKey = stg.WellHashKey AND
	sp.RecordSource = stg.RecordSource AND
	sp.ProductionDate = stg.ProductionDate AND
	sp.LoadDate < stg.LoadDate AND
	sp.LoadEndDate IS NULL

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
LEFT JOIN
	DW.SatProduction sp WITH (NOLOCK)
ON
	stg.WellHashKey = sp.WellHashKey AND
	stg.RecordSource = sp.RecordSource AND
	stg.ProductionDate = sp.ProductionDate
WHERE
	sp.WellHashKey IS NULL AND
	sp.LoadEndDate IS NULL

UPDATE
	sp
SET
	LoadEndDate = sp.LoadDate
FROM
	DW.SatProduction sp
INNER JOIN
	DW.vw_DIProductionSatStageData stg
ON
	sp.WellHashKey = stg.WellHashKey AND
	sp.RecordSource = stg.RecordSource AND
	sp.ProductionDate = stg.ProductionDate AND
	sp.LoadDate < stg.LoadDate AND
	sp.LoadEndDate IS NULL

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