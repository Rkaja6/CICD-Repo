
-- =============================================
-- Author:		Vogt Aaron
-- Create date: 10/15/2019
-- Description:	Determines the distance between two points in meters
-- =============================================
CREATE FUNCTION [dbo].[fn_DistanceBetweenPoints]
(
	@Longitude1 NUMERIC(38,16),
	@Latitude1 NUMERIC(38, 16),
	@Longitude2 NUMERIC(38, 16),
	@Latitude2 NUMERIC(38, 16)	
)
RETURNS NUMERIC(38, 16)
AS
BEGIN
	
DECLARE @startPoint geography
DECLARE @endPoint geography

SET @startPoint = geography::Point(@Latitude1, @Longitude1, 4326);

SET @endPoint = geography::Point(@Latitude2, @Longitude2, 4326);

RETURN @startPoint.STDistance(@endPoint)

END