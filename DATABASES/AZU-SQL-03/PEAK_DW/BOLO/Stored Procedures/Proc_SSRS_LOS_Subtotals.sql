


CREATE PROCEDURE [BOLO].[Proc_SSRS_LOS_Subtotals]
	-- Add the parameters for the stored procedure here
	@StartDate Date,
	@EndDate Date,
	@CostCenter varchar(21),
	@LastAcctgPeriod Date,
	@DateType varchar(1),
	@OperatedFlag varchar(50),
	@GrossNetFlag varchar(1)
AS


BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/***
	DECLARE
	@StartDate Date,
	@EndDate Date,
	@CostCenter varchar(21),
	@LastAcctgPeriod Date,
	@DateType varchar(1),
	@OperatedFlag varchar(50),
	@GrossNetFlag varchar(1)

	SELECT
	@StartDate = '1/1/2018',
	@EndDate = '1/1/2019',
	@CostCenter = 'Default',
	@LastAcctgPeriod = '1/31/2019',
	@DateType = 'O',
	@GrossNetFlag = 'G',
	@OperatedFlag = 'O,N';
	***/

    -- Insert statements for procedure here
	IF OBJECT_ID(N'tempdb..#CostCenter') IS NOT NULL
	DROP TABLE #CostCenter;

	IF OBJECT_ID(N'tempdb..#Trans') IS NOT NULL
	DROP TABLE #Trans;
	
	IF OBJECT_ID(N'tempdb..#GL') IS NOT NULL
	DROP TABLE #GL;

	CREATE TABLE #CostCenter
		(
		CC_UID varchar(255),
		Cost_Center varchar(482),
		Cost_Center_Number varchar(21),
		Cost_Center_Type varchar(4),
		State varchar(2),
		County varchar(30),
		District varchar(49),
		District_Number int,
		Area varchar(33),
		Area_Number int,
		Field varchar(34),
		Field_Number int,
		Prospect varchar(68),
		Prospect_Number int,
		Operator varchar(35),
		OperatedStatus varchar(1),
		API_WELL_NO varchar(18),
		LAST_STATUS varchar(5),
		WellName varchar(89)
		);

	CREATE TABLE #Trans
		(ACCT varchar(16),
        COMPANY varchar(4),
        COST_CENTER varchar(7),
        VOUCHER varchar(22),
		SOURCE_TABLE varchar(12),
		PROJECT varchar(28),
		ACCTG_PERIOD date,
		ACTIVITY_DATE date,
		TYPE varchar(20),
		Value numeric(19,2),
		Hierarchy_Name varchar(20)
		);
	
	CREATE TABLE #GL
		(
		Row_Order int,
		Row_Group int,
		Row_Heading varchar(50),
		Row_Group_Heading varchar(50),
		Account_Code varchar(16),
		Major varchar(3),
		Minor varchar(3),
		Account_Name varchar(50),
        COMPANY varchar(4),
        COST_CENTER varchar(7),
        VOUCHER varchar(22),
		SOURCE_TABLE varchar(12),
		PROJECT varchar(28),
		ACCTG_PERIOD date,
		ACTIVITY_DATE date,
		ACTIVITY_MONTH date,
		Transaction_Type varchar(20),
		Transaction_Value numeric(19,2)
		);

	-- First, filter by Cost Center and populate #CostCenter
	IF @CostCenter = 'Default'
	BEGIN
		INSERT INTO #CostCenter
		SELECT
			CC_UID
		  ,Cost_Center
		  ,Cost_Center_Number
		  ,Cost_Center_Type
		  ,State
		  ,County
		  ,District
		  ,District_Number
		  ,Area
		  ,Area_Number
		  ,Field
		  ,Field_Number
		  ,Prospect
		  ,Prospect_Number
		  ,Operator
		  ,CASE WHEN Operator = 'TELLURIAN OPERATING LLC'
		  THEN 'O'
		  ELSE 'N'
		  END AS OperatedStatus
		  ,API_WELL_NO
		  ,LAST_STATUS
		  ,WellName
		FROM BOLO.Cost_Center
	END

	ELSE
	BEGIN
		INSERT INTO #CostCenter
		SELECT
			CC_UID
		  ,Cost_Center
		  ,Cost_Center_Number
		  ,Cost_Center_Type
		  ,State
		  ,County
		  ,District
		  ,District_Number
		  ,Area
		  ,Area_Number
		  ,Field
		  ,Field_Number
		  ,Prospect
		  ,Prospect_Number
		  ,Operator
		  ,CASE WHEN Operator = 'TELLURIAN OPERATING LLC'
		  THEN 'O'
		  ELSE 'N'
		  END AS OperatedStatus
		  ,API_WELL_NO
		  ,LAST_STATUS
		  ,WellName
		FROM BOLO.Cost_Center
		WHERE Cost_Center_Number = @CostCenter
	END

	-- Next, join to Transactions and filter by everything except for date, populate #Trans
	IF @GrossNetFlag = 'G' 
	BEGIN
		INSERT INTO #Trans
		SELECT
			ACCT,
			COMPANY,
			T.COST_CENTER,
			VOUCHER,
			SOURCE_TABLE,
			PROJECT,
			CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
			CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
			'Amounts' AS TYPE,
			STAT1_AMT as [Value],
			'GROSS LOS' as Hierarchy_Name
		from bolo.TRANS T
		INNER JOIN #CostCenter C
			ON T.COST_CENTER = C.CC_UID
		where COALESCE(STAT1_AMT,0) <> 0
		and COMPANY	= '651'
		AND SOURCE_TABLE NOT IN ('TRANS','GL.DET')
		AND ACCTG_PERIOD <= @LastAcctgPeriod
		AND C.OperatedStatus IN (Select Value from ETL.fn_SplitString(@OperatedFlag,','))
		UNION ALL
		select 
			ACCT,
			COMPANY,
			T.COST_CENTER,
			VOUCHER,
			SOURCE_TABLE,
			PROJECT,
			CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
			CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
			'Volumes' AS TYPE,
			STAT1_QTY1 as [Value],
			'GROSS LOS' as Hierarchy_Name
		from bolo.TRANS T
		INNER JOIN #CostCenter C
			ON T.COST_CENTER = C.CC_UID
		where COALESCE(STAT1_QTY1,0) <> 0
		and COMPANY	= '651'
		AND SOURCE_TABLE NOT IN ('TRANS','GL.DET')
		AND ACCTG_PERIOD <= @LastAcctgPeriod
		AND C.OperatedStatus IN (Select Value from ETL.fn_SplitString(@OperatedFlag,','))
	END

	ELSE
	BEGIN
		INSERT INTO #Trans
		SELECT
			ACCT,
			COMPANY,
			T.COST_CENTER,
			VOUCHER,
			SOURCE_TABLE,
			PROJECT,
			CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
			CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
			'Amounts' AS TYPE,
			AMT as [Value],
			'NET LOS' as Hierarchy_Name
		from bolo.V_TRANS T
		INNER JOIN #CostCenter C
			ON T.COST_CENTER = C.CC_UID
		where COALESCE(AMT,0) <> 0
		and COMPANY	= '650'
		AND SOURCE_TABLE NOT IN ('TRANS','GL.DET')
		AND ACCTG_PERIOD <= @LastAcctgPeriod
		AND C.OperatedStatus IN (Select Value from ETL.fn_SplitString(@OperatedFlag,','))
		UNION ALL
		select 
			ACCT,
			COMPANY,
			T.COST_CENTER,
			VOUCHER,
			SOURCE_TABLE,
			PROJECT,
			CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
			CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
			'Volumes' AS TYPE,
			QTY1 as [Value],
			'NET LOS' as Hierarchy_Name
		from bolo.V_TRANS T
		INNER JOIN #CostCenter C
			ON T.COST_CENTER = C.CC_UID
		where COALESCE(QTY1,0) <> 0
		and COMPANY	= '650'
		AND SOURCE_TABLE NOT IN ('TRANS','GL.DET')
		AND ACCTG_PERIOD <= @LastAcctgPeriod
		AND C.OperatedStatus IN (Select Value from ETL.fn_SplitString(@OperatedFlag,','))
	END

	-- Next, apply the date filters and join to Chart of Accounts, populate GL
	IF @DateType = 'O' 
	BEGIN
		INSERT INTO #GL
		Select 
			H.Row_Order,
			H.Row_Group,
			CASE H.Row_Heading 
				WHEN '~ACCT.NAME' THEN COA.NAME
				ELSE H.Row_Heading
			END AS Row_Heading,
			H.Row_Group_Heading,
			T.ACCT AS Account_Code,
			LEFT(T.ACCT,3) AS Major,
			RIGHT(T.ACCT,3) AS Minor,
			COA.Name AS Account_Name,
			COMPANY,
			COST_CENTER,
			VOUCHER,
			SOURCE_TABLE,
			PROJECT,
			ACCTG_PERIOD,
			ACTIVITY_DATE,
			EOMONTH([ACTIVITY_DATE],0) AS ACTIVITY_MONTH,
			T.TYPE as Transaction_Type,
			CASE WHEN H.Row_Group in (1,2,4) 
				THEN -T.Value 
				ELSE T.Value 
			END as Transaction_Value
		from #Trans T
		INNER JOIN [ETL].[Hierarchy_COA] H
			ON T.ACCT = H.ACCT
			AND T.TYPE = H.TYPE
			AND T.Hierarchy_Name = H.Hierarchy_Name
		INNER JOIN [BOLO].[COA] 
			ON COA.u2_id = T.ACCT
		WHERE EOMONTH(ACTIVITY_DATE,0) >= EOMONTH(@StartDate,0)
		AND EOMONTH(ACTIVITY_DATE,0) <= EOMONTH(@EndDate,0)
	END
	
	ELSE 	
	BEGIN
		INSERT INTO #GL
		Select 
			H.Row_Order,
			H.Row_Group,
			CASE H.Row_Heading 
				WHEN '~ACCT.NAME' THEN COA.NAME
				ELSE H.Row_Heading
			END AS Row_Heading,
			H.Row_Group_Heading,
			T.ACCT AS Account_Code,
			LEFT(T.ACCT,3) AS Major,
			RIGHT(T.ACCT,3) AS Minor,
			COA.Name AS Account_Name,
			COMPANY,
			COST_CENTER,
			VOUCHER,
			SOURCE_TABLE,
			PROJECT,
			ACCTG_PERIOD,
			ACTIVITY_DATE,
			EOMONTH([ACTIVITY_DATE],0) AS ACTIVITY_MONTH,
			T.TYPE as Transaction_Type,
			CASE WHEN H.Row_Group in (1,2,4) 
				THEN -T.Value 
				ELSE T.Value 
			END as Transaction_Value
		from #Trans T
		INNER JOIN [ETL].[Hierarchy_COA] H
			ON T.ACCT = H.ACCT
			AND T.TYPE = H.TYPE
			AND T.Hierarchy_Name = H.Hierarchy_Name
		INNER JOIN [BOLO].[COA] 
			ON COA.u2_id = T.ACCT
		WHERE EOMONTH(ACCTG_PERIOD,0) >= EOMONTH(@StartDate,0)
		AND EOMONTH(ACCTG_PERIOD,0) <= EOMONTH(@EndDate,0)
	END;

	-- Next, create the subtotals. This is the main query

	SELECT 
		COST_CENTER,
		Acctg_Period,
		ACTIVITY_MONTH, 
		PROJECT,
		COALESCE([GAS SALES_V],0) AS [GAS SALES_V],
		COALESCE([GAS SALES_A],0) AS [GAS SALES_A],
		COALESCE([OIL AND CONDENSATE SALES_V],0) AS [OIL AND CONDENSATE SALES_V],
		COALESCE([OIL AND CONDENSATE SALES_A],0) AS [OIL AND CONDENSATE SALES_A],
		COALESCE([OTHER REVENUE_A],0) AS [OTHER REVENUE_A],
		COALESCE([REVENUE DEDUCTIONS_A],0) AS [REVENUE DEDUCTIONS_A],
		COALESCE([RECURRING LOE_A],0) AS [RECURRING LOE_A],
		COALESCE([NON RECURRING LOE_A],0) AS [NON RECURRING LOE_A],
		COALESCE([OTHER EXPENSES_A],0) AS [OTHER EXPENSES_A] ,
		COALESCE([ACQUISITION COSTS_A],0) AS [ACQUISITION COSTS_A],
		COALESCE([LEASEHOLD COSTS_A],0) AS [LEASEHOLD COSTS_A],
		COALESCE([CAPITAL EXPENDITURES_A],0) AS [CAPITAL EXPENDITURES_A]
	FROM
		(
		SELECT 
			COST_CENTER,
			Acctg_Period,
			ACTIVITY_MONTH, 
			PROJECT,
			Row_Group_Heading  + '_' + LEFT(Transaction_Type,1) AS Col_Heading,
			Transaction_Value
		FROM #GL
		) A
	PIVOT 
		(
		SUM(Transaction_Value)
		FOR Col_Heading in 
			(
			[GAS SALES_V],
			[GAS SALES_A],
			[OIL AND CONDENSATE SALES_V],
			[OIL AND CONDENSATE SALES_A],
			[OTHER REVENUE_A],
			[REVENUE DEDUCTIONS_A],
			[RECURRING LOE_A],
			[NON RECURRING LOE_A],
			[OTHER EXPENSES_A],
			[ACQUISITION COSTS_A],
			[LEASEHOLD COSTS_A],
			[CAPITAL EXPENDITURES_A]
			)
		) AA;

	IF OBJECT_ID(N'tempdb..#CostCenter') IS NOT NULL
	DROP TABLE #CostCenter;

	IF OBJECT_ID(N'tempdb..#Trans') IS NOT NULL
	DROP TABLE #Trans;
	
	IF OBJECT_ID(N'tempdb..#GL') IS NOT NULL
	DROP TABLE #GL;

END