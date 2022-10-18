/******************************
** Name:  sp_TransformInsertStagedWellLocationData
** Desc:
** Auth:  Aaron Vogt
** Date:  10/16/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    10/16/2019   Aaron V   Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedWellLocationData]
AS
BEGIN
UPDATE
	sat
SET
	sat.LoadEndDate = stg.LoadDate
FROM
	DW.SatWellLocation	sat
INNER JOIN
	[DW].[vw_IHSWellLocationSatStageData] stg
ON
	sat.WellHashKey = stg.WellHashKey AND
	sat.RecordSource = stg.RecordSource AND
	sat.LoadDate < stg.LoadDate

INSERT INTO
	DW.SatWellLocation
(
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[SURFACE_LONGITUDE],
	[SURFACE_LATITUDE],
	[BH_LONGITUDE],
	[BH_LATITUDE],
	[Surface_TOWNSHIP_DIRECTION],
	[Surface_TOWNSHIP_NUMBER],
	[Surface_RANGE_DIRECTION],
	[Surface_RANGE_NUMBER],
	[Surface_SECTION_NUMBER],
	[Surface_SECTION_TYPE],
	[Surface_SPOT],
	[Surface_MERIDIAN_NAME],
	[Surface_REMARK],
	[Surface_FOOTAGE_NORTH_SOUTH],
	[Surface_FOOTAGE_NORTH_SOUTH_START_LINE],
	[Surface_FOOTAGE_EAST_WEST],
	[Surface_FOOTAGE_EAST_WEST_START_LINE],
	[Surface_FOOTAGE_REFERENCE_NAME],
	[BH_TOWNSHIP_DIRECTION],
	[BH_TOWNSHIP_NUMBER],
	[BH_RANGE_DIRECTION],
	[BH_RANGE_NUMBER],
	[BH_SECTION_NUMBER],
	[BH_SECTION_TYPE],
	[BH_SPOT],
	[BH_MERIDIAN_NAME],
	[BH_REMARK],
	[BH_FOOTAGE_NORTH_SOUTH],
	[BH_FOOTAGE_NORTH_SOUTH_START_LINE],
	[BH_FOOTAGE_EAST_WEST],
	[BH_FOOTAGE_EAST_WEST_START_LINE],
	[BH_FOOTAGE_REFERENCE_NAME]
)
SELECT 
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[SURFACE_LONGITUDE],
	stg.[SURFACE_LATITUDE],
	stg.[BH_LONGITUDE],
	stg.[BH_LATITUDE],
	stg.[Surface_TOWNSHIP_DIRECTION],
	stg.[Surface_TOWNSHIP_NUMBER],
	stg.[Surface_RANGE_DIRECTION],
	stg.[Surface_RANGE_NUMBER],
	stg.[Surface_SECTION_NUMBER],
	stg.[Surface_SECTION_TYPE],
	stg.[Surface_SPOT],
	stg.[Surface_MERIDIAN_NAME],
	stg.[Surface_REMARK],
	stg.[Surface_FOOTAGE_NORTH_SOUTH],
	stg.[Surface_FOOTAGE_NORTH_SOUTH_START_LINE],
	stg.[Surface_FOOTAGE_EAST_WEST],
	stg.[Surface_FOOTAGE_EAST_WEST_START_LINE],
	stg.[Surface_FOOTAGE_REFERENCE_NAME],
	stg.[BH_TOWNSHIP_DIRECTION],
	stg.[BH_TOWNSHIP_NUMBER],
	stg.[BH_RANGE_DIRECTION],
	stg.[BH_RANGE_NUMBER],
	stg.[BH_SECTION_NUMBER],
	stg.[BH_SECTION_TYPE],
	stg.[BH_SPOT],
	stg.[BH_MERIDIAN_NAME],
	stg.[BH_REMARK],
	stg.[BH_FOOTAGE_NORTH_SOUTH],
	stg.[BH_FOOTAGE_NORTH_SOUTH_START_LINE],
	stg.[BH_FOOTAGE_EAST_WEST],
	stg.[BH_FOOTAGE_EAST_WEST_START_LINE],
	stg.[BH_FOOTAGE_REFERENCE_NAME]
FROM 
	[DW].[vw_IHSWellLocationSatStageData] stg
LEFT JOIN
	[DW].[SatWellLocation] sat WITH (NOLOCK)
ON
	stg.WellHashKey = sat.WellHashKey AND
	stg.RecordSource = sat.RecordSource
WHERE
	sat.LoadEndDate IS NULL AND
	sat.WellHashKey IS NULL

UPDATE
	sat
SET
	sat.LoadEndDate = stg.LoadDate
FROM
	DW.SatWellLocation	sat
INNER JOIN
	[DW].[vw_DIWellLocationSatStageData] stg
ON
	sat.WellHashKey = stg.WellHashKey AND
	sat.RecordSource = stg.RecordSource AND
	sat.LoadDate < stg.LoadDate

INSERT INTO
	DW.SatWellLocation
(
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[SURFACE_LONGITUDE],
	[SURFACE_LATITUDE],
	[BH_LONGITUDE],
	[BH_LATITUDE],
	[Surface_TOWNSHIP_DIRECTION],
	[Surface_TOWNSHIP_NUMBER],
	[Surface_RANGE_DIRECTION],
	[Surface_RANGE_NUMBER],
	[Surface_SECTION_NUMBER],
	[Surface_SECTION_TYPE],
	[Surface_SPOT],
	[Surface_MERIDIAN_NAME],
	[Surface_REMARK],
	[Surface_FOOTAGE_NORTH_SOUTH],
	[Surface_FOOTAGE_NORTH_SOUTH_START_LINE],
	[Surface_FOOTAGE_EAST_WEST],
	[Surface_FOOTAGE_EAST_WEST_START_LINE],
	[Surface_FOOTAGE_REFERENCE_NAME],
	[BH_TOWNSHIP_DIRECTION],
	[BH_TOWNSHIP_NUMBER],
	[BH_RANGE_DIRECTION],
	[BH_RANGE_NUMBER],
	[BH_SECTION_NUMBER],
	[BH_SECTION_TYPE],
	[BH_SPOT],
	[BH_MERIDIAN_NAME],
	[BH_REMARK],
	[BH_FOOTAGE_NORTH_SOUTH],
	[BH_FOOTAGE_NORTH_SOUTH_START_LINE],
	[BH_FOOTAGE_EAST_WEST],
	[BH_FOOTAGE_EAST_WEST_START_LINE],
	[BH_FOOTAGE_REFERENCE_NAME]
)
SELECT 
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[SURFACE_LONGITUDE],
	stg.[SURFACE_LATITUDE],
	stg.[BH_LONGITUDE],
	stg.[BH_LATITUDE],
	stg.[Surface_TOWNSHIP_DIRECTION],
	stg.[Surface_TOWNSHIP_NUMBER],
	stg.[Surface_RANGE_DIRECTION],
	stg.[Surface_RANGE_NUMBER],
	stg.[Surface_SECTION_NUMBER],
	stg.[Surface_SECTION_TYPE],
	stg.[Surface_SPOT],
	stg.[Surface_MERIDIAN_NAME],
	stg.[Surface_REMARK],
	stg.[Surface_FOOTAGE_NORTH_SOUTH],
	stg.[Surface_FOOTAGE_NORTH_SOUTH_START_LINE],
	stg.[Surface_FOOTAGE_EAST_WEST],
	stg.[Surface_FOOTAGE_EAST_WEST_START_LINE],
	stg.[Surface_FOOTAGE_REFERENCE_NAME],
	stg.[BH_TOWNSHIP_DIRECTION],
	stg.[BH_TOWNSHIP_NUMBER],
	stg.[BH_RANGE_DIRECTION],
	stg.[BH_RANGE_NUMBER],
	stg.[BH_SECTION_NUMBER],
	stg.[BH_SECTION_TYPE],
	stg.[BH_SPOT],
	stg.[BH_MERIDIAN_NAME],
	stg.[BH_REMARK],
	stg.[BH_FOOTAGE_NORTH_SOUTH],
	stg.[BH_FOOTAGE_NORTH_SOUTH_START_LINE],
	stg.[BH_FOOTAGE_EAST_WEST],
	stg.[BH_FOOTAGE_EAST_WEST_START_LINE],
	stg.[BH_FOOTAGE_REFERENCE_NAME]
FROM 
	[DW].[vw_DIWellLocationSatStageData] stg
LEFT JOIN
	[DW].[SatWellLocation] sat WITH (NOLOCK)
ON
	stg.WellHashKey = sat.WellHashKey AND
	stg.RecordSource = sat.RecordSource
WHERE
	sat.LoadEndDate IS NULL AND
	sat.WellHashKey IS NULL
END