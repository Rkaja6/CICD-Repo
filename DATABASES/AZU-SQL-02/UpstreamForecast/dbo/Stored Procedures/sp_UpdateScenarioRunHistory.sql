

/******************************
** Name:  sp_UpdateScenarioRunHistory
** Desc:  Called from running sp_GenerateConsolidatedForecast.
		  Sets FlagRunSegment to 'N' and logs the run history in the ScenarioRunHistory table.
** Auth:  Dee Glazebrook
** Date:  02/7/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    02/7/2020    Dee     Object creation
*******************************/
CREATE PROCEDURE sp_UpdateScenarioRunHistory 
	@ScenarioID int,
	@SegmentID int
AS 

BEGIN
	
	-- Log the run and run details
	INSERT INTO 
		[dbo].[ScenarioRunHistory]
	SELECT
		GETDATE() AS RunDate,
		ScenarioID,
		ScenarioName,
		SegmentID,
		SegmentName,
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
		ProductionScenarioConfig
	WHERE 
		ScenarioID = @ScenarioID AND
		SegmentID = @SegmentID 

	-- Update the ProductionScenarioConfig table
	UPDATE 
		ProductionScenarioConfig
	SET 
		FlagRunSegment = 'N',
		LastRunDate = GETDATE()
	WHERE 
		ScenarioID = @ScenarioID AND
		SegmentID = @SegmentID 

END