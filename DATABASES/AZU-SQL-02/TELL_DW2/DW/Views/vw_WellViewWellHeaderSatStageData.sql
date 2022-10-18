/******************************
** Name:  [vw_WellViewWellHeaderSatStageData]
** Desc:
** Auth:  Dee Glazebrook
** Date:  10/08/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    10/08/2019   Dee       Object creation
*******************************/

-- TODO: redirect null and duplicate API14 records to error log

CREATE VIEW [DW].[vw_WellViewWellHeaderSatStageData] AS

SELECT * FROM
(SELECT LEFT(COALESCE(wb.wellboreida, wh.wellida), 14) AS API14
      ,'WellView Well Header' AS [RecordSource]
      ,CONVERT(DATETIME2(7), wh.sysmoddate) AS [LoadDate]
      ,CONVERT(DATETIME2(7), NULL) AS [LoadEndDate]
      ,wh.lease AS [Lease_Name]
      ,wh.wellname AS [Well_Number]
      ,wh.operator AS [Operator]
      ,wh.fieldname AS [Field]
      ,wh.primaryfluiddes AS [Primary_Product]
      ,wh.wellconfig AS [Hole_Direction]
      ,wh.latitude AS [Surface_Hole_Latitude]
      ,wh.longitude AS [Surface_Hole_Longitude]
	  ,wh.latlongdatum AS [Surface_Hole_Datum]
      ,wb.latitude AS [Bottom_Hole_Latitude]
      ,wb.longitude AS [Bottom_Hole_Longitude]
      ,wb.latlongdatum AS [Bottom_Hole_Datum]
      ,wh.stateprov AS [State]
      ,wh.county AS [County]
      ,FORMAT(wl.section, '0') AS [Section]
      ,FORMAT(wl.township, '0') + wl.townshipdir AS [Township]
      ,FORMAT(wl.[range], '0') +  wl.rangedir AS [Range]
      ,CONVERT(varchar(20), NULL) AS [Abstract]
      ,CONVERT(varchar(60), NULL) AS [Survey]
      ,CONVERT(varchar(20), NULL) AS [Block]
	  ,CONVERT(varchar(20), NULL) AS [Quarter_Quarter]
      ,CONVERT(varchar(60), NULL)  AS [Footage_North_South]
      ,CONVERT(varchar(60), NULL) AS [Footage_East_West]
      ,CONVERT(varchar(60), NULL) AS [Footage_Reference_Name]
      ,wh.basin AS [Basin]
	  ,CONVERT(VARCHAR(60), NULL) AS [Geologic_Province]
      ,z.zonename AS [Formation_Projected]
      ,z.zonename AS [Formation_TD]
      ,z.zonename AS [Formation_Producing_Top]
      ,z.zonename AS [Formation_Producing_Base]
	  ,z.zonename AS [Formation_80_Degree_Heel_Pt]
	  ,CONVERT(VARCHAR(60), NULL) AS [Play]
	  ,CONVERT(VARCHAR(50), NULL) AS [Subplay]
	  ,CONVERT(VARCHAR(30), NULL)  AS [Play_Type]
      ,wbs.total_depth AS [Depth_Total]
      ,NULL AS [Depth_Kickoff_Point]
      ,NULL AS [Depth_True_Vertical]
      ,NULL AS [Depth_Plug_Back]
      ,NULL AS [Depth_Total_Driller]
      ,NULL AS [Depth_Total_Logger]
      ,NULL AS [Depth_Total_Projected]
      ,NULL AS [Depth_Whipstock]
	  ,p.Depth_Upper_Perforation AS [Depth_Upper_Perforation]
	  ,p.Depth_Lower_Perforation AS [Depth_Lower_Perforation]
	  ,CASE WHEN 
		(p.Depth_Lower_Perforation IS NULL 
		OR p.Depth_Upper_Perforation IS NULL)
	   THEN 
		NULL
	   ELSE 
		(p.Depth_Lower_Perforation - p.Depth_Upper_Perforation)
	   END AS [Length_Perforated_Interval]
      ,NULL AS [Length_Lateral]
      ,NULL AS [Length_Horizontal]
      ,wh.elvground AS [Elevation_Ground]
      ,wh.elvcasflange AS [Elevation_Casing_Flange]
	  ,NULL AS [Elevation_Derrick_Floor]
	  ,wh.elvorigkb AS [Elevation_Kelly_Bushing]
	  ,NULL AS [Elevation_Rotary_Table]
      ,CONVERT(DATE, NULL) AS [Date_Permit]
      ,CONVERT(DATE, NULL) AS [Date_Rig_Onsite]
      ,wh.dttmspud AS [Date_Spud]
      ,CONVERT(DATE, NULL) AS [Date_Completion]
      ,wh.dttmrr AS [Date_Rig_Release]
      ,wh.dttmabandon AS [Date_Abandonment]
      ,wh.dttmfirstprod  AS [Date_First_Production]
      ,wh.sysmoddatedb AS [Date_Last_Activity]
	  ,ROW_NUMBER() OVER (PARTITION BY LEFT(COALESCE(wb.wellboreida, wh.wellida), 14) ORDER BY wh.sysmoddatedb DESC, wb.sysmoddate DESC, wh.sysmoddate DESC) AS WellHeaderSequence
FROM 
	[StagePeloton].[wvwellheader] wh WITH (NOLOCK)
LEFT JOIN 
	[StagePeloton].[wvwellbore] wb WITH (NOLOCK)
ON
	wh.idwell = wb.idwell
LEFT JOIN
	(SELECT
		idrecwellbore,
		MIN(depthtop) as [Depth_Upper_Perforation],
		MAX(depthbtm) as [Depth_Lower_Perforation]
	FROM
		StagePeloton.wvperforation WITH (NOLOCK)
	GROUP BY 
		idrecwellbore
	) p
ON
	wb.idrec = p.idrecwellbore
LEFT JOIN
	(SELECT
		idrecparent,
		MAX(depthbtmactual) as total_depth
	FROM
		StagePeloton.wvwellboresize WITH (NOLOCK)
	GROUP BY 
		idrecparent
	) wbs
ON
	wb.idrec = wbs.idrecparent
LEFT JOIN
	(
	SELECT *
	FROM
		(
		SELECT
			idwell,
			section,
			township,
			townshipdir,
			[range], 
			rangedir,
			ROW_NUMBER() OVER (PARTITION BY idwell ORDER BY sysmoddate DESC) AS WellLocationSequence
		FROM StagePeloton.wvloccongressional wl2 WITH (NOLOCK)
		) wl1
	WHERE 
		wl1.WellLocationSequence = 1
	) wl
ON
	wh.idwell = wl.idwell
LEFT JOIN
	(
	SELECT *
	FROM
		(
		SELECT
			idrecwellbore,
			zonename,
			ROW_NUMBER() OVER (PARTITION BY idwell ORDER BY sysmoddate DESC) AS ZoneSequence
		FROM StagePeloton.wvzone z2 WITH (NOLOCK)
		) z1
	WHERE 
		z1.ZoneSequence = 1
	) z
ON
	wb.idrec = z.idrecwellbore
) wh1
WHERE
	wh1.WellHeaderSequence = 1
	AND API14 IS NOT NULL