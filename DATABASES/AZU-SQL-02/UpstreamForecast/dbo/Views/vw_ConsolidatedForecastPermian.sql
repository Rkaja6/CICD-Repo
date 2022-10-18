CREATE VIEW [dbo].[vw_ConsolidatedForecastPermian] AS
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
'Permian' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 316
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
'Permian' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 317
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
'Permian' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 318
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
'Permian' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 319
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
'Permian' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 320
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
'Permian' AS [TPCPlayName]
FROM
TypeCurve
WHERE
TypeCurveID = 321
UNION ALL
SELECT
[RigID],
[API],
'2019 Producing Wells' AS [ForecastSegmentName],
[SpudYear],
CONVERT(INT, DATEDIFF(MONTH, '01/01/2019', [ProductionMonth])) AS [IntervalNumber],
[ProductionMonth],
[MonthlyProduction],
[SpudDate],
'Permian' AS [TPCPlayName]
FROM
(
(SELECT scenario.[RigID]
      ,scenario.[RunDateTime]
      ,scenario.[DefaultProjectionYears]
      ,scenario.[TPCPlayName]
      ,scenario.[API]
      ,scenario.[SpudYear]
      ,scenario.[ProductionMonth]
      ,scenario.[MonthlyProduction]
      ,scenario.[SpudDate]
  FROM [UpstreamForecast].[dbo].[ProductionScenarioTransaction] scenario
INNER JOIN
(SELECT
	TPCPlayName, RigID, MAX(RunDateTime) AS MaxRunDateTime
FROM [UpstreamForecast].[dbo].[ProductionScenarioTransaction]
WHERE
	RigID = 4 AND TPCPlayName = 'Permian'
GROUP BY
TPCPlayName, RigID) instance
ON
	scenario.RigID = instance.RigID AND
	ISNULL(scenario.TPCPlayName, '') = ISNULL(instance.TPCPlayName, '') AND
	scenario.RunDateTime = instance.MaxRunDateTime)) forecast19
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
'Permian' AS [TPCPlayName]
FROM
(
(SELECT scenario.[RigID]
      ,scenario.[RunDateTime]
      ,scenario.[DefaultProjectionYears]
      ,scenario.[TPCPlayName]
      ,scenario.[API]
      ,scenario.[SpudYear]
      ,scenario.[ProductionMonth]
      ,scenario.[MonthlyProduction]
      ,scenario.[SpudDate]
  FROM [UpstreamForecast].[dbo].[ProductionScenarioTransaction] scenario
INNER JOIN
(SELECT
	TPCPlayName, RigID, MAX(RunDateTime) AS MaxRunDateTime
FROM [UpstreamForecast].[dbo].[ProductionScenarioTransaction]
WHERE
	RigID = 4 AND TPCPlayName IS NULL
GROUP BY
TPCPlayName, RigID) instance
ON
	scenario.RigID = instance.RigID AND
	ISNULL(scenario.TPCPlayName, '') = ISNULL(instance.TPCPlayName, '') AND
	scenario.RunDateTime = instance.MaxRunDateTime)) forecast20andon