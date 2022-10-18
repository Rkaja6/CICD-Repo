/******************************
** Name:  [sp_TransformInsertStagedWellHeaderData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
** 2    09/11/2019   Aaron V   Added logic to include WellView Headers
** 3	11/13/2019   Aaron V   Added logic to include Rystad Headers
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedWellHeaderData] AS

BEGIN

---------------------------------------------------------------------------------------
-----------   Rystad-------------------------------------------------------------------
---------------------------------------------------------------------------------------
--Ensure pending transactions are not queued
--Consider specifying transaction id's, but be careful not to orphan transactions as these will consume and hold resources on the host
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

BEGIN TRANSACTION
--Populate Hub with hash and key values for use as a lookup for Satellie population
INSERT INTO
	DW.[HubWell]
(
	WellHashKey,
	RecordSource,
	LoadDate,
	API14
)
SELECT
	HASHBYTES('SHA2_256', stg.API14) AS WellHashKey,
	stg.RecordSource,
	stg.LoadDate,
	stg.API14
FROM
	[DW].[vw_RystadWellHeaderSatStageData] stg
LEFT JOIN
	[DW].[HubWell] hub WITH (NOLOCK)	
ON
	hub.WellHashKey = HASHBYTES('SHA2_256', stg.API14)
WHERE
	hub.WellHashKey IS NULL


--INSERT Records that don't exist at all
INSERT INTO 
	[DW].[SatWellHeader]
(	   [WellHashKey]
      ,[RecordSource]
      ,[LoadDate]
      ,[LoadEndDate]
      ,[Lease_Name]
      ,[Well_Number]
      ,[Operator]
      ,[Field]
      ,[Primary_Product]
      ,[Hole_Direction]
      ,[Surface_Hole_Latitude]
      ,[Surface_Hole_Longitude]
      ,[Surface_Hole_Datum]
      ,[Bottom_Hole_Latitude]
      ,[Bottom_Hole_Longitude]
      ,[Bottom_Hole_Datum]
      ,[State]
      ,[County]
      ,[Section]
      ,[Township]
      ,[Range]
      ,[Abstract]
      ,[Survey]
      ,[Block]
      ,[Quarter_Quarter]
      ,[Footage_North_South]
      ,[Footage_East_West]
      ,[Footage_Reference_Name]
      ,[Basin]
      ,[Geologic_Province]
      ,[Formation_Projected]
      ,[Formation_TD]
      ,[Formation_Producing_Top]
      ,[Formation_Producing_Base]
      ,[Formation_80_Degree_Heel_Pt]
	  ,[Play]
	  ,[Subplay]
	  ,[Play_Type]
      ,[Depth_Total]
      ,[Depth_Kickoff_Point]
      ,[Depth_True_Vertical]
      ,[Depth_Plug_Back]
      ,[Depth_Total_Driller]
      ,[Depth_Total_Logger]
      ,[Depth_Total_Projected]
      ,[Depth_Whipstock]
	  ,[Depth_Upper_Perforation]
	  ,[Depth_Lower_Perforation]
	  ,[Length_Perforated_Interval]
      ,[Length_Lateral]
      ,[Length_Horizontal]
      ,[Elevation_Ground]
      ,[Elevation_Casing_Flange]
      ,[Elevation_Derrick_Floor]
      ,[Elevation_Kelly_Bushing]
      ,[Elevation_Rotary_Table]
      ,[Date_Permit]
      ,[Date_Rig_Onsite]
      ,[Date_Spud]
      ,[Date_Completion]
      ,[Date_Rig_Release]
      ,[Date_Abandonment]
      ,[Date_First_Production]
      ,[Date_Last_Activity]
)
SELECT
	   hub.[WellHashKey]
      ,stg.[RecordSource]
      ,stg.[LoadDate]
      ,stg.[LoadEndDate]
      ,stg.[Lease_Name]
      ,stg.[Well_Number]
      ,stg.[Operator]
      ,stg.[Field]
      ,stg.[Primary_Product]
      ,stg.[Hole_Direction]
      ,stg.[Surface_Hole_Latitude]
      ,stg.[Surface_Hole_Longitude]
      ,stg.[Surface_Hole_Datum]
      ,stg.[Bottom_Hole_Latitude]
      ,stg.[Bottom_Hole_Longitude]
      ,stg.[Bottom_Hole_Datum]
      ,stg.[State]
      ,stg.[County]
      ,stg.[Section]
      ,stg.[Township]
      ,stg.[Range]
      ,stg.[Abstract]
      ,stg.[Survey]
      ,stg.[Block]
      ,stg.[Quarter_Quarter]
      ,stg.[Footage_North_South]
      ,stg.[Footage_East_West]
      ,stg.[Footage_Reference_Name]
      ,stg.[Basin]
      ,stg.[Geologic_Province]
      ,stg.[Formation_Projected]
      ,stg.[Formation_TD]
      ,stg.[Formation_Producing_Top]
      ,stg.[Formation_Producing_Base]
      ,stg.[Formation_80_Degree_Heel_Pt]
	  ,stg.[Play]
	  ,stg.[Subplay]
	  ,stg.[Play_Type]
      ,stg.[Depth_Total]
      ,stg.[Depth_Kickoff_Point]
      ,stg.[Depth_True_Vertical]
      ,stg.[Depth_Plug_Back]
      ,stg.[Depth_Total_Driller]
      ,stg.[Depth_Total_Logger]
      ,stg.[Depth_Total_Projected]
      ,stg.[Depth_Whipstock]
	  ,stg.[Depth_Upper_Perforation]
	  ,stg.[Depth_Lower_Perforation]
	  ,stg.[Length_Perforated_Interval]
      ,stg.[Length_Lateral]
      ,stg.[Length_Horizontal]
      ,stg.[Elevation_Ground]
      ,stg.[Elevation_Casing_Flange]
      ,stg.[Elevation_Derrick_Floor]
      ,stg.[Elevation_Kelly_Bushing]
      ,stg.[Elevation_Rotary_Table]
      ,stg.[Date_Permit]
      ,stg.[Date_Rig_Onsite]
      ,stg.[Date_Spud]
      ,stg.[Date_Completion]
      ,stg.[Date_Rig_Release]
      ,stg.[Date_Abandonment]
      ,stg.[Date_First_Production]
      ,stg.[Date_Last_Activity]
FROM
	[DW].[vw_RystadWellHeaderSatStageData] stg
INNER JOIN
	[DW].[HubWell] hub WITH (NOLOCK)
ON
	stg.API14 = hub.API14
LEFT JOIN
	[DW].[SatWellHeader] sat WITH (NOLOCK)
ON
	hub.WellHashKey = sat.WellHashKey AND
	stg.[RecordSource] = sat.RecordSource
WHERE
	sat.WellHashKey IS NULL



--We can commit now since new inserts are completed
COMMIT TRANSACTION

--Roll back open transactions
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

--New transactions for end dating and insertion of new record
BEGIN TRANSACTION

IF OBJECT_ID('tempdb..#new_staged_rystad_well_headers') IS NOT NULL DROP TABLE #new_staged_rystad_well_headers

--Grab keys for staged records that are newer using the updated date.  Later field hashes can be used, if we find that the updated dates are unreliable
SELECT
	sat.WellHashKey,
	stg.API14,
	sat.RecordSource,
	sat.LoadDate AS OldLoadDate,
	stg.LoadDate AS NewLoadDate
INTO
	#new_staged_rystad_well_headers
FROM
	[DW].[SatWellHeader] sat WITH (NOLOCK)
INNER JOIN
	[DW].[vw_RystadWellHeaderSatStageData] stg
ON
	sat.WellHashKey = HASHBYTES('SHA2_256', stg.API14) AND
	stg.[RecordSource] = sat.RecordSource AND
	sat.LoadEndDate IS NULL AND
	stg.LoadDate > sat.LoadDate
INNER JOIN
	[DW].[HubWell] hub WITH (NOLOCK)
ON
	stg.API14 = hub.API14


--End date any records being replaced with the updated date from stage (1 second prior to current record updated date)
UPDATE sat
	SET sat.LoadEndDate = DATEADD(ss, -1, stg.NewLoadDate)
FROM
	[DW].[SatWellHeader] sat
INNER JOIN
	#new_staged_rystad_well_headers stg
ON
	sat.WellHashKey = stg.WellHashKey AND
	sat.RecordSource = stg.RecordSource AND
	sat.LoadDate = stg.OldLoadDate

--Insert any records that were tagged as being updated in stage
INSERT INTO 
	[DW].[SatWellHeader]
(	   [WellHashKey]
      ,[RecordSource]
      ,[LoadDate]
      ,[LoadEndDate]
      ,[Lease_Name]
      ,[Well_Number]
      ,[Operator]
      ,[Field]
      ,[Primary_Product]
      ,[Hole_Direction]
      ,[Surface_Hole_Latitude]
      ,[Surface_Hole_Longitude]
      ,[Surface_Hole_Datum]
      ,[Bottom_Hole_Latitude]
      ,[Bottom_Hole_Longitude]
      ,[Bottom_Hole_Datum]
      ,[State]
      ,[County]
      ,[Section]
      ,[Township]
      ,[Range]
      ,[Abstract]
      ,[Survey]
      ,[Block]
      ,[Quarter_Quarter]
      ,[Footage_North_South]
      ,[Footage_East_West]
      ,[Footage_Reference_Name]
      ,[Basin]
      ,[Geologic_Province]
      ,[Formation_Projected]
      ,[Formation_TD]
      ,[Formation_Producing_Top]
      ,[Formation_Producing_Base]
      ,[Formation_80_Degree_Heel_Pt]
	  ,[Play]
	  ,[Subplay]
	  ,[Play_Type]
      ,[Depth_Total]
      ,[Depth_Kickoff_Point]
      ,[Depth_True_Vertical]
      ,[Depth_Plug_Back]
      ,[Depth_Total_Driller]
      ,[Depth_Total_Logger]
      ,[Depth_Total_Projected]
      ,[Depth_Whipstock]
	  ,[Depth_Upper_Perforation]
	  ,[Depth_Lower_Perforation]
	  ,[Length_Perforated_Interval]
      ,[Length_Lateral]
      ,[Length_Horizontal]
      ,[Elevation_Ground]
      ,[Elevation_Casing_Flange]
      ,[Elevation_Derrick_Floor]
      ,[Elevation_Kelly_Bushing]
      ,[Elevation_Rotary_Table]
      ,[Date_Permit]
      ,[Date_Rig_Onsite]
      ,[Date_Spud]
      ,[Date_Completion]
      ,[Date_Rig_Release]
      ,[Date_Abandonment]
      ,[Date_First_Production]
      ,[Date_Last_Activity]
)
SELECT
	   sat.[WellHashKey]
      ,stg.[RecordSource]
      ,stg.[LoadDate]
      ,stg.[LoadEndDate]
      ,stg.[Lease_Name]
      ,stg.[Well_Number]
      ,stg.[Operator]
      ,stg.[Field]
      ,stg.[Primary_Product]
      ,stg.[Hole_Direction]
      ,stg.[Surface_Hole_Latitude]
      ,stg.[Surface_Hole_Longitude]
      ,stg.[Surface_Hole_Datum]
      ,stg.[Bottom_Hole_Latitude]
      ,stg.[Bottom_Hole_Longitude]
      ,stg.[Bottom_Hole_Datum]
      ,stg.[State]
      ,stg.[County]
      ,stg.[Section]
      ,stg.[Township]
      ,stg.[Range]
      ,stg.[Abstract]
      ,stg.[Survey]
      ,stg.[Block]
      ,stg.[Quarter_Quarter]
      ,stg.[Footage_North_South]
      ,stg.[Footage_East_West]
      ,stg.[Footage_Reference_Name]
      ,stg.[Basin]
      ,stg.[Geologic_Province]
      ,stg.[Formation_Projected]
      ,stg.[Formation_TD]
      ,stg.[Formation_Producing_Top]
      ,stg.[Formation_Producing_Base]
      ,stg.[Formation_80_Degree_Heel_Pt]
	  ,stg.[Play]
	  ,stg.[Subplay]
	  ,stg.[Play_Type]
      ,stg.[Depth_Total]
      ,stg.[Depth_Kickoff_Point]
      ,stg.[Depth_True_Vertical]
      ,stg.[Depth_Plug_Back]
      ,stg.[Depth_Total_Driller]
      ,stg.[Depth_Total_Logger]
      ,stg.[Depth_Total_Projected]
      ,stg.[Depth_Whipstock]
	  ,stg.[Depth_Upper_Perforation]
	  ,stg.[Depth_Lower_Perforation]
	  ,stg.[Length_Perforated_Interval]
      ,stg.[Length_Lateral]
      ,stg.[Length_Horizontal]
      ,stg.[Elevation_Ground]
      ,stg.[Elevation_Casing_Flange]
      ,stg.[Elevation_Derrick_Floor]
      ,stg.[Elevation_Kelly_Bushing]
      ,stg.[Elevation_Rotary_Table]
      ,stg.[Date_Permit]
      ,stg.[Date_Rig_Onsite]
      ,stg.[Date_Spud]
      ,stg.[Date_Completion]
      ,stg.[Date_Rig_Release]
      ,stg.[Date_Abandonment]
      ,stg.[Date_First_Production]
      ,stg.[Date_Last_Activity]
FROM
	[DW].[vw_RystadWellHeaderSatStageData] stg
INNER JOIN
	#new_staged_rystad_well_headers sat
ON
	stg.API14 = sat.API14 AND
	stg.RecordSource = sat.RecordSource AND
	stg.LoadDate = sat.NewLoadDate

--Release temp space used
IF OBJECT_ID('tempdb..#new_staged_rystad_well_headers') IS NOT NULL DROP TABLE #new_staged_rystad_well_headers

COMMIT TRANSACTION



--These can be broken across transactions into seperate stored procs
--TODO Add try catch blocks once completed
--TODO Add code to attempt to catch invalid typed fields (dates/numeric)
--TODO Add code to end date deleted records
--TODO Some fields in the well header views still need to be identified - Please note that data was pulled from levels beyond the Well Headers (e.g. Well Bores)
---------------------------------------------------------------------------------------
-----------   DI   -------------------------------------------------------------------
---------------------------------------------------------------------------------------
--Ensure pending transactions are not queued
--Consider specifying transaction id's, but be careful not to orphan transactions as these will consume and hold resources on the host
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

BEGIN TRANSACTION
--Populate Hub with hash and key values for use as a lookup for Satellie population
INSERT INTO
	DW.[HubWell]
(
	WellHashKey,
	RecordSource,
	LoadDate,
	API14
)
SELECT
	HASHBYTES('SHA2_256', stg.API14) AS WellHashKey,
	stg.RecordSource,
	stg.LoadDate,
	stg.API14
FROM
	[DW].[vw_DIWellHeaderSatStageData] stg
LEFT JOIN
	[DW].[HubWell] hub WITH (NOLOCK)
ON
	hub.WellHashKey = HASHBYTES('SHA2_256', stg.API14)
WHERE
	hub.WellHashKey IS NULL


--INSERT Records that don't exist at all
INSERT INTO 
	[DW].[SatWellHeader]
(	   [WellHashKey]
      ,[RecordSource]
      ,[LoadDate]
      ,[LoadEndDate]
      ,[Lease_Name]
      ,[Well_Number]
      ,[Operator]
      ,[Field]
      ,[Primary_Product]
      ,[Hole_Direction]
      ,[Surface_Hole_Latitude]
      ,[Surface_Hole_Longitude]
      ,[Surface_Hole_Datum]
      ,[Bottom_Hole_Latitude]
      ,[Bottom_Hole_Longitude]
      ,[Bottom_Hole_Datum]
      ,[State]
      ,[County]
      ,[Section]
      ,[Township]
      ,[Range]
      ,[Abstract]
      ,[Survey]
      ,[Block]
      ,[Quarter_Quarter]
      ,[Footage_North_South]
      ,[Footage_East_West]
      ,[Footage_Reference_Name]
      ,[Basin]
      ,[Geologic_Province]
      ,[Formation_Projected]
      ,[Formation_TD]
      ,[Formation_Producing_Top]
      ,[Formation_Producing_Base]
      ,[Formation_80_Degree_Heel_Pt]
	  ,[Play]
	  ,[Subplay]
	  ,[Play_Type]
      ,[Depth_Total]
      ,[Depth_Kickoff_Point]
      ,[Depth_True_Vertical]
      ,[Depth_Plug_Back]
      ,[Depth_Total_Driller]
      ,[Depth_Total_Logger]
      ,[Depth_Total_Projected]
      ,[Depth_Whipstock]
	  ,[Depth_Upper_Perforation]
	  ,[Depth_Lower_Perforation]
	  ,[Length_Perforated_Interval]
      ,[Length_Lateral]
      ,[Length_Horizontal]
      ,[Elevation_Ground]
      ,[Elevation_Casing_Flange]
      ,[Elevation_Derrick_Floor]
      ,[Elevation_Kelly_Bushing]
      ,[Elevation_Rotary_Table]
      ,[Date_Permit]
      ,[Date_Rig_Onsite]
      ,[Date_Spud]
      ,[Date_Completion]
      ,[Date_Rig_Release]
      ,[Date_Abandonment]
      ,[Date_First_Production]
      ,[Date_Last_Activity]
)
SELECT
	   hub.[WellHashKey]
      ,stg.[RecordSource]
      ,stg.[LoadDate]
      ,stg.[LoadEndDate]
      ,stg.[Lease_Name]
      ,stg.[Well_Number]
      ,stg.[Operator]
      ,stg.[Field]
      ,stg.[Primary_Product]
      ,stg.[Hole_Direction]
      ,stg.[Surface_Hole_Latitude]
      ,stg.[Surface_Hole_Longitude]
      ,stg.[Surface_Hole_Datum]
      ,stg.[Bottom_Hole_Latitude]
      ,stg.[Bottom_Hole_Longitude]
      ,stg.[Bottom_Hole_Datum]
      ,stg.[State]
      ,stg.[County]
      ,stg.[Section]
      ,stg.[Township]
      ,stg.[Range]
      ,stg.[Abstract]
      ,stg.[Survey]
      ,stg.[Block]
      ,stg.[Quarter_Quarter]
      ,stg.[Footage_North_South]
      ,stg.[Footage_East_West]
      ,stg.[Footage_Reference_Name]
      ,stg.[Basin]
      ,stg.[Geologic_Province]
      ,stg.[Formation_Projected]
      ,stg.[Formation_TD]
      ,stg.[Formation_Producing_Top]
      ,stg.[Formation_Producing_Base]
      ,stg.[Formation_80_Degree_Heel_Pt]
	  ,stg.[Play]
	  ,stg.[Subplay]
	  ,stg.[Play_Type]
      ,stg.[Depth_Total]
      ,stg.[Depth_Kickoff_Point]
      ,stg.[Depth_True_Vertical]
      ,stg.[Depth_Plug_Back]
      ,stg.[Depth_Total_Driller]
      ,stg.[Depth_Total_Logger]
      ,stg.[Depth_Total_Projected]
      ,stg.[Depth_Whipstock]
	  ,stg.[Depth_Upper_Perforation]
	  ,stg.[Depth_Lower_Perforation]
	  ,stg.[Length_Perforated_Interval]
      ,stg.[Length_Lateral]
      ,stg.[Length_Horizontal]
      ,stg.[Elevation_Ground]
      ,stg.[Elevation_Casing_Flange]
      ,stg.[Elevation_Derrick_Floor]
      ,stg.[Elevation_Kelly_Bushing]
      ,stg.[Elevation_Rotary_Table]
      ,stg.[Date_Permit]
      ,stg.[Date_Rig_Onsite]
      ,stg.[Date_Spud]
      ,stg.[Date_Completion]
      ,stg.[Date_Rig_Release]
      ,stg.[Date_Abandonment]
      ,stg.[Date_First_Production]
      ,stg.[Date_Last_Activity]
FROM
	[DW].[vw_DIWellHeaderSatStageData] stg
INNER JOIN
	[DW].[HubWell] hub WITH (NOLOCK)
ON
	stg.API14 = hub.API14
LEFT JOIN
	[DW].[SatWellHeader] sat WITH (NOLOCK)
ON
	hub.WellHashKey = sat.WellHashKey AND
	stg.[RecordSource] = sat.RecordSource
WHERE
	sat.WellHashKey IS NULL



--We can commit now since new inserts are completed
COMMIT TRANSACTION

--Roll back open transactions
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

--New transactions for end dating and insertion of new record
BEGIN TRANSACTION

IF OBJECT_ID('tempdb..#new_staged_di_well_headers') IS NOT NULL DROP TABLE #new_staged_di_well_headers

--Grab keys for staged records that are newer using the updated date.  Later field hashes can be used, if we find that the updated dates are unreliable
SELECT
	sat.WellHashKey,
	stg.API14,
	sat.RecordSource,
	sat.LoadDate AS OldLoadDate,
	stg.LoadDate AS NewLoadDate
INTO
	#new_staged_di_well_headers
FROM
	[DW].[SatWellHeader] sat WITH (NOLOCK)
INNER JOIN
	[DW].[vw_DIWellHeaderSatStageData] stg
ON
	sat.WellHashKey = HASHBYTES('SHA2_256', stg.API14) AND
	stg.[RecordSource] = sat.RecordSource AND
	sat.LoadEndDate IS NULL AND
	stg.LoadDate > sat.LoadDate
INNER JOIN
	[DW].[HubWell] hub WITH (NOLOCK)
ON
	stg.API14 = hub.API14


--End date any records being replaced with the updated date from stage (1 second prior to current record updated date)
UPDATE sat
	SET sat.LoadEndDate = DATEADD(ss, -1, stg.NewLoadDate)
FROM
	[DW].[SatWellHeader] sat
INNER JOIN
	#new_staged_di_well_headers stg
ON
	sat.WellHashKey = stg.WellHashKey AND
	sat.RecordSource = stg.RecordSource AND
	sat.LoadDate = stg.OldLoadDate

--Insert any records that were tagged as being updated in stage
INSERT INTO 
	[DW].[SatWellHeader]
(	   [WellHashKey]
      ,[RecordSource]
      ,[LoadDate]
      ,[LoadEndDate]
      ,[Lease_Name]
      ,[Well_Number]
      ,[Operator]
      ,[Field]
      ,[Primary_Product]
      ,[Hole_Direction]
      ,[Surface_Hole_Latitude]
      ,[Surface_Hole_Longitude]
      ,[Surface_Hole_Datum]
      ,[Bottom_Hole_Latitude]
      ,[Bottom_Hole_Longitude]
      ,[Bottom_Hole_Datum]
      ,[State]
      ,[County]
      ,[Section]
      ,[Township]
      ,[Range]
      ,[Abstract]
      ,[Survey]
      ,[Block]
      ,[Quarter_Quarter]
      ,[Footage_North_South]
      ,[Footage_East_West]
      ,[Footage_Reference_Name]
      ,[Basin]
      ,[Geologic_Province]
      ,[Formation_Projected]
      ,[Formation_TD]
      ,[Formation_Producing_Top]
      ,[Formation_Producing_Base]
      ,[Formation_80_Degree_Heel_Pt]
	  ,[Play]
	  ,[Subplay]
	  ,[Play_Type]
      ,[Depth_Total]
      ,[Depth_Kickoff_Point]
      ,[Depth_True_Vertical]
      ,[Depth_Plug_Back]
      ,[Depth_Total_Driller]
      ,[Depth_Total_Logger]
      ,[Depth_Total_Projected]
      ,[Depth_Whipstock]
	  ,[Depth_Upper_Perforation]
	  ,[Depth_Lower_Perforation]
	  ,[Length_Perforated_Interval]
      ,[Length_Lateral]
      ,[Length_Horizontal]
      ,[Elevation_Ground]
      ,[Elevation_Casing_Flange]
      ,[Elevation_Derrick_Floor]
      ,[Elevation_Kelly_Bushing]
      ,[Elevation_Rotary_Table]
      ,[Date_Permit]
      ,[Date_Rig_Onsite]
      ,[Date_Spud]
      ,[Date_Completion]
      ,[Date_Rig_Release]
      ,[Date_Abandonment]
      ,[Date_First_Production]
      ,[Date_Last_Activity]
)
SELECT
	   sat.[WellHashKey]
      ,stg.[RecordSource]
      ,stg.[LoadDate]
      ,stg.[LoadEndDate]
      ,stg.[Lease_Name]
      ,stg.[Well_Number]
      ,stg.[Operator]
      ,stg.[Field]
      ,stg.[Primary_Product]
      ,stg.[Hole_Direction]
      ,stg.[Surface_Hole_Latitude]
      ,stg.[Surface_Hole_Longitude]
      ,stg.[Surface_Hole_Datum]
      ,stg.[Bottom_Hole_Latitude]
      ,stg.[Bottom_Hole_Longitude]
      ,stg.[Bottom_Hole_Datum]
      ,stg.[State]
      ,stg.[County]
      ,stg.[Section]
      ,stg.[Township]
      ,stg.[Range]
      ,stg.[Abstract]
      ,stg.[Survey]
      ,stg.[Block]
      ,stg.[Quarter_Quarter]
      ,stg.[Footage_North_South]
      ,stg.[Footage_East_West]
      ,stg.[Footage_Reference_Name]
      ,stg.[Basin]
      ,stg.[Geologic_Province]
      ,stg.[Formation_Projected]
      ,stg.[Formation_TD]
      ,stg.[Formation_Producing_Top]
      ,stg.[Formation_Producing_Base]
      ,stg.[Formation_80_Degree_Heel_Pt]
	  ,stg.[Play]
	  ,stg.[Subplay]
	  ,stg.[Play_Type]
      ,stg.[Depth_Total]
      ,stg.[Depth_Kickoff_Point]
      ,stg.[Depth_True_Vertical]
      ,stg.[Depth_Plug_Back]
      ,stg.[Depth_Total_Driller]
      ,stg.[Depth_Total_Logger]
      ,stg.[Depth_Total_Projected]
      ,stg.[Depth_Whipstock]
	  ,stg.[Depth_Upper_Perforation]
	  ,stg.[Depth_Lower_Perforation]
	  ,stg.[Length_Perforated_Interval]
      ,stg.[Length_Lateral]
      ,stg.[Length_Horizontal]
      ,stg.[Elevation_Ground]
      ,stg.[Elevation_Casing_Flange]
      ,stg.[Elevation_Derrick_Floor]
      ,stg.[Elevation_Kelly_Bushing]
      ,stg.[Elevation_Rotary_Table]
      ,stg.[Date_Permit]
      ,stg.[Date_Rig_Onsite]
      ,stg.[Date_Spud]
      ,stg.[Date_Completion]
      ,stg.[Date_Rig_Release]
      ,stg.[Date_Abandonment]
      ,stg.[Date_First_Production]
      ,stg.[Date_Last_Activity]
FROM
	[DW].[vw_DIWellHeaderSatStageData] stg
INNER JOIN
	#new_staged_di_well_headers sat
ON
	stg.API14 = sat.API14 AND
	stg.RecordSource = sat.RecordSource AND
	stg.LoadDate = sat.NewLoadDate

--Release temp space used
IF OBJECT_ID('tempdb..#new_staged_di_well_headers') IS NOT NULL DROP TABLE #new_staged_di_well_headers

COMMIT TRANSACTION



---------------------------------------------------------------------------------------
-----------   IHS   -------------------------------------------------------------------
---------------------------------------------------------------------------------------
WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

BEGIN TRANSACTION

-- Insert missing WellView headers
INSERT INTO
	[DW].[HubWell]
(
	WellHashKey,
	RecordSource,
	LoadDate,
	API14
)
SELECT
	stg.WellHashKey,
	stg.RecordSource,
	stg.LoadDate,
	stg.API14
FROM
	[DW].[vw_PelotonWellHubStageData] stg
LEFT JOIN
	[DW].[HubWell] hub WITH (NOLOCK)	
ON
	hub.WellHashKey = stg.WellHashKey
WHERE
	hub.WellHashKey IS NULL


--Populate Hub with hash and key values for use as a lookup for Satellie population
INSERT INTO
	[DW].[HubWell]
(
	WellHashKey,
	RecordSource,
	LoadDate,
	API14
)
SELECT
	HASHBYTES('SHA2_256', stg.API14) AS WellHashKey,
	stg.RecordSource,
	stg.LoadDate,
	LEFT(stg.API14, 14)
FROM
	[DW].[vw_IHSWellHeaderSatStageData] stg
LEFT JOIN
	[DW].[HubWell] hub WITH (NOLOCK)	
ON
	hub.WellHashKey = HASHBYTES('SHA2_256', stg.API14)
WHERE
	hub.WellHashKey IS NULL


--INSERT Records that don't exist at all
INSERT INTO 
	[DW].[SatWellHeader]
(	   [WellHashKey]
      ,[RecordSource]
      ,[LoadDate]
      ,[LoadEndDate]
      ,[Lease_Name]
      ,[Well_Number]
      ,[Operator]
      ,[Field]
      ,[Primary_Product]
      ,[Hole_Direction]
      ,[Surface_Hole_Latitude]
      ,[Surface_Hole_Longitude]
      ,[Surface_Hole_Datum]
      ,[Bottom_Hole_Latitude]
      ,[Bottom_Hole_Longitude]
      ,[Bottom_Hole_Datum]
      ,[State]
      ,[County]
      ,[Section]
      ,[Township]
      ,[Range]
      ,[Abstract]
      ,[Survey]
      ,[Block]
      ,[Quarter_Quarter]
      ,[Footage_North_South]
      ,[Footage_East_West]
      ,[Footage_Reference_Name]
      ,[Basin]
      ,[Geologic_Province]
      ,[Formation_Projected]
      ,[Formation_TD]
      ,[Formation_Producing_Top]
      ,[Formation_Producing_Base]
      ,[Formation_80_Degree_Heel_Pt]
	  ,[Play]
	  ,[Subplay]
	  ,[Play_Type]
      ,[Depth_Total]
      ,[Depth_Kickoff_Point]
      ,[Depth_True_Vertical]
      ,[Depth_Plug_Back]
      ,[Depth_Total_Driller]
      ,[Depth_Total_Logger]
      ,[Depth_Total_Projected]
      ,[Depth_Whipstock]
	  ,[Depth_Upper_Perforation]
	  ,[Depth_Lower_Perforation]
	  ,[Length_Perforated_Interval]
      ,[Length_Lateral]
      ,[Length_Horizontal]
      ,[Elevation_Ground]
      ,[Elevation_Casing_Flange]
      ,[Elevation_Derrick_Floor]
      ,[Elevation_Kelly_Bushing]
      ,[Elevation_Rotary_Table]
      ,[Date_Permit]
      ,[Date_Rig_Onsite]
      ,[Date_Spud]
      ,[Date_Completion]
      ,[Date_Rig_Release]
      ,[Date_Abandonment]
      ,[Date_First_Production]
      ,[Date_Last_Activity]
	  ,[Formation_Producing_Name]
	  ,[Status_Final_Code]
)
SELECT
	   hub.[WellHashKey]
      ,stg.[RecordSource]
      ,stg.[LoadDate]
      ,stg.[LoadEndDate]
      ,stg.[Lease_Name]
      ,stg.[Well_Number]
      ,stg.[Operator]
      ,stg.[Field]
      ,stg.[Primary_Product]
      ,stg.[Hole_Direction]
      ,stg.[Surface_Hole_Latitude]
      ,stg.[Surface_Hole_Longitude]
      ,stg.[Surface_Hole_Datum]
      ,stg.[Bottom_Hole_Latitude]
      ,stg.[Bottom_Hole_Longitude]
      ,stg.[Bottom_Hole_Datum]
      ,stg.[State]
      ,stg.[County]
      ,stg.[Section]
      ,stg.[Township]
      ,stg.[Range]
      ,stg.[Abstract]
      ,stg.[Survey]
      ,stg.[Block]
      ,stg.[Quarter_Quarter]
      ,stg.[Footage_North_South]
      ,stg.[Footage_East_West]
      ,stg.[Footage_Reference_Name]
      ,stg.[Basin]
      ,stg.[Geologic_Province]
      ,stg.[Formation_Projected]
      ,stg.[Formation_TD]
      ,stg.[Formation_Producing_Top]
      ,stg.[Formation_Producing_Base]
      ,stg.[Formation_80_Degree_Heel_Pt]
	  ,stg.[Play]
	  ,stg.[Subplay]
	  ,stg.[Play_Type]
      ,stg.[Depth_Total]
      ,stg.[Depth_Kickoff_Point]
      ,stg.[Depth_True_Vertical]
      ,stg.[Depth_Plug_Back]
      ,stg.[Depth_Total_Driller]
      ,stg.[Depth_Total_Logger]
      ,stg.[Depth_Total_Projected]
      ,stg.[Depth_Whipstock]
	  ,stg.[Depth_Upper_Perforation]
	  ,stg.[Depth_Lower_Perforation]
	  ,stg.[Length_Perforated_Interval]
      ,stg.[Length_Lateral]
      ,stg.[Length_Horizontal]
      ,stg.[Elevation_Ground]
      ,stg.[Elevation_Casing_Flange]
      ,stg.[Elevation_Derrick_Floor]
      ,stg.[Elevation_Kelly_Bushing]
      ,stg.[Elevation_Rotary_Table]
      ,stg.[Date_Permit]
      ,stg.[Date_Rig_Onsite]
      ,stg.[Date_Spud]
      ,stg.[Date_Completion]
      ,stg.[Date_Rig_Release]
      ,stg.[Date_Abandonment]
      ,stg.[Date_First_Production]
      ,stg.[Date_Last_Activity]
	  ,stg.[Formation_Producing_Name]
	  ,stg.[Status_Final_Code]
FROM
	[DW].[vw_IHSWellHeaderSatStageData] stg
INNER JOIN
	[DW].[HubWell] hub WITH (NOLOCK)
ON
	stg.API14 = hub.API14
LEFT JOIN
	[DW].[SatWellHeader] sat WITH (NOLOCK)
ON
	hub.WellHashKey = sat.WellHashKey AND
	stg.[RecordSource] = sat.RecordSource
WHERE
	sat.WellHashKey IS NULL



--We can commit now since new inserts are completed
COMMIT TRANSACTION


WHILE @@TRANCOUNT > 0
BEGIN
	ROLLBACK TRANSACTION
END

--New transactions for end dating and insertion of new record
BEGIN TRANSACTION

IF OBJECT_ID('tempdb..#new_staged_ihs_well_headers') IS NOT NULL DROP TABLE #new_staged_ihs_well_headers

--Grab keys for staged records that are newer
SELECT
	sat.WellHashKey,
	stg.API14,
	sat.RecordSource,
	sat.LoadDate AS OldLoadDate,
	stg.LoadDate AS NewLoadDate
INTO
	#new_staged_ihs_well_headers
FROM
	[DW].[SatWellHeader] sat WITH (NOLOCK)
INNER JOIN
	[DW].[vw_IHSWellHeaderSatStageData] stg
ON
	sat.WellHashKey = HASHBYTES('SHA2_256', stg.API14) AND
	stg.[RecordSource] = sat.RecordSource AND
	sat.LoadEndDate IS NULL AND
	stg.LoadDate > sat.LoadDate
INNER JOIN
	[DW].[HubWell] hub WITH (NOLOCK)
ON
	stg.API14 = hub.API14


--End date any records being replaced with the updated date from stage
UPDATE sat
	SET sat.LoadEndDate = DATEADD(ss, -1, stg.NewLoadDate)
FROM
	[DW].[SatWellHeader] sat
INNER JOIN
	#new_staged_ihs_well_headers stg
ON
	sat.WellHashKey = stg.WellHashKey AND
	sat.RecordSource = stg.RecordSource AND
	sat.LoadDate = stg.OldLoadDate

--Insert any records being replaced
INSERT INTO 
	[DW].[SatWellHeader]
(	   [WellHashKey]
      ,[RecordSource]
      ,[LoadDate]
      ,[LoadEndDate]
      ,[Lease_Name]
      ,[Well_Number]
      ,[Operator]
      ,[Field]
      ,[Primary_Product]
      ,[Hole_Direction]
      ,[Surface_Hole_Latitude]
      ,[Surface_Hole_Longitude]
      ,[Surface_Hole_Datum]
      ,[Bottom_Hole_Latitude]
      ,[Bottom_Hole_Longitude]
      ,[Bottom_Hole_Datum]
      ,[State]
      ,[County]
      ,[Section]
      ,[Township]
      ,[Range]
      ,[Abstract]
      ,[Survey]
      ,[Block]
      ,[Quarter_Quarter]
      ,[Footage_North_South]
      ,[Footage_East_West]
      ,[Footage_Reference_Name]
      ,[Basin]
      ,[Geologic_Province]
      ,[Formation_Projected]
      ,[Formation_TD]
      ,[Formation_Producing_Top]
      ,[Formation_Producing_Base]
      ,[Formation_80_Degree_Heel_Pt]
	  ,[Play]
	  ,[Subplay]
	  ,[Play_Type]
      ,[Depth_Total]
      ,[Depth_Kickoff_Point]
      ,[Depth_True_Vertical]
      ,[Depth_Plug_Back]
      ,[Depth_Total_Driller]
      ,[Depth_Total_Logger]
      ,[Depth_Total_Projected]
      ,[Depth_Whipstock]
	  ,[Depth_Upper_Perforation]
	  ,[Depth_Lower_Perforation]
	  ,[Length_Perforated_Interval]
      ,[Length_Lateral]
      ,[Length_Horizontal]
      ,[Elevation_Ground]
      ,[Elevation_Casing_Flange]
      ,[Elevation_Derrick_Floor]
      ,[Elevation_Kelly_Bushing]
      ,[Elevation_Rotary_Table]
      ,[Date_Permit]
      ,[Date_Rig_Onsite]
      ,[Date_Spud]
      ,[Date_Completion]
      ,[Date_Rig_Release]
      ,[Date_Abandonment]
      ,[Date_First_Production]
      ,[Date_Last_Activity]
	  ,[Formation_Producing_Name]
	  ,[Status_Final_Code]
)
SELECT
	   sat.[WellHashKey]
      ,stg.[RecordSource]
      ,stg.[LoadDate]
      ,stg.[LoadEndDate]
      ,stg.[Lease_Name]
      ,stg.[Well_Number]
      ,stg.[Operator]
      ,stg.[Field]
      ,stg.[Primary_Product]
      ,stg.[Hole_Direction]
      ,stg.[Surface_Hole_Latitude]
      ,stg.[Surface_Hole_Longitude]
      ,stg.[Surface_Hole_Datum]
      ,stg.[Bottom_Hole_Latitude]
      ,stg.[Bottom_Hole_Longitude]
      ,stg.[Bottom_Hole_Datum]
      ,stg.[State]
      ,stg.[County]
      ,stg.[Section]
      ,stg.[Township]
      ,stg.[Range]
      ,stg.[Abstract]
      ,stg.[Survey]
      ,stg.[Block]
      ,stg.[Quarter_Quarter]
      ,stg.[Footage_North_South]
      ,stg.[Footage_East_West]
      ,stg.[Footage_Reference_Name]
      ,stg.[Basin]
      ,stg.[Geologic_Province]
      ,stg.[Formation_Projected]
      ,stg.[Formation_TD]
      ,stg.[Formation_Producing_Top]
      ,stg.[Formation_Producing_Base]
      ,stg.[Formation_80_Degree_Heel_Pt]
	  ,stg.[Play]
	  ,stg.[Subplay]
	  ,stg.[Play_Type]
      ,stg.[Depth_Total]
      ,stg.[Depth_Kickoff_Point]
      ,stg.[Depth_True_Vertical]
      ,stg.[Depth_Plug_Back]
      ,stg.[Depth_Total_Driller]
      ,stg.[Depth_Total_Logger]
      ,stg.[Depth_Total_Projected]
      ,stg.[Depth_Whipstock]
	  ,stg.[Depth_Upper_Perforation]
	  ,stg.[Depth_Lower_Perforation]
	  ,stg.[Length_Perforated_Interval]
      ,stg.[Length_Lateral]
      ,stg.[Length_Horizontal]
      ,stg.[Elevation_Ground]
      ,stg.[Elevation_Casing_Flange]
      ,stg.[Elevation_Derrick_Floor]
      ,stg.[Elevation_Kelly_Bushing]
      ,stg.[Elevation_Rotary_Table]
      ,stg.[Date_Permit]
      ,stg.[Date_Rig_Onsite]
      ,stg.[Date_Spud]
      ,stg.[Date_Completion]
      ,stg.[Date_Rig_Release]
      ,stg.[Date_Abandonment]
      ,stg.[Date_First_Production]
      ,stg.[Date_Last_Activity]
	  ,stg.[Formation_Producing_Name]
	  ,stg.[Status_Final_Code]
FROM
	[DW].[vw_IHSWellHeaderSatStageData] stg
INNER JOIN
	#new_staged_ihs_well_headers sat
ON
	stg.API14 = sat.API14 AND
	stg.RecordSource = sat.RecordSource AND
	stg.LoadDate = sat.NewLoadDate

IF OBJECT_ID('tempdb..#new_staged_ihs_well_headers') IS NOT NULL DROP TABLE #new_staged_ihs_well_headers

COMMIT TRANSACTION

END