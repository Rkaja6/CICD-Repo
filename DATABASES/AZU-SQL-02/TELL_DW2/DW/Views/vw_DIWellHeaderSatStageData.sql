/******************************
** Name: [vw_DIWellHeaderSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
** 2    10/8/2019    Dee       Changed order and sourcing for the length columns
*******************************/
CREATE VIEW [DW].[vw_DIWellHeaderSatStageData] AS
/*
There are 2565 GovID's in the WellBores Table that are dups.
So we need to pull the latest by deleted date the updated date
SELECT * FROM
(SELECT DISTINCT * FROM
[DRILLINGINFO].[DW}.[WellBores]
WHERE GovernmentID IN
(SELECT 
      [GovernmentID]
	  
  FROM [DRILLINGINFO].[DW}.[WellBores]
  WHERE DELETEDDATE IS NULL OR DELETEDDATE < '01-02-1900'
        GROUP BY [GovernmentID]
		HAVING COUNT(*) > 1)) a
ORDER BY GovernMentID
	
List of MAX UpdatedDate Across WellBores/WellRollups with API14

Need to consider cleaning up the data types while staging, instead of during transformation

*/	

/*
SELECT
	*
FROM INFORMATION_SCHEMA.Columns WHERE Table_Schema LIKE '%DI%' AND Column_Name LIKE '%activ%'
*/
--Get list of keys that need updated
--Inner join on 


SELECT 
	/* Removing this and moving all calls to HASHBYTES to hub population.  This will improve performance.
	HASHBYTES('SHA2_256', wr.API14) AS [WellHashKey],
	*/
	wr.API14,
    'DI Well Rollups' AS [RecordSource],
    COALESCE(wr.UpdatedDate, wr.CreatedDate, GETDATE()) AS [LoadDate],
    CONVERT(DATETIME2(7), NULL) AS [LoadEndDate],
    wr.[LeaseName] AS [Lease_Name],
    wr.[WellNumber] AS [Well_Number],
    COALESCE(wr.OperatorAlias, wr.[OperatorCompanyName]) AS [Operator],
    wr.[Field] AS [Field],
    wr.ProductionType AS [Primary_Product],
	wr.[DrillType] AS [Hole_Direction],
    wr.[SurfaceHoleLatitudeWGS84] AS [Surface_Hole_Latitude],
    wr.[SurfaceHoleLongitudeWGS84] AS [Surface_Hole_Longitude],
    'WGS84' AS [Surface_Hole_Datum],
    wr.[BottomHoleLatitudeWGS84] AS [Bottom_Hole_Latitude],
    wr.[BottomHoleLongitudeWGS84] AS [Bottom_Hole_Longitude],
    'WGS84' AS [Bottom_Hole_Datum],
    wr.[State] AS [State],
    wr.[CountyParish] AS [County],
    wr.[Section] AS [Section],
    wr.[Township] AS [Township],
    wr.[Range] AS [Range],
    wr.[Abstract] AS [Abstract],
    wr.[Survey] AS [Survey],
    wr.[Block] AS [Block],
    wr.[QuarterQuarter] AS [Quarter_Quarter],
    --DI does not have footage calls
	CONVERT(VARCHAR(60), NULL) AS [Footage_North_South],
    CONVERT(VARCHAR(60), NULL) AS [Footage_East_West],
    CONVERT(VARCHAR(60), NULL) AS [Footage_Reference_Name],
    --See also DIBasin and Play Assessment Basin in WellRollups
	wb.BasinName as [Basin],
    wr.AAPGGeologicProvince AS [Geologic_Province],
    wr.TargetFormation AS [Formation_Projected],
    wb.FormationAtTD AS [Formation_TD],
    -- See also DILandingZone. 
	-- DI doesn't distinguish between the top of the producing interval and the bottom
	-- but it does calculate the average distance to the top/bottom of the zone. And percent in zone.
	wr.ProducingReservoir AS [Formation_Producing_Top],
    wr.ProducingReservoir AS [Formation_Producing_Base],
    CONVERT(VARCHAR(60), NULL) AS [Formation_80_Degree_Heel_Pt],
	wr.DIPlay AS [Play],
	wr.DISubplay as [Subplay],
	CONVERT(VARCHAR(30), NULL) AS [Play_Type],
    wr.MeasuredDepth AS [Depth_Total],
    wb.KickoffPointDepth AS [Depth_Kickoff_Point],
    wr.TrueVerticalDepth AS [Depth_True_Vertical],
    wb.PlugbackDepth AS [Depth_Plug_Back],
    CONVERT(DECIMAL(10, 5), 
		CASE 
			WHEN wb.DrillerTotalDepth = '' THEN NULL
			ELSE wb.DrillerTotalDepth
		END) AS [Depth_Total_Driller],
    wb.LoggersTotalDepth AS [Depth_Total_Logger],
    CONVERT(DECIMAL(10, 5), NULL) AS [Depth_Total_Projected],
    CONVERT(DECIMAL(10, 5), 
		CASE 
			WHEN wb.WhipstockDepth = '' THEN NULL
			ELSE wb.WhipstockDepth
		END) AS [Depth_Whipstock],
	wr.UpperPerforation AS [Depth_Upper_Perforation], 
	wr.LowerPerforation AS [Depth_Lower_Perforation],
	wr.GrossPerforatedInterval as [Length_Perforated_Interval],
    COALESCE(wr.DILateralLength, wr.LateralLength) AS [Length_Lateral],
    COALESCE(wr.HorizontalLength, wr.HorizontalWellboreLength) AS [Length_Horizontal],
    wr.GroundElevation AS [Elevation_Ground],
    wb.CasingFlangeElev AS [Elevation_Casing_Flange],
    wb.DerrickFloorElevation AS [Elevation_Derrick_Floor],
    wb.KellyBushingElevation AS [Elevation_Kelly_Bushing],
    wb.RotaryTableElev AS [Elevation_Rotary_Table],
    --TODO - Lookup from Permits on Permit ID which is at Well Origin level?
	wo.LicenseDate AS [Date_Permit],
    wb.RigOnsiteDate AS [Date_Rig_Onsite],
    wr.[SpudDate] AS [Date_Spud],
    CONVERT(DATE, 
		CASE 
			WHEN wr.CompletionDate = '' THEN NULL
			ELSE wr.CompletionDate
		END) AS [Date_Completion],
    wb.RigReleaseDate AS [Date_Rig_Release],
    wb.AbandonmentDate AS [Date_Abandonment],
    CONVERT(DATE, 
		CASE 
			WHEN wr.[FirstProdDate] = '' THEN NULL
			ELSE wr.[FirstProdDate]
		END) AS [Date_First_Production],
    wr.UpdatedDate AS [Date_Last_Activity],
	--This should always be 1 but we will divert any records that are NOT 1 to an exception table
	ROW_NUMBER() OVER (PARTITION BY wr.API14 ORDER BY UpdatedDate DESC) AS UniqueKeySequence
FROM 
	[StageDI].[WellRollups] wr WITH (NOLOCK)
LEFT JOIN
(
	SELECT * FROM
	(SELECT
		wb2.GovernmentID,
		wb2.FormationAtTD,
		wb2.KickoffPointDepth,
		wb2.PlugbackDepth,
		wb2.DrillerTotalDepth,
		wb2.LoggersTotalDepth,
		wb2.WhipstockDepth,
		wb2.CasingFlangeElev,
		wb2.DerrickFloorElevation,
		wb2.KellyBushingElevation,
		wb2.RotaryTableElev,
		wb2.RigOnsiteDate,
		wb2.RigReleaseDate,
		wb2.AbandonmentDate,
		wb2.BasinName,
		ROW_NUMBER() OVER (PARTITION BY wb2.GovernmentID ORDER BY CASE 
															WHEN wb2.DeletedDate IS NULL THEN 1
															WHEN wb2.DeletedDate = '1900-01-01 00:00:00.000' THEN 2
															ELSE 3
														END, wb2.UpdatedDate DESC, wb2.CreatedDate DESC, wb2.[UID] DESC) WellBoreSequence
	FROM 
		[StageDI].[WellBores] wb2 WITH (NOLOCK)) wb1
	WHERE
		wb1.WellBoreSequence = 1
) wb
ON
	wb.GovernmentID = LEFT(wr.API14,12)
LEFT JOIN
(
	SELECT * FROM
	(SELECT
		wo2.GovernmentID,
		wo2.LicenseDate,
		ROW_NUMBER() OVER (PARTITION BY wo2.GovernmentID ORDER BY CASE 
															WHEN wo2.DeletedDate IS NULL THEN 1
															WHEN wo2.DeletedDate = '1900-01-01 00:00:00.000' THEN 2
															ELSE 3
														END, wo2.UpdatedDate DESC, wo2.CreatedDate DESC, wo2.[UID] DESC) WellBoreSequence
	FROM 
		[StageDI].WellOrigins wo2 WITH (NOLOCK)) wo1
	WHERE
		wo1.WellBoreSequence = 1 
) wo
ON
	wo.GovernmentID = LEFT(wr.API14,10)
	


  --Are there API14's that aren't in producing entities?
  --vice versa?