
CREATE VIEW [dbo].[vw_ConsolidatedForecast]
AS

SELECT
	ScenarioName,
	SegmentName,
	TPCPlayName,
	SpudYear,
	ProductionMonth,
	SUM(MonthlyProductionGas) as MonthlyProductionGas,
	SUM(MonthlyProductionOil) as MonthlyProductionOil,
	SUM(DailyRateGas) as DailyRateGas,
	SUM(DailyRateOil) as DailyRateOil,
	SUM(MonthlyProdGas_PriorYear) AS MonthlyProdGas_PriorYear,
	SUM(MonthlyProdOil_PriorYear) AS MonthlyProdOil_PriorYear,
	SUM(MonthlyProdGas_CurrentYear) AS MonthlyProdGas_CurrentYear,
	SUM(MonthlyProdOil_CurrentYear) AS MonthlyProdOil_CurrentYear,
	SUM(MonthlyProdGas_Future) AS MonthlyProdGas_Future,
	SUM(MonthlyProdOil_Future) AS MonthlyProdOil_Future
FROM
	(
	SELECT
		ScenarioID,
		SegmentID,
		RigID,
		ScenarioName,
		SegmentName,
		TPCPlayName,
		Basin,
		Operator,
		Area,
		API,
		SpudYear,
		SpudDate,
		ProductionMonth,
		MonthlyProductionGas,
		MonthlyProductionOil,
		DailyRateGas,
		DailyRateOil,
		MonthlyProductionGas AS MonthlyProdGas_PriorYear,
		MonthlyProductionOil AS MonthlyProdOil_PriorYear,
		0 AS MonthlyProdGas_CurrentYear,
		0 AS MonthlyProdOil_CurrentYear,
		0 AS MonthlyProdGas_Future,
		0 AS MonthlyProdOil_Future,
		LastRunDate
	FROM 
		Forecast_Base_Prod A
	WHERE 
		YEAR(ProductionMonth) < 2070
	UNION ALL
	SELECT
		ScenarioID,
		SegmentID,
		RigID,
		ScenarioName,
		SegmentName,
		TPCPlayName,
		Basin,
		Operator,
		Area,
		API,
		SpudYear,
		SpudDate,
		ProductionMonth,
		MonthlyProductionGas,
		MonthlyProductionOil,
		DailyRateGas,
		DailyRateOil,
		0 AS MonthlyProdGas_PriorYear,
		0 AS MonthlyProdOil_PriorYear,
		MonthlyProductionGas AS MonthlyProdGas_CurrentYear,
		MonthlyProductionOil AS MonthlyProdOil_CurrentYear,
		0 AS MonthlyProdGas_Future,
		0 AS MonthlyProdOil_Future,
		LastRunDate
	FROM 
		Forecast_2019 A
	WHERE 
		YEAR(ProductionMonth) < 2070
	UNION ALL
	SELECT
		ScenarioID,
		SegmentID,
		RigID,
		ScenarioName,
		SegmentName,
		TPCPlayName,
		Basin,
		Operator,
		Area,
		API,
		SpudYear,
		SpudDate,
		ProductionMonth,
		MonthlyProductionGas,
		MonthlyProductionOil,
		DailyRateGas,
		DailyRateOil,
		0 AS MonthlyProdGas_PriorYear,
		0 AS MonthlyProdOil_PriorYear,
		0 AS MonthlyProdGas_CurrentYear,
		0 AS MonthlyProdOil_CurrentYear,
		MonthlyProductionGas AS MonthlyProdGas_Future,
		MonthlyProductionOil AS MonthlyProdOil_Future,
		LastRunDate
	FROM 
		Forecast_2020_Plus A
	WHERE 
		YEAR(ProductionMonth) < 2070
	) AA
GROUP BY 
	ScenarioName,
	SegmentName,
	TPCPlayName,
	SpudYear,
	ProductionMonth