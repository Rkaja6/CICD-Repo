



Create procedure [PEL].[SP_Peloton_HoursWorked_Rpt]
	@ReportDateMonday date
AS

SELECT
	'WellView' as [source],
	DATEADD(day,-7,@ReportDateMonday) as StartDate,
	@ReportDateMonday as EndDate,
	YEAR([Date]) as [Year],
	MONTH([Date]) as [Month],
	MAX(Daily_Headcount) as HeadCount,
	SUM(Daily_Worked_Hours) as WorkedHours
FROM
	(
	SELECT	
		   [Date]
		   ,SUM([total_headcount]) AS daily_headcount
		  ,SUM([worked_hours]) AS daily_worked_hours
	FROM PEL.V_WellView_HoursWorkedDetail
	where [date] < @ReportDateMonday
	and [date] >= DATEADD(day,-7,@ReportDateMonday)
	GROUP BY [Date]
	) AS A
GROUP BY
	YEAR([Date]),
	MONTH([Date])
ORDER BY YEAR([Date]) desc,
	MONTH([Date]) desc
;
SELECT
	'WellView' as [source],
	@ReportDateMonday as EndDate,
	YEAR([Date]) as [Year],
	MONTH([Date]) as [Month],
	MAX(Daily_Headcount) as HeadCount,
	SUM(Daily_Worked_Hours) as WorkedHours
FROM
	(
	SELECT	
		   [Date]
		   ,SUM([total_headcount]) AS daily_headcount
		  ,SUM([worked_hours]) AS daily_worked_hours
	FROM PEL.V_WellView_HoursWorkedDetail
	where [date] < @ReportDateMonday
	GROUP BY [Date]
	) AS A
GROUP BY
	YEAR([Date]),
	MONTH([Date])
ORDER BY YEAR([Date]) desc,
	MONTH([Date]) desc
;
SELECT
	'SiteView' as [source],
	DATEADD(day,-7,@ReportDateMonday) as StartDate,
	@ReportDateMonday as EndDate,
	YEAR([Date]) as [Year],
	MONTH([Date]) as [Month],
	MAX(Daily_Headcount) as HeadCount,
	SUM(Daily_Worked_Hours) as WorkedHours
FROM
	(
	SELECT	
		   [Date]
		   ,SUM([total_headcount]) AS daily_headcount
		  ,SUM([worked_hours]) AS daily_worked_hours
	FROM PEL.V_SiteView_HoursWorkedDetail
	where [date] < @ReportDateMonday
	and [date] >= DATEADD(day,-7,@ReportDateMonday)
	GROUP BY [Date]
	) AS A
GROUP BY
	YEAR([Date]),
	MONTH([Date])
ORDER BY YEAR([Date]) desc,
	MONTH([Date]) desc
;
SELECT
	'SiteView' as [source],
	@ReportDateMonday as EndDate,
	YEAR([Date]) as [Year],
	MONTH([Date]) as [Month],
	MAX(Daily_Headcount) as HeadCount,
	SUM(Daily_Worked_Hours) as WorkedHours
FROM
	(
	SELECT	
		   [Date]
		   ,SUM([total_headcount]) AS daily_headcount
		  ,SUM([worked_hours]) AS daily_worked_hours
	FROM PEL.V_SiteView_HoursWorkedDetail
	where [date] < @ReportDateMonday
	GROUP BY [Date]
	) AS A
GROUP BY
	YEAR([Date]),
	MONTH([Date])
ORDER BY YEAR([Date]) desc,
	MONTH([Date]) desc