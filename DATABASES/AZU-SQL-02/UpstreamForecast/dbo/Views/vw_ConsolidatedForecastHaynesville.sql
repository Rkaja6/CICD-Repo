
CREATE VIEW [dbo].[vw_ConsolidatedForecastHaynesville] AS
SELECT
NULL AS [RigID],
NULL AS [API],
'2013 and Prior Vintage' AS [ForecastSegmentName],
NULL AS [SpudYear],
[IntervalNumber],
DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 308)) AS [ProductionMonth],
DailyRate * datediff(day, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 308))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 308))),
              dateadd(month, 1, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 308))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 308))))) AS [MonthlyProduction],
NULL AS [SpudDate],
'Haynesville' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 308
UNION ALL
SELECT
NULL AS [RigID],
NULL AS [API],
'2014 Vintage' AS [ForecastSegmentName],
NULL AS [SpudYear],
[IntervalNumber],
DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 309)) AS [ProductionMonth],
DailyRate * datediff(day, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 309))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 309))),
              dateadd(month, 1, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 309))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 309))))) AS [MonthlyProduction],
NULL AS [SpudDate],
'Haynesville' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 309
UNION ALL
SELECT
NULL AS [RigID],
NULL AS [API],
'2015 Vintage' AS [ForecastSegmentName],
NULL AS [SpudYear],
[IntervalNumber],
DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 310)) AS [ProductionMonth],
DailyRate * datediff(day, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 310))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 310))),
              dateadd(month, 1, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 310))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 310))))) AS [MonthlyProduction],
NULL AS [SpudDate],
'Haynesville' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 310
UNION ALL
SELECT
NULL AS [RigID],
NULL AS [API],
'2016 Vintage' AS [ForecastSegmentName],
NULL AS [SpudYear],
[IntervalNumber],
DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 311)) AS [ProductionMonth],
DailyRate * datediff(day, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 311))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 311))),
              dateadd(month, 1, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 311))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 311))))) AS [MonthlyProduction],
NULL AS [SpudDate],
'Haynesville' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 311
UNION ALL
SELECT
NULL AS [RigID],
NULL AS [API],
'2017 Vintage' AS [ForecastSegmentName],
NULL AS [SpudYear],
[IntervalNumber],
DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 312)) AS [ProductionMonth],
DailyRate * datediff(day, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 312))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 312))),
              dateadd(month, 1, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 312))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 312))))) AS [MonthlyProduction],
NULL AS [SpudDate],
'Haynesville' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 312
UNION ALL
SELECT
NULL AS [RigID],
NULL AS [API],
'2018 Vintage' AS [ForecastSegmentName],
NULL AS [SpudYear],
[IntervalNumber],
DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 313)) AS [ProductionMonth],
DailyRate * datediff(day, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 313))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 313))),
              dateadd(month, 1, dateadd(day, 1-day(DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 313))), DATEADD(MONTH, IntervalNumber, (SELECT BaseProductionDate FROM TypeCurveHeader WHERE TypeCurveID = 313))))) AS [MonthlyProduction],
NULL AS [SpudDate],
'Haynesville' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 313
UNION ALL
SELECT
[RigID],
[API],
'2019 Actual Production' AS [ForecastSegmentName],
[SpudYear],
CONVERT(INT, DATEDIFF(MONTH, '01/01/2019', [ProductionMonth])) AS [IntervalNumber],
[ProductionMonth],
[MonthlyProductionGas],
[SpudDate],
'Haynesville' AS [TPCPlayName]
FROM
[dbo].Forecast_2019
WHERE TPCPlayName = 'Haynesville'
UNION ALL
SELECT
[RigID],
[API],
'2020+ Projected Well Activity' AS [ForecastSegmentName],
[SpudYear],
CONVERT(INT, DATEDIFF(MONTH, '01/01/2020', [ProductionMonth])) AS [IntervalNumber],
[ProductionMonth],
[MonthlyProduction],
[SpudDate],
'Haynesville' AS [TPCPlayName]
FROM
[dbo].[ProductionScenarioTransaction]