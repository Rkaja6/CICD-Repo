


CREATE VIEW [dbo].[vw_ConsolidatedForecast_prelim]
AS
SELECT
	C.ScenarioID,
	C.SegmentID,
	C.RigID,
	P.ScenarioName,
	P.SegmentName,
	C.TPCPlayName,
	C.Basin,
	C.Operator,
	C.Area,
	C.API,
	C.SpudYear,
	C.SpudDate,
	C.ProductionMonth,
	C.MonthlyProductionGas,
	C.MonthlyProductionOil,
	C.DailyRateGas,
	C.DailyRateOil,
	P.LastRunDate
FROM 
	ConsolidatedForecast C
INNER JOIN
	ProductionScenarioConfig P
ON 
	C.SegmentID = P.SegmentID AND
	C.ScenarioID = P.ScenarioID