/******************************
** Name: [vw_RystadWellHeaderSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  11/13/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/13/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [DW].[vw_RystadWellHeaderSatStageData]
AS
SELECT 
	REPLACE(REPLACE(CONVERT(VARCHAR(60), LTRIM(RTRIM(wh.API_Number))), '-', ''),'P', '') AS API14,
    'Rystad Well Header' AS [RecordSource],
    COALESCE(wh.Last_Update_Date, wh.First_Record_Date, GETDATE()) AS [LoadDate],
    CONVERT(DATETIME2(7), NULL) AS [LoadEndDate],
    wh.[Lease_Name] AS [Lease_Name],
    CONVERT(VARCHAR(1), NULL) AS [Well_Number],
    oper.Operator,
    wh.[Field],
    wh.Well_Type AS [Primary_Product],
	wh.Well_Direction AS [Hole_Direction],
    wh.Latitude AS [Surface_Hole_Latitude],
    wh.Longitude AS [Surface_Hole_Longitude],
    'WGS84' AS [Surface_Hole_Datum],
    wh.BottomHole_Latitude AS [Bottom_Hole_Latitude],
    wh.BottomHole_Latitude AS [Bottom_Hole_Longitude],
    'WGS84' AS [Bottom_Hole_Datum],
    geo.State,
    geo.County,
    loc.Section,
    loc.Township,
    loc.Range,
    CONVERT(VARCHAR(1), NULL) AS [Abstract],
    CONVERT(VARCHAR(1), NULL) AS [Survey],
    CONVERT(VARCHAR(1), NULL) AS [Block],
    CONVERT(VARCHAR(1), NULL) AS [Quarter_Quarter],
	CONVERT(VARCHAR(1), NULL) AS [Footage_North_South],
    CONVERT(VARCHAR(1), NULL) AS [Footage_East_West],
    CONVERT(VARCHAR(1), NULL) AS [Footage_Reference_Name],
	geo.Basin,
    CONVERT(VARCHAR(1), NULL) AS [Geologic_Province],
    wh.Formation AS [Formation_Projected],
    wh.Formation AS [Formation_TD],
	wh.Formation AS [Formation_Producing_Top],
    wh.Formation AS [Formation_Producing_Base],
    wh.Formation AS [Formation_80_Degree_Heel_Pt],
	CONVERT(VARCHAR(1), NULL) AS [Play],
	CONVERT(VARCHAR(1), NULL) AS [Subplay],
	CONVERT(VARCHAR(1), NULL) AS [Play_Type],
    wh.Total_Measured_Depth AS [Depth_Total],
    CONVERT(decimal(32, 5), NULL) AS [Depth_Kickoff_Point],
    wh.True_Vertical_Depth AS [Depth_True_Vertical],
    CONVERT(decimal(32, 5), NULL) AS [Depth_Plug_Back],
    CONVERT(DECIMAL(10, 5), NULL) AS [Depth_Total_Driller],
    CONVERT(DECIMAL(10, 5), NULL) AS [Depth_Total_Logger],
    CONVERT(DECIMAL(10, 5), NULL) AS [Depth_Total_Projected],
    CONVERT(DECIMAL(10, 5), NULL) AS [Depth_Whipstock],
	wh.Upper_Perforation AS [Depth_Upper_Perforation], 
	wh.Lower_Perforation AS [Depth_Lower_Perforation],
	wh.Perforated_Length as [Length_Perforated_Interval],
    wh.Lateral_Length AS [Length_Lateral],
    CONVERT(DECIMAL(10, 5), NULL) AS [Length_Horizontal],
    CONVERT(DECIMAL(10, 5), NULL) AS [Elevation_Ground],
    CONVERT(DECIMAL(10, 5), NULL) AS [Elevation_Casing_Flange],
    CONVERT(DECIMAL(10, 5), NULL) AS [Elevation_Derrick_Floor],
    CONVERT(DECIMAL(10, 5), NULL) AS [Elevation_Kelly_Bushing],
    CONVERT(DECIMAL(10, 5), NULL) AS [Elevation_Rotary_Table],
	wh.Permit_Issue_Date AS [Date_Permit],
    CONVERT(DATETIME2(7), NULL) AS [Date_Rig_Onsite],
    wh.Spud_Date AS [Date_Spud],
	wh.Completion_Date AS [Date_Completion], 
    CONVERT(DATETIME2(7), NULL) AS [Date_Rig_Release],
    CONVERT(DATETIME2(7), NULL) AS [Date_Abandonment],
	wh.Production_Start_Date AS [Date_First_Production],
    wh.Last_Production_Date AS [Date_Last_Activity]
FROM
	[StageRystad].[WellHeader] wh WITH (NOLOCK)
LEFT JOIN
	[StageRystad].Geography geo WITH (NOLOCK)
ON
	wh.FK_NASGeography = geo.Id
LEFT JOIN
	[StageRystad].Location loc WITH (NOLOCK)
ON
	wh.FK_NASLocation = loc.Id
LEFT JOIN
	[StageRystad].Operator oper WITH (NOLOCK)
ON
	wh.FK_NASOperator = oper.Id
WHERE
	geo.Country = 'United States'