
CREATE PROCEDURE RPT.Proc_Run_Worked_Hours_Report
(@StartDateMon date, @EndDateSun date)
AS
BEGIN

SELECT
	WorkerType,
	Department,
	ROUND(SUM(WorkedHours),0) AS LastWeekHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE BETWEEN @StartDateMon AND @EndDateSun
GROUP BY 
	WorkerType,
	Department
UNION ALL
SELECT
	WorkerType,
	'zTotal' AS Department,
	ROUND(SUM(WorkedHours),0) AS LastWeekHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE BETWEEN @StartDateMon AND @EndDateSun
GROUP BY 
	WorkerType
UNION ALL
SELECT
	'zTotal' AS WorkerType,
	'zTotal' AS Department,
	ROUND(SUM(WorkedHours),0) AS LastWeekHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE BETWEEN @StartDateMon AND @EndDateSun
ORDER BY 
	WorkerType,
	Department;

SELECT
	WorkerType,
	Department,
	ROUND(SUM(WorkedHours),0) AS YTDHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE BETWEEN DATEFROMPARTS(YEAR(@EndDateSun),1,1) AND @EndDateSun
GROUP BY 
	WorkerType,
	Department
UNION ALL
SELECT
	WorkerType,
	'zTotal' AS Department,
	ROUND(SUM(WorkedHours),0) AS YTDHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE BETWEEN DATEFROMPARTS(YEAR(@EndDateSun),1,1) AND @EndDateSun
GROUP BY 
	WorkerType
UNION ALL
SELECT
	'zTotal' AS WorkerType,
	'zTotal' AS Department,
	ROUND(SUM(WorkedHours),0) AS YTDHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE BETWEEN DATEFROMPARTS(YEAR(@EndDateSun),1,1) AND @EndDateSun
ORDER BY 
	WorkerType,
	Department;

SELECT
	WorkerType,
	Department,
	ROUND(SUM(WorkedHours),0) AS LastWeekHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE BETWEEN @StartDateMon AND @EndDateSun
	AND [EmployeeID] IN ('SV','WV')
GROUP BY 
	WorkerType,
	Department;

SELECT
	WorkerType,
	Department,
	ROUND(SUM(WorkedHours),0) AS YTDHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE BETWEEN DATEFROMPARTS(YEAR(@EndDateSun),1,1) AND @EndDateSun
	AND [EmployeeID] IN ('SV','WV')
GROUP BY 
	WorkerType,
	Department;

END