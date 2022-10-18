-- =============================================
-- Author:      Aaron Vogt
-- Create Date: 02/10/2020
-- Description: Determines the geographic coordinates of the midpoint between two geographic coordinates
-- =============================================
CREATE FUNCTION fn_GeographicMidpoint
(
    @Latitude1 FLOAT,
	@Longitude1 FLOAT,
	@Latitude2 FLOAT,
	@Longitude2 FLOAT
)
RETURNS geography
AS 
BEGIN
    RETURN geography::Point(((ATN2(SIN((@Latitude1 * (PI() / 180.0))) + 
		SIN((@Latitude2 * (PI() / 180.0))), 
		Sqrt((COS((@Latitude1 * (PI() / 180.0))) + 
		(COS((@Latitude2 * (PI() / 180.0))) * 
		COS(((@Longitude2 - @Longitude1) * (PI() / 180.0))))) * 
		(COS((@Latitude1 * (PI() / 180.0))) + 
		(COS((@Latitude2 * (PI() / 180.0))) * 
		COS(((@Longitude2 - @Longitude1) * (PI() / 180.0))))) + 
		(COS((@Latitude2 * (PI() / 180.0))) * 
		SIN(((@Longitude2 - @Longitude1) * (PI() / 180.0)))) * 
		(COS((@Latitude2 * (PI() / 180.0))) * SIN(((@Longitude2 - @Longitude1) * (PI() / 180.0))))))) / (PI() / 180.0)),
		((@Longitude1 * (PI() / 180.0)) + 
		ATN2((COS((@Latitude2 * (PI() / 180.0))) * 
		SIN(((@Longitude2 - @Longitude1) * (PI() / 180.0)))), 
		COS((@Latitude1 * (PI() / 180.0))) + 
		(COS((@Latitude2 * (PI() / 180.0))) * 
		COS(((@Longitude2 - @Longitude1) * (PI() / 180.0)))))) / (PI() / 180.0), 4326);
END