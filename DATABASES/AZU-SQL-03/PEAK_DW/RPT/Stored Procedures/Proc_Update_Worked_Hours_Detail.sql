


CREATE PROCEDURE [RPT].[Proc_Update_Worked_Hours_Detail]
AS
BEGIN

TRUNCATE TABLE RPT.Worked_Hours_Detail;

-- Insert the US Employee's hours from Workday
INSERT INTO RPT.Worked_Hours_Detail

SELECT
	USEmp.[Employee ID] AS EmployeeID,
	D.Calendar_Date AS [Date],
	USEmp.[Legal Name] AS [Name],
	W.[Hire Date] AS HireDate,
	W.[Termination Date] AS TerminationDate,
	W.[Worker Status] AS WorkerStatus,
	W.Country,
	W.[Worker Type] AS WorkerType,
	W.[Location],
	W.Department,
	-- Need to divide worked hours for the period by the number of business days worked in the period (including effect of hire/term dates)
	USEmp.[Worked Hours in Period] / COUNT(D.Calendar_Date) OVER (PARTITION BY USEmp.[Employee ID], USEmp.[Period Start Date]) AS WorkedHours,
	USEmp.[Period Start Date] AS PeriodStartDate,
	USEmp.[Period End Date] AS PeriodEndDate,
	1 AS Headcount
FROM RPT.Employee_Hours USEmp
INNER JOIN RPT.All_Workers W
	ON USEmp.[Employee ID] = W.[Employee ID]
INNER JOIN 
	-- Only get Business Days from calendar
	(
	SELECT Calendar_Date
	FROM RPT.Dates 
	WHERE Is_Holiday = 0
	AND Is_Business_Day = 1
	) D
	ON IIF(W.[Hire Date] >= USEmp.[Period Start Date], W.[Hire Date], ISNULL(USEmp.[Period Start Date], W.[Hire Date])) <=  D.Calendar_Date
	AND IIF(W.[Termination Date] <= USEmp.[Period End Date], W.[Termination Date], ISNULL(USEmp.[Period End Date], W.[Termination Date])) >= D.Calendar_Date;

-- Insert Forecast of US Employee worked hours for current payroll period. Assume 8 hrs/day, business days only.
INSERT INTO RPT.Worked_Hours_Detail

SELECT
	USEmp.[Employee ID] AS EmployeeID,
	D.Calendar_Date AS [Date],
	USEmp.[Legal Name] AS [Name],
	W.[Hire Date] AS HireDate,
	W.[Termination Date] AS TerminationDate,
	W.[Worker Status] AS WorkerStatus,
	W.Country,
	W.[Worker Type] AS WorkerType,
	W.[Location],
	W.Department,
	8 AS WorkedHours,
	CurrentPayroll.PeriodStartDate,
	GETDATE() AS PeriodEndDate,
	1 AS Headcount
FROM 
-- Get the day after the max payroll end date as the current payroll period start date
	(
	SELECT
		MAX([Period End Date]) AS PreviousPeriodEndDate, 
		DATEADD(day,1,MAX([Period End Date])) AS PeriodStartDate 
	FROM RPT.Employee_Hours
	) CurrentPayroll
INNER JOIN 
-- Get the employee list from the last payroll period
	(
	SELECT 
		[Employee ID],
		[Legal Name],
		[Period End Date]
	FROM RPT.Employee_Hours
	) USEmp
	ON CurrentPayroll.PreviousPeriodEndDate = USEmp.[Period End Date]
INNER JOIN RPT.All_Workers W
	ON USEmp.[Employee ID] = W.[Employee ID]
INNER JOIN 
	-- Only get Business Days from calendar
	(
	SELECT Calendar_Date
	FROM RPT.Dates 
	WHERE Is_Holiday = 0
	AND Is_Business_Day = 1
	) D
	ON IIF(W.[Hire Date] >= CurrentPayroll.PeriodStartDate, W.[Hire Date], ISNULL(CurrentPayroll.PeriodStartDate, W.[Hire Date])) <=  D.Calendar_Date
	AND IIF(W.[Termination Date] <= GETDATE(), W.[Termination Date], ISNULL(GETDATE(), W.[Termination Date])) >= D.Calendar_Date

-- Insert non US-employee hours and contingent worker hours. Assume 8 hrs/day.
INSERT INTO RPT.Worked_Hours_Detail

SELECT
	W.[Employee ID] AS EmployeeID,
	D.Calendar_Date AS [Date],
	W.[Legal Name] AS [Name],
	W.[Hire Date] AS HireDate,
	W.[Termination Date] AS TerminationDate,
	W.[Worker Status] AS WorkerStatus,
	W.Country,
	W.[Worker Type] AS WorkerType,
	W.[Location],
	W.Department,
	8 AS WorkedHours,
	NULL AS PeriodStartDate,
	NULL AS PeriodEndDate,
	1 AS Headcount
FROM RPT.All_Workers W
INNER JOIN 
	-- Only get Business Days from calendar
	(
	SELECT Calendar_Date
	FROM RPT.Dates 
	WHERE Is_Holiday = 0
	AND Is_Business_Day = 1
	) D
	ON W.[Hire Date] <=  D.Calendar_Date
	AND IIF(W.[Termination Date] <= GETDATE(), W.[Termination Date], ISNULL(GETDATE(), W.[Termination Date])) >= D.Calendar_Date
WHERE 
	W.[Worker Type] = 'Contingent Worker'
	OR W.Country <> 'United States of America'

-- Insert field contractors worked hours from WellView
INSERT INTO RPT.Worked_Hours_Detail

SELECT
	'WV' AS EmployeeID,
	[Date],
	'WellView' AS [Name],
	NULL AS HireDate,
	NULL AS TerminationDate,
	NULL AS WorkerStatus,
	'United States of America' AS Country,
	'Contingent Worker' AS WorkerType,
	'Upstream Field' AS Location,
	'Upstream' AS Department,
	SUM(worked_hours) AS WorkedHours,
	NULL AS PeriodStartDate,
	NULL AS PeriodEndDate,
	SUM(total_headcount) AS Headcount
FROM [PEL].[V_WellView_HoursWorkedDetail]
GROUP BY [Date]

-- Insert field contractors worked hours from SiteView
--INSERT INTO RPT.Worked_Hours_Detail

--SELECT
--	'SV' AS EmployeeID,
--	[Date],
--	'SiteView' AS [Name],
--	NULL AS HireDate,
--	NULL AS TerminationDate,
--	NULL AS WorkerStatus,
--	'United States of America' AS Country,
--	'Contingent Worker' AS WorkerType,
--	'Upstream Field' AS Location,
--	'Upstream' AS Department,
--	SUM(worked_hours) AS WorkedHours,
--	NULL AS PeriodStartDate,
--	NULL AS PeriodEndDate,
--	SUM(total_headcount) AS Headcount
--FROM [PEL].[V_SiteView_HoursWorkedDetail]
--GROUP BY [Date]

END