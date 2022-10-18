

/******************************
** Name:  [sp_PopulateWellHeader]
** Desc:
** Auth:  Dee Glazebrook
** Date:  10/01/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    10/01/2019   Dee     Object creation
** 2    11/15/2019   Aaron V   Added default LOADDATE to ensure that field isn't null (1/1/1900)
** 3    02/12/2020   Aaron V   Added explicit field list for the WellHeader_AllSources Insert so that additional fields don't break the loader
*******************************/

CREATE PROCEDURE [Upstream].[sp_PopulateWellHeader]
AS

BEGIN
-- Copy table

	TRUNCATE TABLE Upstream.WellHeader_AllSources;
	INSERT INTO Upstream.WellHeader_AllSources
(
	  [API14],
	  [RecordSource],
      [LoadDate],
      [Lease_Name],
      [Well_Number],
      [Operator],
      [Field],
      [Primary_Product],
      [Hole_Direction],
	  [Status],
	  [Activity],
	  [Classification],
      [Surface_Hole_Latitude],
      [Surface_Hole_Longitude],
      [Surface_Hole_Datum],
      [Bottom_Hole_Latitude],
      [Bottom_Hole_Longitude],
      [Bottom_Hole_Datum],
      [State],
      [County],
      [Section],
      [Township],
      [Range],
      [Abstract],
      [Survey],
      [Block],
      [Quarter_Quarter],
      [Footage_North_South],
      [Footage_East_West],
      [Footage_Reference_Name],
      [Basin],
      [Geologic_Province],
      [Formation_Projected],
      [Formation_TD],
      [Formation_Producing_Top],
      [Formation_Producing_Base],
      [Formation_80_Degree_Heel_Pt],
      [Play],
      [Subplay],
      [Play_Type],
      [Depth_Total],
      [Depth_Kickoff_Point],
      [Depth_True_Vertical],
      [Depth_Plug_Back],
      [Depth_Total_Driller],
      [Depth_Total_Logger],
      [Depth_Total_Projected],
      [Depth_Whipstock],
      [Depth_Upper_Perforation],
      [Depth_Lower_Perforation],
      [Length_Perforated_Interval],
      [Length_Lateral],
      [Length_Horizontal],
      [Elevation_Ground],
      [Elevation_Casing_Flange],
      [Elevation_Derrick_Floor],
      [Elevation_Kelly_Bushing],
      [Elevation_Rotary_Table],
      [Date_Permit],
      [Date_Rig_Onsite],
      [Date_Spud],
      [Date_Completion],
      [Date_Rig_Release],
      [Date_Abandonment],
      [Date_First_Production],
      [Date_Last_Activity] 
)
	SELECT H.API14
	  ,S.[RecordSource]
      ,S.[LoadDate]
      ,S.[Lease_Name]
      ,S.[Well_Number]
      ,S.[Operator]
      ,S.[Field]
      ,S.[Primary_Product]
      ,S.[Hole_Direction]
	  ,SS.[Status]
	  ,SS.[Activity]
	  ,SS.[Classification]
      ,S.[Surface_Hole_Latitude]
      ,S.[Surface_Hole_Longitude]
      ,S.[Surface_Hole_Datum]
      ,S.[Bottom_Hole_Latitude]
      ,S.[Bottom_Hole_Longitude]
      ,S.[Bottom_Hole_Datum]
      ,S.[State]
      ,S.[County]
      ,S.[Section]
      ,S.[Township]
      ,S.[Range]
      ,S.[Abstract]
      ,S.[Survey]
      ,S.[Block]
      ,S.[Quarter_Quarter]
      ,S.[Footage_North_South]
      ,S.[Footage_East_West]
      ,S.[Footage_Reference_Name]
      ,S.[Basin]
      ,S.[Geologic_Province]
      ,S.[Formation_Projected]
      ,S.[Formation_TD]
      ,S.[Formation_Producing_Top]
      ,S.[Formation_Producing_Base]
      ,S.[Formation_80_Degree_Heel_Pt]
      ,S.[Play]
      ,S.[Subplay]
      ,S.[Play_Type]
      ,S.[Depth_Total]
      ,S.[Depth_Kickoff_Point]
      ,S.[Depth_True_Vertical]
      ,S.[Depth_Plug_Back]
      ,S.[Depth_Total_Driller]
      ,S.[Depth_Total_Logger]
      ,S.[Depth_Total_Projected]
      ,S.[Depth_Whipstock]
      ,S.[Depth_Upper_Perforation]
      ,S.[Depth_Lower_Perforation]
      ,S.[Length_Perforated_Interval]
      ,S.[Length_Lateral]
      ,S.[Length_Horizontal]
      ,S.[Elevation_Ground]
      ,S.[Elevation_Casing_Flange]
      ,S.[Elevation_Derrick_Floor]
      ,S.[Elevation_Kelly_Bushing]
      ,S.[Elevation_Rotary_Table]
      ,S.[Date_Permit]
      ,S.[Date_Rig_Onsite]
      ,S.[Date_Spud]
      ,S.[Date_Completion]
      ,S.[Date_Rig_Release]
      ,S.[Date_Abandonment]
      ,S.[Date_First_Production]
      ,S.[Date_Last_Activity] 
	FROM DW.HubWell H
	INNER JOIN DW.SatWellHeader S
	ON S.WellHashKey = H.WellHashKey
	AND S.LoadEndDate IS NULL
	LEFT JOIN DW.SatWellStatus SS
	ON SS.WellHashKey = H.WellHashKey
	AND SS.RecordSource = S.RecordSource
	AND SS.LoadEndDate IS NULL

-- Apply aliases
	UPDATE A
	SET A.Hole_Direction = B.New_Hole_Direction
	FROM 
		Upstream.WellHeader_AllSources A
	INNER JOIN
		Upstream.RefWell_HoleDirection B
	ON B.Hole_Direction = A.Hole_Direction;

	UPDATE A
	SET A.Primary_Product = B.New_Primary_Product
	FROM 
		Upstream.WellHeader_AllSources A
	INNER JOIN
		Upstream.RefWell_PrimaryProduct B
	ON B.Primary_Product = A.Primary_Product;

	UPDATE A
	SET A.[State] = B.New_State
	FROM 
		Upstream.WellHeader_AllSources A
	INNER JOIN
		[Upstream].[RefWell_State] B
	ON B.[State] = A.[State];

	UPDATE A
	SET A.County = B.New_County
	FROM 
		Upstream.WellHeader_AllSources A
	INNER JOIN
		[Upstream].[RefWell_County] B
	ON B.County = A.County;

	UPDATE A
	SET A.[Status] = B.[New_Status]
	FROM 
		Upstream.WellHeader_AllSources A
	INNER JOIN
		[Upstream].[RefWell_Status] B
	ON B.[Status] = A.[Status];

	UPDATE A
	SET A.Activity = B.New_Activity
	FROM 
		Upstream.WellHeader_AllSources A
	INNER JOIN
		[Upstream].[RefWell_Activity] B
	ON B.Activity = A.Activity;

	UPDATE A
	SET A.Classification = B.New_Classification
	FROM 
		Upstream.WellHeader_AllSources A
	INNER JOIN
		[Upstream].[RefWell_Classification] B
	ON B.Classification = A.Classification;

	UPDATE A
	SET A.Play = B.New_Play
	FROM 
		Upstream.WellHeader_AllSources A
	INNER JOIN
		[Upstream].RefWell_PlayByStateCounty B
	ON B.[State] = A.[State]
		AND B.County = A.County;

-- Null bad data

	DECLARE @cmd varchar(4000);
	--DECLARE @msg varchar(4000);
	DECLARE cmds CURSOR FOR
		SELECT QuerySQL 
		FROM [Upstream].TransformationQueries 
		WHERE Label = 'WellHeader';

	OPEN cmds;
	WHILE 1 = 1
	BEGIN
		FETCH cmds INTO @cmd
		IF @@fetch_status != 0 BREAK
		--SELECT @msg = 'Executing ' + @cmd
		--RAISERROR (@msg, 0, 1) WITH NOWAIT
		EXEC(@cmd)
	END;
	CLOSE cmds;
	DEALLOCATE cmds;

-- Combine both
	TRUNCATE TABLE [Upstream].[WellHeader];

	IF OBJECT_ID('tempdb..#IHS') IS NOT NULL DROP TABLE #IHS;

	SELECT * INTO #IHS FROM Upstream.WellHeader_AllSources
	WHERE RecordSource = 'IHS Well Header';

	IF OBJECT_ID('tempdb..#DI') IS NOT NULL DROP TABLE #DI;

	SELECT * INTO #DI FROM Upstream.WellHeader_AllSources
	WHERE RecordSource = 'DI Well Rollups';

	WITH IHS_TX
	as 
	(SELECT * FROM #IHS	WHERE [State] = 'TEXAS'),
	DI_LA as
	(SELECT * FROM #DI WHERE [State] = 'LOUISIANA')

	INSERT INTO [Upstream].[WellHeader]
	(
		API14,
		[RecordSource],
		[LoadDate],
		[Lease_Name],
		[Well_Number],
		[Operator],
		[Field],
		[Primary_Product],
		[Hole_Direction],
		[Status],
		[Activity],
		[Classification],
		[Surface_Hole_Latitude],
		[Surface_Hole_Longitude],
		[Surface_Hole_Datum],
		[Bottom_Hole_Latitude],
		[Bottom_Hole_Longitude],
		[Bottom_Hole_Datum],
		[State],
		[County],
		[Section],
		[Township],
		[Range],
		[Abstract],
		[Survey],
		[Block],
		[Quarter_Quarter],
		[Footage_North_South],
		[Footage_East_West],
		[Footage_Reference_Name],
		[Basin],
		[Geologic_Province],
		[Formation_Projected],
		[Formation_TD],
		[Formation_Producing_Top],
		[Formation_Producing_Base],
		[Formation_80_Degree_Heel_Pt],
		[Play],
		[Subplay],
		[Play_Type],
		[Depth_Total],
		[Depth_Kickoff_Point],
		[Depth_True_Vertical],
		[Depth_Plug_Back],
		[Depth_Total_Driller],
		[Depth_Total_Logger],
		[Depth_Total_Projected],
		[Depth_Whipstock],
		[Depth_Upper_Perforation],
		[Depth_Lower_Perforation],
		[Length_Perforated_Interval],
		[Length_Lateral],
		[Length_Horizontal],
		[Elevation_Ground],
		[Elevation_Casing_Flange],
		[Elevation_Derrick_Floor],
		[Elevation_Kelly_Bushing],
		[Elevation_Rotary_Table],
		[Date_Permit],
		[Date_Rig_Onsite],
		[Date_Spud],
		[Date_Completion],
		[Date_Rig_Release],
		[Date_Abandonment],
		[Date_First_Production],
		[Date_Last_Activity]
	)
	SELECT 
		H.API14,
		'Combined IHS & DI' AS [RecordSource],
		COALESCE(IHS_TX.[LoadDate], DI_LA.[LoadDate], IHS.[LoadDate], DI.[LoadDate], CONVERT(DATETIME2(7), '01/01/1900')) AS [LoadDate],
		COALESCE(IHS_TX.[Lease_Name], DI_LA.[Lease_Name], IHS.[Lease_Name], DI.[Lease_Name]) AS [Lease_Name],
		COALESCE(IHS_TX.[Well_Number], DI_LA.[Well_Number], IHS.[Well_Number], DI.[Well_Number]) AS [Well_Number],
		COALESCE(IHS_TX.[Operator], DI_LA.[Operator], IHS.[Operator], DI.[Operator]) AS [Operator],
		COALESCE(IHS_TX.[Field], DI_LA.[Field], IHS.[Field], DI.[Field]) AS [Field],
		COALESCE(IHS_TX.[Primary_Product], DI_LA.[Primary_Product], IHS.[Primary_Product], DI.[Primary_Product]) AS [Primary_Product],
		COALESCE(IHS_TX.[Hole_Direction], DI_LA.[Hole_Direction], IHS.[Hole_Direction], DI.[Hole_Direction]) AS [Hole_Direction],
		COALESCE(IHS_TX.[Status], DI_LA.[Status], IHS.[Status], DI.[Status]) AS [Status],
		COALESCE(IHS_TX.[Activity], DI_LA.[Activity], IHS.[Activity], DI.[Activity]) AS [Activity],
		COALESCE(IHS_TX.[Classification], DI_LA.[Classification], IHS.[Classification], DI.[Classification]) AS [Classification],
		COALESCE(IHS_TX.[Surface_Hole_Latitude], DI_LA.[Surface_Hole_Latitude], IHS.[Surface_Hole_Latitude], DI.[Surface_Hole_Latitude]) AS [Surface_Hole_Latitude],
		COALESCE(IHS_TX.[Surface_Hole_Longitude], DI_LA.[Surface_Hole_Longitude], IHS.[Surface_Hole_Longitude], DI.[Surface_Hole_Longitude]) AS [Surface_Hole_Longitude],
		COALESCE(IHS_TX.[Surface_Hole_Datum], DI_LA.[Surface_Hole_Datum], IHS.[Surface_Hole_Datum], DI.[Surface_Hole_Datum]) AS [Surface_Hole_Datum],
		COALESCE(IHS_TX.[Bottom_Hole_Latitude], DI_LA.[Bottom_Hole_Latitude], IHS.[Bottom_Hole_Latitude], DI.[Bottom_Hole_Latitude]) AS [Bottom_Hole_Latitude],
		COALESCE(IHS_TX.[Bottom_Hole_Longitude], DI_LA.[Bottom_Hole_Longitude], IHS.[Bottom_Hole_Longitude], DI.[Bottom_Hole_Longitude]) AS [Bottom_Hole_Longitude],
		COALESCE(IHS_TX.[Bottom_Hole_Datum], DI_LA.[Bottom_Hole_Datum], IHS.[Bottom_Hole_Datum], DI.[Bottom_Hole_Datum]) AS [Bottom_Hole_Datum],
		COALESCE(IHS_TX.[State], DI_LA.[State], IHS.[State], DI.[State]) AS [State],
		COALESCE(IHS_TX.[County], DI_LA.[County], IHS.[County], DI.[County]) AS [County],
		COALESCE(IHS_TX.[Section], DI_LA.[Section], IHS.[Section], DI.[Section]) AS [Section],
		COALESCE(IHS_TX.[Township], DI_LA.[Township], IHS.[Township], DI.[Township]) AS [Township],
		COALESCE(IHS_TX.[Range], DI_LA.[Range], IHS.[Range], DI.[Range]) AS [Range],
		COALESCE(IHS_TX.[Abstract], DI_LA.[Abstract], IHS.[Abstract], DI.[Abstract]) AS [Abstract],
		COALESCE(IHS_TX.[Survey], DI_LA.[Survey], IHS.[Survey], DI.[Survey]) AS [Survey],
		COALESCE(IHS_TX.[Block], DI_LA.[Block], IHS.[Block], DI.[Block]) AS [Block],
		COALESCE(IHS_TX.[Quarter_Quarter], DI_LA.[Quarter_Quarter], IHS.[Quarter_Quarter], DI.[Quarter_Quarter]) AS [Quarter_Quarter],
		COALESCE(IHS_TX.[Footage_North_South], DI_LA.[Footage_North_South], IHS.[Footage_North_South], DI.[Footage_North_South]) AS [Footage_North_South],
		COALESCE(IHS_TX.[Footage_East_West], DI_LA.[Footage_East_West], IHS.[Footage_East_West], DI.[Footage_East_West]) AS [Footage_East_West],
		COALESCE(IHS_TX.[Footage_Reference_Name], DI_LA.[Footage_Reference_Name], IHS.[Footage_Reference_Name], DI.[Footage_Reference_Name]) AS [Footage_Reference_Name],
		COALESCE(IHS_TX.[Basin], DI_LA.[Basin], IHS.[Basin], DI.[Basin]) AS [Basin],
		COALESCE(IHS_TX.[Geologic_Province], DI_LA.[Geologic_Province], IHS.[Geologic_Province], DI.[Geologic_Province]) AS [Geologic_Province],
		COALESCE(IHS_TX.[Formation_Projected], DI_LA.[Formation_Projected], IHS.[Formation_Projected], DI.[Formation_Projected]) AS [Formation_Projected],
		COALESCE(IHS_TX.[Formation_TD], DI_LA.[Formation_TD], IHS.[Formation_TD], DI.[Formation_TD]) AS [Formation_TD],
		COALESCE(IHS_TX.[Formation_Producing_Top], DI_LA.[Formation_Producing_Top], IHS.[Formation_Producing_Top], DI.[Formation_Producing_Top]) AS [Formation_Producing_Top],
		COALESCE(IHS_TX.[Formation_Producing_Base], DI_LA.[Formation_Producing_Base], IHS.[Formation_Producing_Base], DI.[Formation_Producing_Base]) AS [Formation_Producing_Base],
		COALESCE(IHS_TX.[Formation_80_Degree_Heel_Pt], DI_LA.[Formation_80_Degree_Heel_Pt], IHS.[Formation_80_Degree_Heel_Pt], DI.[Formation_80_Degree_Heel_Pt]) AS [Formation_80_Degree_Heel_Pt],
		COALESCE(IHS_TX.[Play], DI_LA.[Play], IHS.[Play], DI.[Play]) AS [Play],
		COALESCE(IHS_TX.[Subplay], DI_LA.[Subplay], IHS.[Subplay], DI.[Subplay]) AS [Subplay],
		COALESCE(IHS_TX.[Play_Type], DI_LA.[Play_Type], IHS.[Play_Type], DI.[Play_Type]) AS [Play_Type],
		COALESCE(IHS_TX.[Depth_Total], DI_LA.[Depth_Total], IHS.[Depth_Total], DI.[Depth_Total]) AS [Depth_Total],
		COALESCE(IHS_TX.[Depth_Kickoff_Point], DI_LA.[Depth_Kickoff_Point], IHS.[Depth_Kickoff_Point], DI.[Depth_Kickoff_Point]) AS [Depth_Kickoff_Point],
		COALESCE(IHS_TX.[Depth_True_Vertical], DI_LA.[Depth_True_Vertical], IHS.[Depth_True_Vertical], DI.[Depth_True_Vertical]) AS [Depth_True_Vertical],
		COALESCE(IHS_TX.[Depth_Plug_Back], DI_LA.[Depth_Plug_Back], IHS.[Depth_Plug_Back], DI.[Depth_Plug_Back]) AS [Depth_Plug_Back],
		COALESCE(IHS_TX.[Depth_Total_Driller], DI_LA.[Depth_Total_Driller], IHS.[Depth_Total_Driller], DI.[Depth_Total_Driller]) AS [Depth_Total_Driller],
		COALESCE(IHS_TX.[Depth_Total_Logger], DI_LA.[Depth_Total_Logger], IHS.[Depth_Total_Logger], DI.[Depth_Total_Logger]) AS [Depth_Total_Logger],
		COALESCE(IHS_TX.[Depth_Total_Projected], DI_LA.[Depth_Total_Projected], IHS.[Depth_Total_Projected], DI.[Depth_Total_Projected]) AS [Depth_Total_Projected],
		COALESCE(IHS_TX.[Depth_Whipstock], DI_LA.[Depth_Whipstock], IHS.[Depth_Whipstock], DI.[Depth_Whipstock]) AS [Depth_Whipstock],
		COALESCE(IHS_TX.[Depth_Upper_Perforation], DI_LA.[Depth_Upper_Perforation], IHS.[Depth_Upper_Perforation], DI.[Depth_Upper_Perforation]) AS [Depth_Upper_Perforation],
		COALESCE(IHS_TX.[Depth_Lower_Perforation], DI_LA.[Depth_Lower_Perforation], IHS.[Depth_Lower_Perforation], DI.[Depth_Lower_Perforation]) AS [Depth_Lower_Perforation],
		COALESCE(IHS_TX.[Length_Perforated_Interval], DI_LA.[Length_Perforated_Interval], IHS.[Length_Perforated_Interval], DI.[Length_Perforated_Interval]) AS [Length_Perforated_Interval],
		COALESCE(IHS_TX.[Length_Lateral], DI_LA.[Length_Lateral], IHS.[Length_Lateral], DI.[Length_Lateral]) AS [Length_Lateral],
		COALESCE(IHS_TX.[Length_Horizontal], DI_LA.[Length_Horizontal], IHS.[Length_Horizontal], DI.[Length_Horizontal]) AS [Length_Horizontal],
		COALESCE(IHS_TX.[Elevation_Ground], DI_LA.[Elevation_Ground], IHS.[Elevation_Ground], DI.[Elevation_Ground]) AS [Elevation_Ground],
		COALESCE(IHS_TX.[Elevation_Casing_Flange], DI_LA.[Elevation_Casing_Flange], IHS.[Elevation_Casing_Flange], DI.[Elevation_Casing_Flange]) AS [Elevation_Casing_Flange],
		COALESCE(IHS_TX.[Elevation_Derrick_Floor], DI_LA.[Elevation_Derrick_Floor], IHS.[Elevation_Derrick_Floor], DI.[Elevation_Derrick_Floor]) AS [Elevation_Derrick_Floor],
		COALESCE(IHS_TX.[Elevation_Kelly_Bushing], DI_LA.[Elevation_Kelly_Bushing], IHS.[Elevation_Kelly_Bushing], DI.[Elevation_Kelly_Bushing]) AS [Elevation_Kelly_Bushing],
		COALESCE(IHS_TX.[Elevation_Rotary_Table], DI_LA.[Elevation_Rotary_Table], IHS.[Elevation_Rotary_Table], DI.[Elevation_Rotary_Table]) AS [Elevation_Rotary_Table],
		COALESCE(IHS_TX.[Date_Permit], DI_LA.[Date_Permit], IHS.[Date_Permit], DI.[Date_Permit]) AS [Date_Permit],
		COALESCE(IHS_TX.[Date_Rig_Onsite], DI_LA.[Date_Rig_Onsite], IHS.[Date_Rig_Onsite], DI.[Date_Rig_Onsite]) AS [Date_Rig_Onsite],
		COALESCE(IHS_TX.[Date_Spud], DI_LA.[Date_Spud], IHS.[Date_Spud], DI.[Date_Spud]) AS [Date_Spud],
		COALESCE(IHS_TX.[Date_Completion], DI_LA.[Date_Completion], IHS.[Date_Completion], DI.[Date_Completion]) AS [Date_Completion],
		COALESCE(IHS_TX.[Date_Rig_Release], DI_LA.[Date_Rig_Release], IHS.[Date_Rig_Release], DI.[Date_Rig_Release]) AS [Date_Rig_Release],
		COALESCE(IHS_TX.[Date_Abandonment], DI_LA.[Date_Abandonment], IHS.[Date_Abandonment], DI.[Date_Abandonment]) AS [Date_Abandonment],
		COALESCE(IHS_TX.[Date_First_Production], DI_LA.[Date_First_Production], IHS.[Date_First_Production], DI.[Date_First_Production]) AS [Date_First_Production],
		COALESCE(IHS_TX.[Date_Last_Activity], DI_LA.[Date_Last_Activity], IHS.[Date_Last_Activity], DI.[Date_Last_Activity]) AS [Date_Last_Activity]
	FROM 
		(SELECT DISTINCT API14
		FROM Upstream.WellHeader_AllSources
		) H
	LEFT JOIN #DI DI
	on H.API14 = DI.API14
	LEFT JOIN #IHS IHS
	on H.API14 = IHS.API14
	LEFT JOIN IHS_TX
	on H.API14 = IHS_TX.API14
	LEFT JOIN DI_LA
	on H.API14 = DI_LA.API14

END