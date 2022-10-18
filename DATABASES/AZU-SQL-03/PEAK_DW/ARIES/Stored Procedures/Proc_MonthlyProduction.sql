










Create PROCEDURE [ARIES].[Proc_MonthlyProduction] AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- State Alias Temp Table
	IF OBJECT_ID('tempdb..#Alias_State') IS NOT NULL
    DROP TABLE #Alias_State;

	CREATE TABLE #Alias_State
		(Orig_String varchar(900),
		New_String varchar(50));

	INSERT into #Alias_State
	select Orig_String, New_String 
	from PEAK_DW.ETL.Alias
	where type = 'state';

	-- County Alias Temp Table
	IF OBJECT_ID('tempdb..#Alias_County') IS NOT NULL
    DROP TABLE #Alias_County;

	CREATE TABLE #Alias_County
		(Orig_String varchar(900),
		New_String varchar(50));

	INSERT into #Alias_County
	select Orig_String, New_String 
	from PEAK_DW.ETL.Alias
	where type = 'county';

	-- Reservoir Alias Temp Table
	IF OBJECT_ID('tempdb..#Alias_Res') IS NOT NULL
    DROP TABLE #Alias_Res;

	CREATE TABLE #Alias_Res
		(Orig_String varchar(900),
		New_String varchar(100));

	INSERT into #Alias_Res
	select Orig_String, New_String 
	from PEAK_DW.ETL.Alias
	where type = 'reservoir';

	-- Operator Alias Temp Table
	IF OBJECT_ID('tempdb..#Alias_Op') IS NOT NULL
    DROP TABLE #Alias_Op;

	CREATE TABLE #Alias_Op
		(Orig_String varchar(900),
		New_String varchar(100));

	INSERT into #Alias_Op
	select Orig_String, LEFT(New_String, 100) As New_String 
	from PEAK_DW.ETL.Alias
	where type = 'operator';

	-- IHS Header Table
	truncate table ARIES.IHS_Header_STG;
	
	INSERT INTO ARIES.IHS_Header_STG
	SELECT
		IPH.entity as EntityID,
		IPH.api,
		APGL.PROPNUM,
		APGL.API10,
		COALESCE(A_S.New_String, IPH.province_state_name) AS [State],
		COALESCE(A_C.New_String, IPH.county_name) AS [County],
		COALESCE(A_R.New_String, IPH.prod_zone_name) AS [Reservoir],
		COALESCE(A_O.New_String, IPH.operator_name) AS [Operator]
	--FROM [ihs].[dbo].production_header IPH
	FROM [AZU-SQL-01].IHSM_Meridian.dbo.T_PRODUCTION_PRODUCTION_HEADER IPH
	INNER JOIN [TELL_DW].[dbo].[AC_PROPERTY] APGL
		ON LEFT(IPH.api,10) = APGL.API10
	INNER JOIN TELL_DW.dbo.AC_PROPERTY AP
		ON APGL.PROPNUM = AP.PROPNUM
		AND APGL.API10 = AP.API10
	LEFT JOIN #Alias_State A_S
		ON A_S.Orig_String = IPH.province_state_name
	LEFT JOIN #Alias_County A_C
		ON A_C.Orig_String = IPH.county_name
	LEFT JOIN #Alias_Res A_R
		ON A_R.Orig_String = IPH.prod_zone_name
	LEFT JOIN #Alias_Op A_O
		ON A_O.Orig_String = IPH.operator_name;
		
	-- Push table back to AZU-SQL-01
	EXEC [AZU-SQL-01].IHSM_Meridian.sys.sp_executesql N'TRUNCATE TABLE [HOUSQL01].[IHS_Header_STG]';
	INSERT INTO  [AZU-SQL-01].IHSM_Meridian.[HOUSQL01].[IHS_Header_STG] 
	SELECT 
		[ENTITYID]
      ,[API]
      ,[PROPNUM]
      ,[API10]
      ,[STATE]
      ,[COUNTY]
      ,[RESERVOIR]
      ,[OPERATOR]
	FROM [ARIES].[IHS_Header_STG];
	
	-- IHS Monthly Prod Table
	
	TRUNCATE TABLE ARIES.IHS_Monthly_Prod_STG; 

	INSERT INTO ARIES.IHS_Monthly_Prod_STG
	SELECT * FROM OPENQUERY(
		[AZU-SQL-01], 
		'SELECT
			IH.PROPNUM,
			IH.[State],
			(CONVERT(date,(IMP.[month] + '' 1 '') + CONVERT(varchar(4),IMP.[year]),(110))) as Month_StartDate,
			SUM(IMP.liquid) AS Oil,
			SUM(IMP.gas) AS Gas,
			SUM(IMP.water) AS Water,
			SUM(IMP.wells) AS NumOfWells
		FROM IHSM_Meridian.[dbo].[T_PRODUCTION_MONTHLY_PRODUCTION] IMP
		INNER JOIN IHSM_Meridian.[HOUSQL01].[IHS_Header_STG] IH
			ON IMP.entity = IH.EntityID
		GROUP BY
			IH.PROPNUM,
			IH.[State],
			IMP.[month], 
			IMP.[year]'
		);
	 
	-- DI Header Temp Table
	IF OBJECT_ID('tempdb..#DI_Header') IS NOT NULL
    DROP TABLE #DI_Header;

	CREATE TABLE #DI_Header
		(
		ENTITYID int,
		API varchar(14),
		PROPNUM varchar(12),
		API10 varchar(10),
		[STATE] varchar(50),
		COUNTY varchar(50),
		RESERVOIR varchar(100),
		OPERATOR varchar(100)
		);
	
	INSERT INTO #DI_Header
	SELECT
		DPE.entityid,
		DPE.ApiNo as API,
		APGL.PROPNUM,
		APGL.API10,
		COALESCE(A_S.New_String, DPE.[State]) AS [State],
		COALESCE(A_C.New_String, DPE.County) AS [County],
		COALESCE(A_R.New_String, DPE.Reservoir) AS [Reservoir],
		COALESCE(A_O.New_String, DPE.CommonOperName) AS [Operator]
	FROM [DRILLINGINFO].[dbo].[ProducingEntities] DPE
	INNER JOIN [TELL_DW].[dbo].AC_PROPERTY APGL
		ON APGL.API10 = LEFT(DPE.ApiNo,10)
	LEFT JOIN #Alias_State A_S
		ON A_S.Orig_String = DPE.[State]
	LEFT JOIN #Alias_County A_C
		ON A_C.Orig_String = DPE.County
	LEFT JOIN #Alias_Res A_R
		ON A_R.Orig_String = DPE.Reservoir
	LEFT JOIN #Alias_Op A_O
		ON A_O.Orig_String = DPE.CommonOperName;

-- Update State if State = Gulf of Mexico
	UPDATE [ARIES].[IHS_Header_STG]
	SET STATE = 'TEXAS'
	WHERE STATE = 'GULF OF MEXICO'
	AND LEFT(API,2) = '42'
	
	UPDATE [ARIES].[IHS_Header_STG]
	SET STATE = 'LOUISIANA'
	WHERE STATE = 'GULF OF MEXICO'
	AND LEFT(API,2) = '17'

	UPDATE #DI_Header
	SET STATE = 'TEXAS'
	WHERE STATE = 'GULF OF MEXICO'
	AND LEFT(API,2) = '42'

	UPDATE #DI_Header
	SET STATE = 'LOUISIANA'
	WHERE STATE = 'GULF OF MEXICO'
	AND LEFT(API,2) = '17'

-- Return query results:
	TRUNCATE TABLE ARIES.Monthly_Prod_STG;
	INSERT INTO ARIES.Monthly_Prod_STG
	SELECT
		COALESCE(ihs.PROPNUM, DI.PROPNUM) AS PROPNUM,
		--COALESCE(ihs.API10, DI.API10) AS API10,
		COALESCE(ihs.[State], DI.[State]) AS [State],
		EOMONTH(COALESCE(ihs.Month_StartDate, DI.Month_StartDate)) AS Month_StartDate,
		CASE COALESCE(ihs.[State], DI.[State]) 
			WHEN 'TEXAS' THEN COALESCE(IHS.Oil, DI.Oil)
			WHEN 'LOUISIANA' THEN COALESCE(DI.Oil, IHS.Oil)
			ELSE NULL
		END AS Oil,
		CASE COALESCE(ihs.[State], DI.[State]) 
			WHEN 'TEXAS' THEN COALESCE(IHS.Gas, DI.Gas)
			WHEN 'LOUISIANA' THEN COALESCE(DI.Gas, IHS.Gas)
			ELSE NULL
		END AS Gas,
		CASE COALESCE(ihs.[State], DI.[State]) 
			WHEN 'TEXAS' THEN COALESCE(IHS.Water, DI.Water)
			WHEN 'LOUISIANA' THEN COALESCE(DI.Water, IHS.Water)
			ELSE NULL
		END AS Water,
		CASE COALESCE(ihs.[State], DI.[State]) 
			WHEN 'TEXAS' THEN CASE WHEN IHS.Oil IS NULL THEN 'DI' ELSE 'IHS' END
			WHEN 'LOUISIANA' THEN CASE WHEN DI.Oil IS NULL THEN 'IHS' ELSE 'DI' END
			ELSE NULL
		END AS Oil_Source,
		CASE COALESCE(ihs.[State], DI.[State]) 
			WHEN 'TEXAS' THEN CASE WHEN IHS.Gas IS NULL THEN 'DI' ELSE 'IHS' END
			WHEN 'LOUISIANA' THEN CASE WHEN DI.Gas IS NULL THEN 'IHS' ELSE 'DI' END
			ELSE NULL
		END AS Gas_Source,
		CASE COALESCE(ihs.[State], DI.[State]) 
			WHEN 'TEXAS' THEN CASE WHEN IHS.Water IS NULL THEN 'DI' ELSE 'IHS' END
			WHEN 'LOUISIANA' THEN CASE WHEN DI.Water IS NULL THEN 'IHS' ELSE 'DI' END
			ELSE NULL
		END AS Water_Source,
		IHS.Oil AS IHS_OIL,
		IHS.Gas AS IHS_GAS,
		IHS.Water AS IHS_WATER,
		IHS.NumOfWells AS IHS_NumOfWells,
		DI.Oil AS DI_OIL,
		DI.Gas AS DI_GAS,
		DI.Water AS DI_WATER,
		DI.NumOfWells AS DI_NumOfWells
	FROM
	-- IHS Data
		ARIES.IHS_Monthly_Prod_STG AS IHS
	-- DrillingInfo Data
	FULL OUTER JOIN
		(
		SELECT 
			DH.PROPNUM,
			--DH.API10,
			DH.[State],
			CONVERT(date, DATEADD(day,1,EOMONTH(DMP.ProdDate,-1))) AS Month_StartDate,
			SUM(DMP.Liq) AS Oil,
			SUM(DMP.Gas) AS Gas,
			SUM(DMP.Wtr) AS Water,
			SUM(DMP.Wcnt) AS NumOfWells
			--,SUM(DMP.AverageDailyOil) AS AvgDailyOil,
			--SUM(DMP.AverageDailyGas) AS AvgDailyGas,
			--SUM(DMP.AverageDailyWater) AS AvgDailyWater
		FROM [DRILLINGINFO].[dbo].[ProducingEntityDetails] DMP
		INNER JOIN #DI_Header DH
			ON DH.EntityId = DMP.EntityId
		GROUP BY
			DH.PROPNUM,
			DH.[State],
			CONVERT(date, DATEADD(day,1,EOMONTH(DMP.ProdDate,-1)))
		) AS DI
		ON IHS.PROPNUM = DI.PROPNUM
		AND IHS.Month_StartDate = DI.Month_StartDate;

	IF OBJECT_ID('tempdb..#Alias_State') IS NOT NULL
    DROP TABLE #Alias_State;
	IF OBJECT_ID('tempdb..#Alias_County') IS NOT NULL
    DROP TABLE #Alias_County;
	IF OBJECT_ID('tempdb..#Alias_Res') IS NOT NULL
    DROP TABLE #Alias_Res;
	IF OBJECT_ID('tempdb..#Alias_Op') IS NOT NULL
    DROP TABLE #Alias_Op;
	IF OBJECT_ID('tempdb..#DI_Header') IS NOT NULL
    DROP TABLE #DI_Header;

END