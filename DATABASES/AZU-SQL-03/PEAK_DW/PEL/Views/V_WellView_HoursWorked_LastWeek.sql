























create view [PEL].[V_WellView_HoursWorked_LastWeek]
as
SELECT
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
	where [date] < '10-14-2019'
	and [date] >= '10-7-2019'
	GROUP BY [Date]
	) AS A
GROUP BY
	YEAR([Date]),
	MONTH([Date])