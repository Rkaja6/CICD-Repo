
/******************************
** Name:  [vw_DIProductionSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  11/06/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/06/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [DW].[vw_DIProductionSatStageData]
	AS 
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
	--ROW_NUMBER() OVER (PARTITION BY prod1.ApiNo, prod1.ProdDate ORDER BY prod1.UpdatedDate DESC, prod1.CreatedDate DESC) AS ProductionRecordSequence
FROM 
	StageDI.ProducingEntityDetails prod WITH (NOLOCK)
WHERE
	prod.DeletedDate IS NULL OR
	prod.DeletedDate = '01/01/1900'
GROUP BY
	prod.ApiNo, prod.ProdDate