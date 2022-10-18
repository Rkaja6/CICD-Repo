/******************************
** Name:  [vw_PelotonAFEStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  11/20/2019
**************************
** Change History
**************************
** PR   Date         Author		Description 
** --   ----------   -------	------------------------------------
** 1    02/25/2020   Aaron Vogt Object creation
*******************************/
CREATE VIEW [Research].[vw_TotalProductionByAreaAPIAsOfFirstProdDate] AS
SELECT 
	thiswh.API14,
	SUM(othersprod.TOT_LIQUID) AS TotalLiquidAreaPriorToFirstProdDate,
	SUM(othersprod.TOT_GAS) AS TotalGasAreaPriorToFirstProdDate,
	SUM(othersprod.TOT_BOE) AS TotalBOEAreaPriorToFirstProdDate,
	SUM(othersprod.TOT_WATER) AS TotalWaterAreaPriorToFirstProdDate
FROM 
	[Research].[WellHeaderGridLocation] thisgrid
INNER JOIN
	[Upstream].[WellHeader] thiswh
ON
	thisgrid.API14 = thiswh.API14
INNER JOIN
	[Research].[WellHeaderGridLocation] othersgrid
ON
	thisgrid.TranslatedCoordinateX = othersgrid.TranslatedCoordinateX AND
	thisgrid.TranslatedCoordinateY = othersgrid.TranslatedCoordinateY AND
	othersgrid.API14 <> thisgrid.API14
INNER JOIN
	[Upstream].[UV_AC_PRODUCT_AT] othersprod
ON
	othersgrid.API14 = othersprod.API AND
	thiswh.Date_First_Production > DATEFROMPARTS(othersprod.YEAR, othersprod.MONTH, 1)
GROUP BY
	thiswh.API14