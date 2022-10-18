/******************************
** Name:  sp_ResearchPopulateWellHeaderGridLocation
** Desc:
** Auth:  Aaron Vogt
** Date:  02/13/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    02/13/2020   Aaron     Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_ResearchPopulateWellHeaderGridLocation] 
	@batchState VARCHAR(200)
AS
BEGIN
IF OBJECT_ID('tempdb..#APIList') IS NOT NULL DROP TABLE #APIList
SELECT DISTINCT
	API14
INTO
	#APIList
FROM
	Upstream.WellHeader wh
WHERE
	wh.State = @batchState

DELETE 
	api
FROM 
	Research.WellHeaderGridLocation grid
INNER JOIN
	#APIList api
ON
	api.API14 = grid.API14

DECLARE @MinLatitude FLOAT
DECLARE @MaxLatitude FLOAT
DECLARE @MinLongitude FLOAT
DECLARE @MaxLongitude FLOAT

SELECT 
	@MinLatitude = MIN(Midpoint_Latitude) - .1,
	@MaxLatitude = MAX(Midpoint_Latitude) + .1,
	@MinLongitude = MIN(Midpoint_Longitude) - .1,
	@MaxLongitude = MAX(Midpoint_Longitude) + .1
FROM 
	[Upstream].[WellHeader] wh
INNER JOIN
	#APIList api
ON
	wh.API14 = api.API14

PRINT @MinLatitude
PRINT @MaxLatitude
PRINT @MinLongitude
PRINT @MaxLongitude

 --IF OBJECT_ID('TELL_DW2.Research.WellHeaderGridLocation') IS NOT NULL DROP TABLE TELL_DW2.Research.WellHeaderGridLocation
INSERT INTO
	Research.WellHeaderGridLocation
SELECT
	wh.API14,
	vertex1.[TranslatedCoordinateX],
	vertex1.[TranslatedCoordinateY]
FROM
	[Research].[RefGeographyQuarterMileGridPointsUS] vertex1
INNER JOIN
	[Research].[RefGeographyQuarterMileGridPointsUS] vertex2
ON
	vertex2.SWLatitude BETWEEN @MinLatitude AND @MaxLatitude AND
	vertex2.SWLongitude BETWEEN @MinLongitude AND @MaxLongitude AND
	vertex2.[TranslatedCoordinateX] = vertex1.[TranslatedCoordinateX] AND
	vertex2.[TranslatedCoordinateY] = vertex1.[TranslatedCoordinateY] + 1
--INNER JOIN
--	[Research].[RefGeographyQuarterMileGridPointsUS] vertex3
--ON
--	vertex3.[TranslatedCoordinateX] = vertex1.[TranslatedCoordinateX] + 1 AND
--	vertex3.[TranslatedCoordinateY] = vertex1.[TranslatedCoordinateY] + 1
INNER JOIN
	[Research].[RefGeographyQuarterMileGridPointsUS] vertex4
ON
	vertex4.SWLatitude BETWEEN @MinLatitude AND @MaxLatitude AND
	vertex4.SWLongitude BETWEEN @MinLongitude AND @MaxLongitude AND
	vertex4.[TranslatedCoordinateX] = vertex1.[TranslatedCoordinateX] + 1 AND
	vertex4.[TranslatedCoordinateY] = vertex1.[TranslatedCoordinateY]
INNER JOIN
	[Upstream].[WellHeader] wh
ON
	wh.Midpoint_Latitude BETWEEN vertex1.SWLatitude AND vertex2.SWLatitude AND
	wh.Midpoint_Longitude BETWEEN vertex1.SWLongitude AND vertex4.SWLongitude
INNER JOIN
	#APIList apis
ON
	vertex1.SWLatitude BETWEEN @MinLatitude AND @MaxLatitude AND
	vertex1.SWLongitude BETWEEN @MinLongitude AND @MaxLongitude AND
	wh.API14 = apis.API14
END