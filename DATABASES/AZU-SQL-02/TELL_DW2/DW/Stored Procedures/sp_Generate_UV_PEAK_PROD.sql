


/******************************
** Name:  sp_Generate_UV_PEAK_PROD
** Desc:  
** Auth:  Dee Glazebrook
** Date:  03/04/2020
**************************
** Change History
**************************
** PR   Date         Author           Description 
** --   ----------   -------		  ------------------------------------
** 1    03/04/2020   Dee G			  Object Creation
*******************************/
CREATE PROCEDURE [DW].[sp_Generate_UV_PEAK_PROD]
AS
BEGIN

INSERT INTO [Upstream].[UV_PEAK_PROD_AT]
	([UWI]
	,[PeakProdDate]
	,[FirstProdDate]
	,[boe_1m]
	,[gas_1m]
	,[liq_1m]
	,[water_1m]
	,[boe_3m]
	,[gas_3m]
	,[liq_3m]
	,[water_3m]
	,[boe_6m]
	,[gas_6m]
	,[liq_6m]
	,[water_6m]
	,[boe_12m]
	,[gas_12m]
	,[liq_12m]
	,[water_12m])
SELECT
	API,
	PeakProdDate,
	FirstProdDate,
	SUM(CASE WHEN Months_Since_PeakProd = 0 THEN TOT_BOE ELSE 0 END) AS [boe_1m],
	SUM(CASE WHEN Months_Since_PeakProd = 0 THEN TOT_GAS ELSE 0 END) AS [gas_1m],
	SUM(CASE WHEN Months_Since_PeakProd = 0 THEN TOT_LIQUID ELSE 0 END) AS [liq_1m],
	SUM(CASE WHEN Months_Since_PeakProd = 0 THEN TOT_WATER ELSE 0 END) AS [water_1m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 2) THEN TOT_BOE ELSE 0 END) AS [boe_3m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 2) THEN TOT_GAS ELSE 0 END) AS [gas_3m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 2) THEN TOT_LIQUID ELSE 0 END) AS [liq_3m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 2) THEN TOT_WATER ELSE 0 END) AS [water_3m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 5) THEN TOT_BOE ELSE 0 END) AS [boe_6m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 5) THEN TOT_GAS ELSE 0 END) AS [gas_6m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 5) THEN TOT_LIQUID ELSE 0 END) AS [liq_6m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 5) THEN TOT_WATER ELSE 0 END) AS [water_6m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 11) THEN TOT_BOE ELSE 0 END) AS [boe_12m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 11) THEN TOT_GAS ELSE 0 END) AS [gas_12m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 11) THEN TOT_LIQUID ELSE 0 END) AS [liq_12m],
	SUM(CASE WHEN (Months_Since_PeakProd >= 0 AND Months_Since_PeakProd <= 11) THEN TOT_WATER ELSE 0 END) AS [water_12m]
FROM [Upstream].[UV_AC_PRODUCT_AT]
GROUP BY 
	API,
	PeakProdDate,
	FirstProdDate;

END