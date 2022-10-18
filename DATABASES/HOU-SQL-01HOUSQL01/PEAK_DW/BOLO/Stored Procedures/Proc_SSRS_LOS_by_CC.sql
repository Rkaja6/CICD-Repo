






CREATE PROCEDURE [BOLO].[Proc_SSRS_LOS_by_CC]
	-- Add the parameters for the stored procedure here
	@StartDate Date,
	@EndDate Date,
	@LastAcctgPeriod Date,
	@DateType varchar(1),
	@OperatedFlag varchar(50),
	@GrossNetFlag varchar(1),
	@RowGroup int,
	@RowHeading varchar(50)

AS


BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/***
	DECLARE
	@StartDate Date,
	@EndDate Date,
	@LastAcctgPeriod Date,
	@DateType varchar(1),
	@OperatedFlag varchar(50),
	@GrossNetFlag varchar(1),
	@RowGroup int,
	@RowHeading varchar(50)

	SELECT
	@StartDate = '1/1/2018',
	@EndDate = '1/1/2019',
	@LastAcctgPeriod = '1/31/2019',
	@DateType = 'O',
	@GrossNetFlag = 'G',
	@OperatedFlag = 'O,N',
	@RowGroup = 1,
	@RowHeading = 'Gas Volume (MCF)';
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

	-- First, populate #CostCenter
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

	-- Finally, run the main query:
	
	SELECT
		C.[Cost_Center]
		  ,C.[Cost_Center_Number]
		  ,C.[Cost_Center_Type]
		  ,C.[State]
		  ,C.[County]
		  ,C.[District]
		  ,C.[Area]
		  ,C.[Field]
		  ,C.[Operator]
		  ,C.OperatedStatus
		  ,C.[WellName]
		  ,C.[API_Well_No]
		  ,Acctg_Period
		  ,Activity_Month
		  ,Project AS AFE_Number
		  ,Transaction_Type
		  ,[Transaction_Value]
	FROM	
		(
		SELECT
			COST_CENTER,
			PROJECT,
			ACCTG_PERIOD,
			ACTIVITY_MONTH,
			Transaction_Type,
			SUM(Transaction_Value) AS Transaction_Value
		FROM #GL G
		WHERE G.Row_Heading = @RowHeading
			AND G.Row_Group = @RowGroup
		GROUP BY
			COST_CENTER,
			PROJECT,
			ACCTG_PERIOD,
			ACTIVITY_MONTH,
			Transaction_Type
		UNION ALL
		-- Subtotals
		SELECT
			COST_CENTER,
			PROJECT,
			ACCTG_PERIOD,
			ACTIVITY_MONTH,
			Transaction_Type,
			SUM(Transaction_Value) AS Transaction_Value 
		FROM #GL G
		WHERE 'TOTAL' = @RowHeading
			AND G.Row_Group = @RowGroup
		GROUP BY 
			COST_CENTER,
			PROJECT,
			ACCTG_PERIOD,
			ACTIVITY_MONTH,
			Transaction_Type
		) A
	LEFT JOIN #CostCenter C
		ON A.COST_CENTER = C.CC_UID
	WHERE Transaction_Value IS NOT NULL

	;
	IF OBJECT_ID(N'tempdb..#CostCenter') IS NOT NULL
	DROP TABLE #CostCenter;

	IF OBJECT_ID(N'tempdb..#Trans') IS NOT NULL
	DROP TABLE #Trans;
	
	IF OBJECT_ID(N'tempdb..#GL') IS NOT NULL
	DROP TABLE #GL;

END