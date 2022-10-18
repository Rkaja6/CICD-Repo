
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [RPT].[Proc_DailyHrAdj] AS 
BEGIN

	-- Apply Multiplicative daily hour adjustment rules
	UPDATE WH
	SET WH.[WorkedHours] = WH.[WorkedHours] * Rules.[Adjustment Amount]
	FROM [RPT].[Worked_Hours_Detail] WH
	INNER JOIN [RPT].[DailyHrAdjRules] Rules
		ON WH.EmployeeID = Rules.[Employee ID]
		AND WH.Date >= Rules.[Start Date]
		AND WH.Date <= Rules.[End Date]
	WHERE Rules.[Adjustment Type] = 'Multiply'

END