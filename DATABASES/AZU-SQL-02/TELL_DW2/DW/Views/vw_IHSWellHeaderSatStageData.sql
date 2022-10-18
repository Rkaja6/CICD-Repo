/******************************
** Name:  [vw_IHSWellHeaderSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
** 2    10/8/2019    Dee       Added lateral length rollups from T_WELL_TEST_PERFORATION.
**							   Upper and lower perfs now sourced from T_WELL_TEST_PERFORATION as well.
** 3    10/8/2019    Dee       Primary Product and First Prod Date are now sourced from T_PRODUCTION_PRODUCTION_HEADER
*******************************/
CREATE VIEW [DW].[vw_IHSWellHeaderSatStageData] AS
--WTODO - Will need to check to make sure all prod headers are in well headers and vice versa


SELECT * FROM
(SELECT LEFT(wh.UWI, 14) AS API14
      ,'IHS Well Header' AS [RecordSource]
      ,CONVERT(DATETIME2(7), wh.CADIS_SYSTEM_UPDATED) AS [LoadDate]
      ,CONVERT(DATETIME2(7), NULL) AS [LoadEndDate]
      ,wh.LEASE_NAME AS [Lease_Name]
      ,wh.WELL_NUMBER AS [Well_Number]
      ,wh.OPERATOR_NAME AS [Operator]
      ,wh.FIELD_NAME AS [Field]
      ,ph.PRIMARY_PRODUCT AS [Primary_Product]
      ,wh.HOLE_DIRECTION AS [Hole_Direction]
      ,wh.SURFACE_LATITUDE AS [Surface_Hole_Latitude]
      ,wh.SURFACE_LONGITUDE AS [Surface_Hole_Longitude]
	  ,'NAD27' AS [Surface_Hole_Datum]
      ,wh.BH_LATITUDE AS [Bottom_Hole_Latitude]
      ,wh.BH_LONGITUDE AS [Bottom_Hole_Longitude]
      ,'NAD27' AS [Bottom_Hole_Datum]
      ,wh.STATE_NAME AS [State]
      ,wh.COUNTY_NAME AS [County]
      ,FORMAT(wl.SECTION_NUMBER, '0') AS [Section]
      ,FORMAT(wl.TOWNSHIP_NUMBER, '0') + wl.TOWNSHIP_DIRECTION AS [Township]
      ,FORMAT(wl.RANGE_NUMBER, '0') +  wl.RANGE_DIRECTION AS [Range]
      ,wl.TEXAS_ABSTRACT AS [Abstract]
      ,wl.TEXAS_SURVEY AS [Survey]
      ,COALESCE(wl.TEXAS_BLOCK_NUMBER, wl.OFFSHORE_BLOCK_NUMBER) AS [Block]
	  ,wl.SPOT AS [Quarter_Quarter]
      ,FORMAT(wl.FOOTAGE_NORTH_SOUTH, '0') + ' ' + FOOTAGE_NORTH_SOUTH_START_LINE  AS [Footage_North_South]
      ,FORMAT(wl.FOOTAGE_EAST_WEST, '0') + ' ' + FOOTAGE_EAST_WEST_START_LINE AS [Footage_East_West]
      ,wl.FOOTAGE_REFERENCE_NAME AS [Footage_Reference_Name]
      ,wh.BASIN AS [Basin]
	  ,CONVERT(VARCHAR(60), NULL) AS [Geologic_Province]
      ,wh.FORMATION_PROJECTED_NAME AS [Formation_Projected]
      ,COALESCE(wh.PRODFIT_FORMATION_AT_TD_NAME, wh.FORMATION_AT_TD_NAME) AS [Formation_TD]
      ,wh.PRODFIT_TOP_PRODUCING_FORMATION AS [Formation_Producing_Top]
      ,wh.PRODFIT_BASE_PRODUCING_FORMATION AS [Formation_Producing_Base]
	  ,wh.PRODFIT_80_DEGREE_HEEL_PT_FORM AS [Formation_80_Degree_Heel_Pt]
	  ,wh.PLAY_NAME AS [Play]
	  ,CONVERT(VARCHAR(50), NULL) AS [Subplay]
	  ,wh.PLAY_TYPE AS [Play_Type]
      ,wh.DEPTH_TRUE_VERTICAL AS [Depth_Total]
      ,NULL AS [Depth_Kickoff_Point]
      ,wh.DEPTH_TRUE_VERTICAL AS [Depth_True_Vertical]
      ,NULL AS [Depth_Plug_Back]
      ,wh.DEPTH_TOTAL_DRILLER AS [Depth_Total_Driller]
      ,wh.DEPTH_TOTAL_LOGGER AS [Depth_Total_Logger]
      ,wh.DEPTH_TOTAL_PROJECTED AS [Depth_Total_Projected]
      ,wh.DEPTH_WHIPSTOCK AS [Depth_Whipstock]
	  ,wtp.Depth_Upper_Perforation AS [Depth_Upper_Perforation]
	  ,wtp.Depth_Lower_Perforation AS [Depth_Lower_Perforation]
	  ,CASE WHEN 
		(wtp.Depth_Lower_Perforation IS NULL 
		OR wtp.Depth_Upper_Perforation IS NULL)
	   THEN 
		NULL
	   ELSE 
		(wtp.Depth_Lower_Perforation - wtp.Depth_Upper_Perforation)
	   END AS [Length_Perforated_Interval]
      ,NULL AS [Length_Lateral]
      ,wtp.Length_Horizontal AS [Length_Horizontal]
      ,wh.GROUND_ELEVATION AS [Elevation_Ground]
      ,NULL AS [Elevation_Casing_Flange]
	  ,NULL AS [Elevation_Derrick_Floor]
	  ,NULL AS [Elevation_Kelly_Bushing]
	  ,NULL AS [Elevation_Rotary_Table]
      ,wh.PERMIT_DATE AS [Date_Permit]
      ,CONVERT(DATE, NULL) AS [Date_Rig_Onsite]
      ,wh.DATE_SPUD AS [Date_Spud]
      ,wh.DATE_COMPLETION AS [Date_Completion]
      ,wh.DATE_RIG_RELEASE AS [Date_Rig_Release]
      ,wh.DATE_ABANDONMENT AS [Date_Abandonment]
      ,ph.DATE_PRODUCTION_START  AS [Date_First_Production]
      ,wh.DATE_LAST_ACTIVITY AS [Date_Last_Activity]
	  ,wh.FORMATION_PRODUCING_NAME AS [Formation_Producing_Name]
	  ,wh.STATUS_FINAL_CODE AS [Status_Final_Code]
	  ,ROW_NUMBER() OVER (PARTITION BY LEFT(wh.UWI, 14) ORDER BY wh.CADIS_SYSTEM_UPDATED DESC, ph.CADIS_SYSTEM_UPDATED DESC, wl.CADIS_SYSTEM_UPDATED DESC) AS WellHeaderSequence
FROM 
	[StageIHS].[T_WELL_HEADER] wh WITH (NOLOCK)
LEFT JOIN 
	(
	SELECT
		UWI,
		AVG(LAT_LEN_HORIZ_DISPLACEMENT_FT) as [Length_Horizontal],
		MIN(DEPTH_TOP) AS [Depth_Upper_Perforation],
		MAX(DEPTH_BASE) AS [Depth_Lower_Perforation]
	FROM StageIHS.T_WELL_TEST_PERFORATION WITH (NOLOCK)
	GROUP BY UWI
	) wtp
ON 
	wh.API_NUMBER = wtp.UWI
LEFT JOIN
	(
	SELECT
		*
	FROM
		(
		SELECT
			API,
			ph2.PRIMARY_PRODUCT,
			ph2.DATE_PRODUCTION_START,
			ph2.CADIS_SYSTEM_UPDATED,
			ROW_NUMBER() OVER (PARTITION BY API ORDER BY CADIS_SYSTEM_UPDATED DESC) AS ProductionHeaderSequence
		FROM
			[StageIHS].[T_PRODUCTION_PRODUCTION_HEADER] ph2 WITH (NOLOCK)
		) ph1
	WHERE
		ph1.ProductionHeaderSequence = 1
	) ph
ON
	wh.API_NUMBER = ph.API
LEFT JOIN
	(
	SELECT *
	FROM
		(
		SELECT
			UWI,
			SECTION_NUMBER,
			TOWNSHIP_NUMBER,
			TOWNSHIP_DIRECTION,
			RANGE_NUMBER,
			RANGE_DIRECTION,
			TEXAS_ABSTRACT,
			TEXAS_SURVEY,
			TEXAS_BLOCK_NUMBER,
			OFFSHORE_BLOCK_NUMBER,
			SPOT,
			FOOTAGE_EAST_WEST,
			FOOTAGE_EAST_WEST_START_LINE,
			FOOTAGE_NORTH_SOUTH,
			FOOTAGE_NORTH_SOUTH_START_LINE,
			FOOTAGE_REFERENCE_NAME,
			CADIS_SYSTEM_UPDATED,
			ROW_NUMBER() OVER (PARTITION BY UWI ORDER BY CADIS_SYSTEM_UPDATED DESC) AS WellLocationSequence
		FROM [StageIHS].[T_WELL_LOCATION] wl2 WITH (NOLOCK)
		WHERE
			wl2.POSITION = 'SURFACE'
		) wl1
	WHERE 
		wl1.WellLocationSequence = 1
	) wl
ON
	wh.UWI = wl.UWI) wh1
WHERE
	wh1.WellHeaderSequence = 1