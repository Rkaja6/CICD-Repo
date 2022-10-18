





/******************************
** Name:  sp_GenerateProductionScenario
** Desc:
** Auth:  Aaron Vogt
** Date:  01/13/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    01/13/2020   Aaron     Object creation
** 2    01/17/2020   Aaron     Modified SP to calculate monthly production rates based on aggregated daily rates
** 3    01/21/2020   Dee       Added SpudDate/SpudYear columns. Changed to API
** 4    01/27/2020   Aaron     Modified to also project a collection of production assets that were SPUDed in a particular year (2019)
*******************************/
CREATE PROCEDURE [dbo].[sp_GenerateProductionScenario]
	@currentRigId AS INT = 1,
	@defaultProjectionYears AS INT = 50,
	@APISuffix AS BIGINT = 999999,
	@TPCPlayName AS VARCHAR(200) = NULL,
	@FirstProjectionDate AS DATE = NULL
AS
BEGIN
/*	DECLARE @currentRigId AS INT
	DECLARE @defaultProjectionYears AS INT
	DECLARE @APISuffix AS BIGINT
	DECLARE @TPCPlayName AS VARCHAR(200)
	DECLARE @FirstProjectionDate AS DATE
	SET @currentRigId  = 4
	SET @defaultProjectionYears  = 50
	SET @APISuffix = 999999
	SET @TPCPlayName = 'Permian'
	SET @FirstProjectionDate = '01/01/2019'*/

	SET @FirstProjectionDate = ISNULL(@FirstProjectionDate, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))

	--IF OBJECT_ID('UpstreamForecast.dbo.ProductionScenarioTransaction') IS NOT NULL DROP TABLE dbo.ProductionScenarioTransaction
	DECLARE @spudIntervalDays INT
	DECLARE @typeCurveID INT
	DECLARE @firstSpudDate DATETIME
	DECLARE @lastSpudDate DATETIME
	DECLARE @runDateTime DATETIME
	SET @runDateTime = GETDATE()
	SELECT
		@spudIntervalDays = SpudInterval,
		@firstSpudDate = FirstSpudDate,
		@typeCurveID = TypeCurveID,
		@lastSpudDate = 
			CASE
				WHEN SpudLimit IS NULL THEN DATEADD(YEAR, @defaultProjectionYears, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))
			ELSE 
				DATEADD(DAY, SpudInterval * SpudLimit, FirstSpudDate)
			END
	FROM
		RigConfig
	WHERE
		RigID = @currentRigId
	
	SELECT @typeCurveID AS typeCurveID, 
		@currentRigId AS currentRigId, 
		@spudIntervalDays AS spudIntervalDays, 
		@firstSpudDate AS firstSpudDate, 
		@lastSpudDate AS lastSpudDate, 
		@FirstProjectionDate AS FirstProjectionDate
	
	IF OBJECT_ID('tempdb..#projection_dates') IS NOT NULL DROP TABLE #projection_dates
	;WITH
	ProjectionDates AS
	(
		SELECT
			@FirstProjectionDate AS ProjectionDay
		FROM
			RigConfig
		WHERE
			RigID = @currentRigId
		UNION ALL
		SELECT
			DATEADD(DAY, 1, ProjectionDay) AS ProjectionDay
		FROM
			ProjectionDates
		WHERE
			ProjectionDay <= @lastSpudDate 
	)
	SELECT
		*
	INTO
		#projection_dates
	FROM
		ProjectionDates
	OPTION (MAXRECURSION 32767)

	SELECT * FROM #projection_dates

IF OBJECT_ID('tempdb..#assumed_spud_dates') IS NOT NULL DROP TABLE #assumed_spud_dates
CREATE TABLE #assumed_spud_dates
(
	API10 VARCHAR(50) NULL,
	SpudID INT NULL,
	SpudIntervalDays INT NULL,
	SpudDate DATE NULL
)
IF @TPCPlayName IS NULL 
BEGIN
	;WITH
	AssumedSpudDates AS
	(
		SELECT
			@APISuffix * 1000 AS API10,
			1 AS SpudID,
			@spudIntervalDays AS SpudIntervalDays,
			FirstSpudDate AS SpudDate
		FROM
			RigConfig
		WHERE
			RigID = @currentRigId
		UNION ALL
		SELECT
			(@APISuffix * 1000) + SpudID AS API10,
			SpudID + 1 AS SpudID,
			@spudIntervalDays AS SpudIntervalDays,
			DATEADD(DAY, @spudIntervalDays, SpudDate) AS SpudDate
		FROM
			AssumedSpudDates
		WHERE
			SpudDate < @lastSpudDate
	)
	INSERT INTO
		#assumed_spud_dates
	(
		API10,
		SpudID,
		SpudIntervalDays,
		SpudDate
	)
	SELECT
		API10,
		SpudID,
		SpudIntervalDays,
		SpudDate
	FROM
		AssumedSpudDates
	OPTION (MAXRECURSION 32767)

		SELECT * FROM #assumed_spud_dates
	
	INSERT INTO
		dbo.ProductionScenarioTransaction
	(
		RigID,
		RunDateTime,
		DefaultProjectionYears,
		TPCPlayName,
		API,
		SpudYear,
		ProductionMonth,
		MonthlyProduction,
		SpudDate
	)
	SELECT
		@currentRigId AS RigID,
		@runDateTime AS RunDateTime,
		@defaultProjectionYears AS DefaultProjectionYears,
		@TPCPlayName AS TPCPlayName,
		CONVERT(VARCHAR(50), CONVERT(BIGINT, sd.API10) * 10000) AS API,
		YEAR(sd.SpudDate) AS SpudYear,
		DATEFROMPARTS(YEAR(pj.ProjectionDay), MONTH(pj.ProjectionDay), 1) AS ProductionMonth,
		SUM(tc.DailyRate) MonthlyProduction,
		sd.SpudDate
	FROM
		#assumed_spud_dates sd
	INNER JOIN
		#projection_dates pj
	ON
		pj.ProjectionDay BETWEEN sd.SpudDate AND @lastSpudDate
	INNER JOIN
		TypeCurve tc
	ON
		tc.IntervalNumber = CONVERT(INT, DATEDIFF(MONTH, SpudDate, ProjectionDay)) AND
		tc.TypeCurveID = @typeCurveID
	GROUP BY
		sd.API10,
		sd.SpudDate,
		YEAR(pj.ProjectionDay),
		MONTH(pj.ProjectionDay)

END
ELSE
BEGIN
	INSERT INTO
		#assumed_spud_dates
	(
		API10,
		SpudID,
		SpudIntervalDays,
		SpudDate
	)
	SELECT
		wh.API14 AS API10,
		ROW_NUMBER() OVER (ORDER BY MAX(wh.Date_Spud) DESC) AS SpudID,
		NULL AS SpudIntervalDays,
		MAX(wh.Date_Spud) AS SpudDate
	FROM
		TELL_DW2.Upstream.RefWell_PlayByStateCounty play
	INNER JOIN
		TELL_DW2.Upstream.WellHeader_AllSources wh
	ON
		play.County = wh.County AND
		play.State = wh.State
	WHERE
		play.New_Play = @TPCPlayName AND
		YEAR(DATE_SPUD) = 2019 AND
		(
		Status <> 'INACTIVE' OR
		Status IS NULL
		)
	GROUP BY wh.API14
	
	SELECT * FROM #assumed_spud_dates
	
	INSERT INTO
		dbo.ProductionScenarioTransaction
	(
		RigID,
		RunDateTime,
		DefaultProjectionYears,
		TPCPlayName,
		API,
		SpudYear,
		ProductionMonth,
		MonthlyProduction,
		SpudDate
	)
	SELECT
		@currentRigId AS RigID,
		@runDateTime AS RunDateTime,
		@defaultProjectionYears AS DefaultProjectionYears,
		@TPCPlayName AS TPCPlayName,
		sd.API10 AS API,
		YEAR(sd.SpudDate) AS SpudYear,
		DATEFROMPARTS(YEAR(pj.ProjectionDay), MONTH(pj.ProjectionDay), 1) AS ProductionMonth,
		SUM(tc.DailyRate) MonthlyProduction,
		sd.SpudDate
	FROM
		#assumed_spud_dates sd
	INNER JOIN
		#projection_dates pj
	ON
		pj.ProjectionDay BETWEEN sd.SpudDate AND @lastSpudDate
	INNER JOIN
		TypeCurve tc
	ON
		tc.IntervalNumber = CONVERT(INT, DATEDIFF(MONTH, SpudDate, ProjectionDay)) AND
		tc.TypeCurveID = @typeCurveID
	GROUP BY
		sd.API10,
		sd.SpudDate,
		YEAR(pj.ProjectionDay),
		MONTH(pj.ProjectionDay)

	END

END