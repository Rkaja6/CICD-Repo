


/******************************
** Name:  sp_RunBaseProdForecast
** Desc:  Called from running sp_GenerateConsolidatedForecast.
		  Creates the BaseProd Forecast by pulling the specified type curve from the TypeCurve table
** Auth:  Dee Glazebrook
** Date:  02/7/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    02/7/2020    Dee       Object creation
** 2    02/10/2020   Dee       Added SpudYear column
*******************************/
CREATE PROCEDURE [dbo].[sp_RunBaseProdForecast]
	 @TypeCurveID int
AS
BEGIN
	-- Recreate the temp table
	IF OBJECT_ID('dbo.TEMP_BaseProd', 'U') IS NOT NULL 
	DROP TABLE dbo.TEMP_BaseProd; 

	CREATE TABLE dbo.TEMP_BaseProd
		(
		SpudYear int,
		IntervalNumber int,
		ProductionMonth date,
		MonthlyProductionGas decimal(38,16),
		MonthlyProductionOil decimal(38,16),
		DailyRateGas decimal(38,16),
		DailyRateOil decimal(38,16)
		)

	-- Populate temp table
	INSERT INTO dbo.TEMP_BaseProd
	SELECT
		H.SpudYear,
		T.IntervalNumber,
		DATEADD(MONTH, T.IntervalNumber, H.BaseProductionDate) AS [ProductionMonth],
		CASE H.Commodity 
			WHEN 'Gas' THEN
				T.DailyRate * DAY(EOMONTH(H.BaseProductionDate, T.IntervalNumber))
			WHEN 'Oil' THEN
				0
		END [MonthlyProductionGas],
		CASE H.Commodity 
			WHEN 'Gas' THEN
				0
			WHEN 'Oil' THEN
				T.DailyRate * DAY(EOMONTH(H.BaseProductionDate, T.IntervalNumber))
		END [MonthlyProductionOil],
		CASE H.Commodity 
			WHEN 'Gas' THEN
				T.DailyRate
			WHEN 'Oil' THEN
				0
		END DailyRateGas,
		CASE H.Commodity 
			WHEN 'Gas' THEN
				0
			WHEN 'Oil' THEN
				T.DailyRate
		END DailyRateOil
	FROM 
		TypeCurveHeader H
	INNER JOIN
		TypeCurve T
	ON
		H.TypeCurveID = T.TypeCurveID
	WHERE
		H.TypeCurveID = @TypeCurveID 

END