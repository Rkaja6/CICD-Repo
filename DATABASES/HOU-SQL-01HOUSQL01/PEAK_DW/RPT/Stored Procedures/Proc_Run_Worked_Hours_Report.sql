


-- Last Updated 6/8/2022
-- Updated By Dee Glazebrook
-- Comment: Changed date to datetime field comparison to use 
-- Date >= '2014-02-07' and Date < dateadd(day,1,'2014-02-07') instead of
-- Date >= '2014-02-07' and Date =< dateadd(day,1,'2014-02-07')



CREATE PROCEDURE [RPT].[Proc_Run_Worked_Hours_Report]
(@StartDateMon date, @EndDateSun date)
AS
BEGIN

SELECT
	WorkerType,
	Department,
	ROUND(SUM(WorkedHours),0) AS LastWeekHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE >= @StartDateMon AND DATE < DATEADD(d,1,@EndDateSun)
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
	DATE >= @StartDateMon AND DATE < DATEADD(d,1,@EndDateSun)
GROUP BY 
	WorkerType
UNION ALL
SELECT
	'zTotal' AS WorkerType,
	'zTotal' AS Department,
	ROUND(SUM(WorkedHours),0) AS LastWeekHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE >= @StartDateMon AND DATE < DATEADD(d,1,@EndDateSun)
ORDER BY 
	WorkerType,
	Department;

SELECT
	WorkerType,
	Department,
	ROUND(SUM(WorkedHours),0) AS YTDHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE >= DATEFROMPARTS(YEAR(@EndDateSun),1,1) AND DATE < DATEADD(d,1,@EndDateSun)
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
	DATE >= DATEFROMPARTS(YEAR(@EndDateSun),1,1) AND DATE < DATEADD(d,1,@EndDateSun)
GROUP BY 
	WorkerType
UNION ALL
SELECT
	'zTotal' AS WorkerType,
	'zTotal' AS Department,
	ROUND(SUM(WorkedHours),0) AS YTDHours
FROM RPT.Worked_Hours_Detail
WHERE
	DATE >= DATEFROMPARTS(YEAR(@EndDateSun),1,1) AND DATE < DATEADD(d,1,@EndDateSun)
ORDER BY 
	WorkerType,
	Department;

END