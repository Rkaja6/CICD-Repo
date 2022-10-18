

/******************************
** Name:  sp_GenerateConsolidatedForecast
** Desc:  Truncates and updates the ConsolidatedForecast table 
		  based on Scenarios/Segments in the ProductionScenarioConfig table
		  that are set to run (FlagRunSegment). Logs results to the
		  ScenarioRunHistory table.
** Auth:  Dee Glazebrook
** Date:  02/7/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    02/7/2020    Dee       Object creation
** 2    02/8/2020    Dee       Changed Consolidated Forecast table to include Gas/Oil in separate columns and daily rates.
** 3    02/10/2020   Dee       Added SpudYear column for BASEPROD forecasts
*******************************/

CREATE PROCEDURE [dbo].[sp_GenerateConsolidatedForecast]
AS
BEGIN
	
	TRUNCATE TABLE ConsolidatedForecast;

	-- Find segments that are flagged to run in the ProductionScenarioConfig table
	DECLARE @RunSeg TABLE
	(	
		[ScenarioID] [int],
		[SegmentID] [int],
		[SegmentType] [varchar](40),
		[TPCPlayName] [varchar](500),
		[Basin] [varchar](30),
		[Operator] [varchar](255),
		[Area] [varchar](255),
		[TypeCurveID] [int],
		[ActualSpudStartDate] [date],
		[ActualSpudEndDate] [date],
		[RigForecastID] [int],
		[RigFcstMultiple] [decimal] (38,16)
	);

	INSERT INTO 
		@RunSeg
	SELECT
		ScenarioID,
		SegmentID,
		SegmentType,
		TPCPlayName,
		Basin,
		Operator,
		Area,
		TypeCurveID,
		ActualSpudStartDate,
		ActualSpudEndDate,
		RigForecastID,
		RigFcstMultiple
	FROM 
		[ProductionScenarioConfig]
	WHERE 
		[FlagRunSegment] = 'Y';

	-- If we need to run any SPUDFCST segments, create the TEMP_SpudCounts table
	IF EXISTS (SELECT 1 FROM @RunSeg WHERE SegmentType = 'SPUDFCST')
	BEGIN
		EXEC sp_GenerateSpudCountsTbl
	END

	-- Declare variables
	DECLARE
		@ScenarioID int,
		@SegmentID int,
		@SegmentType varchar(40),
		@TypeCurveID int,
		@ActualSpudStartDate date,
		@ActualSpudEndDate date,
		@RigForecastID int,
		@RigFcstMultiple int,
		@TPCPlayName varchar(500),
		@Basin varchar(30),
		@Operator varchar(255),
		@Area varchar(255)

	-- Iterate through the @RunSeg table
	WHILE ( (SELECT COUNT(*) FROM @RunSeg) > 0 )
	BEGIN

		-- Set variables
		SELECT TOP 1
			@ScenarioID = ScenarioID,
			@SegmentID = SegmentID,
			@SegmentType = SegmentType,
			@TypeCurveID = TypeCurveID,
			@ActualSpudStartDate = ActualSpudStartDate,
			@ActualSpudEndDate = ActualSpudEndDate,
			@RigForecastID = RigForecastID,
			@TPCPlayName = TPCPlayName,
			@Basin = Basin,
			@Operator = Operator,
			@Area = Area
		FROM 
			@RunSeg
		ORDER BY 
			ScenarioID ASC,
			SegmentID ASC

		-- Based on the segment type, trigger other stored procedures
		IF (@SegmentType = 'BASEPROD')
		BEGIN
			EXEC sp_RunBaseProdForecast @TypeCurveID;
			
			INSERT INTO ConsolidatedForecast
			SELECT
				@ScenarioID AS ScenarioID,
				@SegmentID AS SegmentID,
				NULL AS RigID,
				NULL AS API,
				NULL AS SpudDate,
				SpudYear,
				IntervalNumber,
				ProductionMonth,
				MonthlyProductionGas,
				MonthlyProductionOil,
				DailyRateGas,
				DailyRateOil,
				@TPCPlayName AS TPCPlayName,
				@Basin AS Basin,
				@Operator AS Operator,
				@Area AS Area
			FROM TEMP_BaseProd
		END 

		ELSE IF (@SegmentType = 'SPUDFCST')
		BEGIN
			
			EXEC sp_RunSpudForecast @TypeCurveID, @ActualSpudStartDate, @ActualSpudEndDate, @TPCPlayName;
			
			INSERT INTO ConsolidatedForecast
			SELECT
				@ScenarioID AS ScenarioID,
				@SegmentID AS SegmentID,
				NULL AS RigID,
				API,
				SpudDate,
				SpudYear,
				NULL AS IntervalNumber,
				ProductionMonth,
				MonthlyProductionGas,
				MonthlyProductionOil,
				DailyRateGas,
				DailyRateOil,
				@TPCPlayName AS TPCPlayName,
				@Basin AS Basin,
				@Operator AS Operator,
				@Area AS Area
			FROM TEMP_SpudForecast
		END

		ELSE IF (@SegmentType = 'RIGFCST')
		BEGIN
			EXEC sp_RunRigForecast @RigForecastID, @RigFcstMultiple;
			
			INSERT INTO ConsolidatedForecast
			SELECT
				@ScenarioID AS ScenarioID,
				@SegmentID AS SegmentID,
				RigID,
				API,
				SpudDate,
				SpudYear,
				NULL AS IntervalNumber,
				ProductionMonth,
				MonthlyProductionGas,
				MonthlyProductionOil,
				DailyRateGas,
				DailyRateOil,
				@TPCPlayName AS TPCPlayName,
				@Basin AS Basin,
				@Operator AS Operator,
				@Area AS Area
			FROM TEMP_RigForecast

		END

		-- Run stored procedure to set FlagRunSegment to 'N' and log the run history in the ScenarioRunHistory table
		EXEC sp_UpdateScenarioRunHistory @ScenarioID, @SegmentID

		-- Advance to next segment
		DELETE FROM @RunSeg WHERE ScenarioID = @ScenarioID AND SegmentID = @SegmentID;

	END

	-- Cleanup
	EXEC  [sp_DropForecastTempTbls];

END