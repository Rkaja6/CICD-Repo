IF OBJECT_ID('[dbo].[ufn_ConvertUTCToCT]') IS NOT NULL
	DROP FUNCTION [dbo].[ufn_ConvertUTCToCT];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Rudee Glazebrook
-- Create date: 1/10/2022
-- Description:	Converts UTC times to Central Time. All Zedi Dates are in UTC.
-- =============================================
CREATE FUNCTION [dbo].[ufn_ConvertUTCToCT]
(
	-- Add the parameters for the function here
	@DateTimeUTC datetime
)
RETURNS datetime
AS
BEGIN
	-- Declare the return variable here
	DECLARE @DateTimeCT datetime;

	-- Add the T-SQL statements to compute the return value here
	select @DateTimeCT = 
		CONVERT(datetime, 
			SWITCHOFFSET(@DateTimeUTC, 
				DATEPART(TZOFFSET, @DateTimeUTC AT TIME ZONE 'Central Standard Time')))

	-- Return the result of the function
	RETURN @DateTimeCT

END
GO
