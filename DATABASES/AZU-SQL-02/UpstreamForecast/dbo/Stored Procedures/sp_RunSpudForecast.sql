





/******************************
** Name:  sp_RunSpudForecast
** Desc:  Called from running sp_GenerateConsolidatedForecast.
		  Creates the Spud Forecast by getting Spud Dates from the TEMP_SpudCounts table
		  and applying Type Curves as of this date.
** Auth:  Dee Glazebrook
** Date:  02/7/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    02/7/2020    Dee       Object creation
** 2    02/8/2020    Dee       Add Oil and Gas monthly prod and daily rate columns
** 3    02/9/2020    Dee       Added 50 year limit for performance reasons
*******************************/
CREATE PROCEDURE [dbo].[sp_RunSpudForecast]
	 @TypeCurveID int,
	 @ActualSpudStartDate date,
	 @ActualSpudEndDate date,
	 @TPCPlayName varchar(500)
AS
BEGIN
	-- Recreate the temp table
	IF OBJECT_ID('dbo.TEMP_SpudForecast', 'U') IS NOT NULL 
	DROP TABLE dbo.TEMP_SpudForecast; 

	CREATE TABLE dbo.TEMP_SpudForecast
		(
		API varchar(20),
		SpudDate date,
		SpudYear int,
		ProductionMonth date,
		MonthlyProductionGas decimal(38,16),
		MonthlyProductionOil decimal(38,16),
		DailyRateGas decimal(38,16),
		DailyRateOil decimal(38,16)
		);

	-- Declare and set variables
	DECLARE
		@ProjectionMonths int,
		@FirstProjectionDate date,
		@LastProjectionDate date;
	SELECT 
		@ProjectionMonths = (MAX(IntervalNumber) - MIN(IntervalNumber)),
		@FirstProjectionDate = DATEADD(MONTH, MIN(IntervalNumber), @ActualSpudStartDate),
		--@LastProjectionDate = DATEADD(MONTH, MAX(IntervalNumber), @ActualSpudEndDate) 
		@LastProjectionDate = DATEADD(YEAR, 50, @ActualSpudEndDate)
	FROM 
		TypeCurve
	WHERE 
		TypeCurveID = @TypeCurveID;

	-- Generate all of the dates into a calendar table
	IF OBJECT_ID('tempdb..#projection_dates') IS NOT NULL 
	DROP TABLE #projection_dates;

	WITH
	ProjectionDates AS
	(
		SELECT
			@FirstProjectionDate AS ProjectionDay
		UNION ALL
		SELECT
			DATEADD(DAY, 1, ProjectionDay) AS ProjectionDay
		FROM
			ProjectionDates
		WHERE
			ProjectionDay <= @LastProjectionDate 
	)
	SELECT
		*
	INTO
		#projection_dates
	FROM
		ProjectionDates
	OPTION (MAXRECURSION 32767);

	-- Get the population of APIs and Spud Dates from TEMP_SpudCounts
	IF OBJECT_ID('tempdb..#assumed_spud_dates') IS NOT NULL 
	DROP TABLE #assumed_spud_dates;

	SELECT
		API14 AS API,
		MAX(SpudDate) AS SpudDate,
		YEAR(MAX(SpudDate)) AS SpudYear
	INTO 
		#assumed_spud_dates
	FROM
		TEMP_SpudCounts
	WHERE
		New_Play = @TPCPlayName AND
		SpudDate >= @ActualSpudStartDate AND
		SpudDate <= @ActualSpudEndDate
	GROUP BY API14; 

	-- Populate temp table
	INSERT INTO dbo.TEMP_SpudForecast
	(
		API,
		SpudDate,
		SpudYear,
		ProductionMonth,
		MonthlyProductionGas,
		MonthlyProductionOil,
		DailyRateGas,
		DailyRateOil
	)
	SELECT
		sd.API,
		sd.SpudDate,
		sd.SpudYear,
		DATEFROMPARTS(YEAR(pj.ProjectionDay), MONTH(pj.ProjectionDay), 1) AS ProductionMonth,
		SUM(CASE h.Commodity
			WHEN 'Gas' THEN
				tc.DailyRate
			WHEN 'Oil' THEN
				0 
		END) AS MonthlyProductionGas,
		SUM(CASE h.Commodity
			WHEN 'Gas' THEN
				0
			WHEN 'Oil' THEN
				tc.DailyRate
		END) AS MonthlyProductionOil,
		CASE h.Commodity
			WHEN 'Gas' THEN
				tc.DailyRate
			WHEN 'Oil' THEN
				0
		END AS DailyRateGas,
		CASE h.Commodity
			WHEN 'Gas' THEN
				0
			WHEN 'Oil' THEN
				tc.DailyRate
		END AS DailyRateOil
	FROM
		#assumed_spud_dates sd
	INNER JOIN
		#projection_dates pj
	ON
		pj.ProjectionDay >= sd.SpudDate AND 
		pj.ProjectionDay <= DATEADD(MONTH, @ProjectionMonths, sd.SpudDate)
	INNER JOIN
		TypeCurve tc
	ON
		tc.IntervalNumber = CONVERT(INT, DATEDIFF(MONTH, sd.SpudDate, pj.ProjectionDay)) AND
		tc.TypeCurveID = @TypeCurveID
	INNER JOIN
		TypeCurveHeader h
	ON
		tc.TypeCurveID = h.TypeCurveID
	GROUP BY
		sd.API,
		sd.SpudDate,
		sd.SpudYear,
		YEAR(pj.ProjectionDay),
		MONTH(pj.ProjectionDay),
		tc.DailyRate,
		h.Commodity

	-- Clean up
	IF OBJECT_ID('tempdb..#projection_dates') IS NOT NULL 
	DROP TABLE #projection_dates;

	IF OBJECT_ID('tempdb..#assumed_spud_dates') IS NOT NULL 
	DROP TABLE #assumed_spud_dates;


END