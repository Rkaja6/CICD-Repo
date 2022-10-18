
CREATE VIEW [RPT].[V_DailyHrAdjResults]
AS
select 
	wh.[EmployeeID]
      ,wh.[Date]
      ,wh.[Name]
      ,wh.[HireDate]
      ,wh.[TerminationDate]
      ,wh.[WorkerStatus]
      ,wh.[Country]
      ,wh.[WorkerType]
      ,wh.[Location]
      ,wh.[Department]
      ,wh.[WorkedHours]
      ,wh.[PeriodStartDate]
      ,wh.[PeriodEndDate]
      ,wh.[Headcount]
	  ,Rules.[Rule Description]
	  ,Rules.[Adjustment Type]
	  ,Rules.[Adjustment Amount]
FROM [RPT].[Worked_Hours_Detail] WH
INNER JOIN [RPT].[DailyHrAdjRules] Rules
	ON WH.EmployeeID = Rules.[Employee ID]
	AND WH.Date >= Rules.[Start Date]
	AND WH.Date <= Rules.[End Date]
WHERE Rules.[Adjustment Type] = 'Multiply'