
/******************************
** Name:  [sp_TransformInsertStagedTransactionsData]
** Desc:  Calculates and stores the geographic midpoints of the sticks for each well header record.  Sticks with no bottom hole coordinate are set
**        to the surface hole coordinate.  After this, sticks with no surfsace hole coordinate are set to the bottom hole coordinate
** Auth:  Aaron Vogt
** Date:  02/12/2020
**************************
** Change History
**************************
** PR   Date         Author     Description 
** --   ----------   -------    ------------------------------------
** 1    02/12/2020   Aaron Vogt Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_UpstreamPopulateWellHeaderStickMidpoints] AS
BEGIN
UPDATE wh
	SET
		Midpoint_Latitude = Surface_Hole_Latitude,
		Midpoint_Longitude = Surface_Hole_Longitude
FROM
	Upstream.WellHeader wh
WHERE
	wh.Midpoint_Latitude IS NULL AND
	wh.Surface_Hole_Latitude IS NOT NULL AND
	wh.Surface_Hole_Longitude IS NOT NULL AND
	wh.Bottom_Hole_Latitude IS NULL

UPDATE wh
	SET
		Midpoint_Latitude = ((ATN2(SIN((Surface_Hole_Latitude * (PI() / 180.0))) + 
		SIN((Bottom_Hole_Latitude * (PI() / 180.0))), 
		Sqrt((COS((Surface_Hole_Latitude * (PI() / 180.0))) + 
		(COS((Bottom_Hole_Latitude * (PI() / 180.0))) * 
		COS(((Bottom_Hole_Longitude - Surface_Hole_Longitude) * (PI() / 180.0))))) * 
		(COS((Surface_Hole_Latitude * (PI() / 180.0))) + 
		(COS((Bottom_Hole_Latitude * (PI() / 180.0))) * 
		COS(((Bottom_Hole_Longitude - Surface_Hole_Longitude) * (PI() / 180.0))))) + 
		(COS((Bottom_Hole_Latitude * (PI() / 180.0))) * 
		SIN(((Bottom_Hole_Longitude - Surface_Hole_Longitude) * (PI() / 180.0)))) * 
		(COS((Bottom_Hole_Latitude * (PI() / 180.0))) * SIN(((Bottom_Hole_Longitude - Surface_Hole_Longitude) * (PI() / 180.0))))))) / (PI() / 180.0)),
		Midpoint_Longitude = ((Surface_Hole_Longitude * (PI() / 180.0)) + 
		ATN2((COS((Bottom_Hole_Latitude * (PI() / 180.0))) * 
		SIN(((Bottom_Hole_Longitude - Surface_Hole_Longitude) * (PI() / 180.0)))), 
		COS((Surface_Hole_Latitude * (PI() / 180.0))) + 
		(COS((Bottom_Hole_Latitude * (PI() / 180.0))) * 
		COS(((Bottom_Hole_Longitude - Surface_Hole_Longitude) * (PI() / 180.0)))))) / (PI() / 180.0)
FROM
	Upstream.WellHeader wh
WHERE
	wh.Midpoint_Latitude IS NULL AND
	wh.Surface_Hole_Latitude IS NOT NULL AND
	wh.Surface_Hole_Longitude IS NOT NULL AND
	wh.Bottom_Hole_Latitude IS NOT NULL AND
	wh.Bottom_Hole_Longitude IS NOT NULL 
	
UPDATE wh
	SET
		Midpoint_Latitude = Surface_Hole_Latitude,
		Midpoint_Longitude = Surface_Hole_Longitude
FROM
	Upstream.WellHeader wh
WHERE
	wh.Midpoint_Latitude IS NULL AND
	wh.Bottom_Hole_Latitude IS NOT NULL AND
	wh.Bottom_Hole_Longitude IS NOT NULL AND
	wh.Surface_Hole_Latitude IS NULL
END