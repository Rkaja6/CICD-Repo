


/******************************
** Name:  sp_RunRigForecast
** Desc:  Called from running sp_GenerateConsolidatedForecast.
		  Creates the future Production Forecast by running the rig forecast
		  and applying the type curves to each rig.
** Auth:  Dee Glazebrook
** Date:  02/8/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    02/8/2020    Dee       Object creation
** 2    02/9/2020    Dee       Added 50 year model limit for performance reasons
*******************************/

CREATE PROCEDURE [dbo].[sp_RunRigForecast]
	 @RigForecastID int,
	 @RigFcstMultiple decimal(38,16)
AS
BEGIN
	-- Recreate the temp table
	IF OBJECT_ID('dbo.TEMP_RigForecast', 'U') IS NOT NULL 
	DROP TABLE dbo.TEMP_RigForecast; 

	CREATE TABLE dbo.TEMP_RigForecast
		(
		RigID int,
		API varchar(20),
		SpudDate date,
		SpudYear int,
		ProductionMonth date,
		MonthlyProductionGas decimal(38,16),
		MonthlyProductionOil decimal(38,16),
		DailyRateGas decimal(38,16),
		DailyRateOil decimal(38,16)
		);

	-- Find the rigs to run in the RigForecast table
	DECLARE @RunRigs TABLE
		(
		RigID int,
		RuntimeMonths int,
		RigCount int, 
		TypeCurveID int,
		SpudIntervalDays int,
		SpudLimit int,
		APIPrefix int, 
		UnitForecastFlag varchar(1),
		StartDate date
		);

	INSERT INTO 
		@RunRigs
	SELECT
		RigID,
		RunTimeMonths,
		RigCount,
		TypeCurveID,
		SpudIntervalDays,
		SpudLimit,
		APIPrefix,
		UnitForecastFlag,
		StartDate
	FROM
		RigForecast
	WHERE
		RigForecastID = @RigForecastID;

	-- Declare variables
	DECLARE
		@RigID int,
		@RuntimeMonths int,
		@RigCount int, 
		@TypeCurveID int,
		@SpudIntervalDays int,
		@SpudLimit int,
		@APIPrefix bigint, 
		@UnitForecastFlag varchar(1),
		@StartDate date,
		@LastSpudDate date,
		@LastProjectionDate date,
		@ProjectionMonths int;

	-- Iterate through the @RunRigs table
	WHILE ( (SELECT COUNT(*) FROM @RunRigs) > 0 )

	BEGIN

		-- Set variables
		SELECT TOP 1
			@RigID = Rigid,
			@RuntimeMonths = RuntimeMonths,
			@RigCount = RigCount,
			@TypeCurveID = TypeCurveID,
			@SpudIntervalDays = SpudIntervalDays,
			@SpudLimit = SpudLimit,
			@APIPrefix = APIPrefix,
			@UnitForecastFlag = UnitForecastFlag,
			@StartDate = StartDate,
			@LastSpudDate = DATEADD(MONTH, RuntimeMonths, StartDate)
		FROM 
			@RunRigs
		ORDER BY
			RigID ASC;

		SELECT
			@ProjectionMonths = (MAX(IntervalNumber) - MIN(IntervalNumber)),
			--@LastProjectionDate = DATEADD(MONTH, MAX(IntervalNumber), @LastSpudDate) 
			@LastProjectionDate =  @LastSpudDate
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
				@StartDate AS ProjectionDay
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

		-- Generate all of the spud dates for the rig
		IF OBJECT_ID('tempdb..#assumed_spud_dates') IS NOT NULL 
		DROP TABLE #assumed_spud_dates;
		
		WITH
		AssumedSpudDates AS
		(
		SELECT
			@APIPrefix * 10000 AS API10,
			1 AS SpudID,
			@StartDate AS SpudDate
		UNION ALL
		SELECT
			(@APIPrefix * 10000) + SpudID  AS API10,
			SpudID + 1 AS SpudID,
			DATEADD(DAY, @SpudIntervalDays, SpudDate) AS SpudDate
		FROM
			AssumedSpudDates
		WHERE
			SpudDate <= @LastSpudDate AND
				(
				SpudID <= @SpudLimit OR
				@SpudLimit IS NULL
				)
		)
		SELECT
			API10,
			SpudID,
			SpudDate
		INTO
			#assumed_spud_dates
		FROM
			AssumedSpudDates
		OPTION (MAXRECURSION 32767);
		
		-- Populate temp table
		INSERT INTO dbo.TEMP_RigForecast
		(
			RigID,
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
			@RigID AS RigID,
			CAST(sd.API10 AS varchar(10)) + '0000' AS API,
			sd.SpudDate as SpudDate,
			YEAR(sd.SpudDate) as SpudYear,
			DATEFROMPARTS(YEAR(pj.ProjectionDay), MONTH(pj.ProjectionDay), 1) AS ProductionMonth,
			SUM(CASE h.Commodity
				WHEN 'Gas' THEN
					tc.DailyRate * @RigCount
				WHEN 'Oil' THEN
					0 
			END) AS MonthlyProductionGas,
			SUM(CASE h.Commodity
				WHEN 'Gas' THEN
					0
				WHEN 'Oil' THEN
					tc.DailyRate * @RigCount 
			END) AS MonthlyProductionOil,
			CASE h.Commodity
				WHEN 'Gas' THEN
					tc.DailyRate * @RigCount
				WHEN 'Oil' THEN
					0 
			END AS DailyRateGas,
			CASE h.Commodity
				WHEN 'Gas' THEN
					0
				WHEN 'Oil' THEN
					tc.DailyRate * @RigCount
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
			sd.API10,
			sd.SpudDate,
			YEAR(pj.ProjectionDay),
			MONTH(pj.ProjectionDay),
			tc.DailyRate,
			h.Commodity;
		
		-- If there is a RigFcstMultiple and the rig is a unit forecast rig, apply the multiple
		IF @UnitForecastFlag = 'Y' AND @RigFcstMultiple IS NOT NULL
		BEGIN
			
			UPDATE dbo.TEMP_RigForecast
			SET 
				MonthlyProductionGas = MonthlyProductionGas * @RigFcstMultiple,
				MonthlyProductionOil = MonthlyProductionOil * @RigFcstMultiple,
				DailyRateGas = DailyRateGas * @RigFcstMultiple,
				DailyRateOil = DailyRateOil * @RigFcstMultiple

		END;

		-- Advance to next segment
		DELETE FROM @RunRigs WHERE RigID = @RigID;

	END

	-- Clean up
	IF OBJECT_ID('tempdb..#projection_dates') IS NOT NULL 
	DROP TABLE #projection_dates;

	IF OBJECT_ID('tempdb..#assumed_spud_dates') IS NOT NULL 
	DROP TABLE #assumed_spud_dates;

END