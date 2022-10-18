

CREATE VIEW [dbo].[V_GL_Trans] AS

SELECT 
	H.Hierarchy_Name,
	H.Row_Order,
	H.Row_Group,
	CASE H.Row_Heading 
		WHEN '~ACCT.NAME' THEN COA.NAME
		ELSE H.Row_Heading
	END AS Row_Heading,
	H.Row_Group_Heading,
	H.Budget_Category,
	A.ACCT AS Account_Code,
	LEFT(A.ACCT,3) AS Major,
	RIGHT(A.ACCT,3) AS Minor,
	COA.Name AS Account_Name,
	CC.Cost_Center,
	CC.Cost_Center_Number,
	CC.Cost_Center_Type,
	CC.Acquisition,
	CC.State,
	CC.County,
	CC.District,
	CC.Area,
	CC.Field,
	CC.Operator,
	Case when [Operator] <> 'TELLURIAN OPERATING LLC' then 'N'
	  else 'O'
	END AS Operated_Property_Flag,
	CC.WellName,
	CC.API_Well_No,
	A.ACCTG_PERIOD,
	A.ACTIVITY_DATE,
	EOMONTH(A.ACTIVITY_DATE) AS Activity_Month,
	A.Type AS Transaction_Type,
	CASE WHEN H.Row_Group in (1,2,4) 
	THEN -A.Value
	ELSE A.Value
	END as Transaction_Value,
	A.Gross_Net_Flag,
	A.[INVOICE_DATE],
	A.[INVOICE_NO],
	A.[Vendor], 
	A.Party,
	A.AP_ACCT,
	A.Voucher, 
	A.AFE_Number,
	A.AFE_Description,
	A.AFE_Status,
	A.JE_Description,
	A.[DESCRIPTION],
	A.SOURCE_TABLE
FROM 
	(
	select 
		ACCT,
		COMPANY,
		COST_CENTER,
		CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
		CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
		'Amounts' AS TYPE,
		STAT1_AMT as [Value],
		'G' AS Gross_Net_Flag,
		[INVOICE_DATE],
		[INVOICE_NO],
		[Vendor],
		Party,
		AP_ACCT,
		Voucher, 
		AFE_Number,
		AFE_Description,
		AFE_Status,
		JE_Description,
		[DESCRIPTION],
		SOURCE_TABLE
	from dbo.V_TRANS T
	where COALESCE(STAT1_AMT,0) <> 0
	and COMPANY	= '651'
	UNION ALL
	select 
		ACCT,
		COMPANY,
		COST_CENTER,
		CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
		CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
		'Volumes' AS TYPE,
		STAT1_QTY1 as [Value],
		'G' AS Gross_Net_Flag,
		[INVOICE_DATE],
		[INVOICE_NO],
		[Vendor],
		Party,
		AP_ACCT,
		Voucher, 
		AFE_Number,
		AFE_Description,
		AFE_Status,
		JE_Description,
		[DESCRIPTION],
		SOURCE_TABLE
	from dbo.V_TRANS T
	where COALESCE(STAT1_QTY1,0) <> 0
	and COMPANY	= '651'
	UNION ALL
	select 
		ACCT,
		COMPANY,
		COST_CENTER,
		CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
		CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
		'Amounts' AS TYPE,
		AMT as [Value],
		'N' AS Gross_Net_Flag,
		[INVOICE_DATE],
		[INVOICE_NO],
		[Vendor],
		Party,
		AP_ACCT,
		Voucher, 
		AFE_Number,
		AFE_Description,
		AFE_Status,
		JE_Description,
		[DESCRIPTION],
		SOURCE_TABLE
	from dbo.V_TRANS T
	where COALESCE(AMT,0) <> 0
	and COMPANY	= '650'
	UNION ALL
	select 
		ACCT,
		COMPANY,
		COST_CENTER,
		CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
		CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
		'Volumes' AS TYPE,
		QTY1 as [Value],
		'N' AS Gross_Net_Flag,
		[INVOICE_DATE],
		[INVOICE_NO],
		[Vendor],
		Party,
		AP_ACCT,
		Voucher, 
		AFE_Number,
		AFE_Description,
		AFE_Status,
		JE_Description,
		[DESCRIPTION],
		SOURCE_TABLE
	from dbo.V_TRANS T
	where COALESCE(QTY1,0) <> 0
	and COMPANY	= '650'
-- exception for Gross Volume/Revenue accruals
	UNION ALL
	select 
		ACCT,
		COMPANY,
		COST_CENTER,
		CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
		CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
		'Amounts' AS TYPE,
		AMT as [Value],
		'G' AS Gross_Net_Flag,
		[INVOICE_DATE],
		[INVOICE_NO],
		[Vendor],
		Party,
		AP_ACCT,
		Voucher, 
		AFE_Number,
		AFE_Description,
		AFE_Status,
		JE_Description,
		[DESCRIPTION],
		SOURCE_TABLE
	from dbo.V_TRANS T
	where COALESCE(AMT,0) <> 0
	and COMPANY	= '650'
	and ACCT in ('420..888','420..889')
	and RIGHT([DESCRIPTION],5) = 'GROSS'
	UNION ALL
	select 
		ACCT,
		COMPANY,
		COST_CENTER,
		CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
		CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
		'Volumes' AS TYPE,
		QTY1 as [Value],
		'G' AS Gross_Net_Flag,
		[INVOICE_DATE],
		[INVOICE_NO],
		[Vendor],
		Party,
		AP_ACCT,
		Voucher, 
		AFE_Number,
		AFE_Description,
		AFE_Status,
		JE_Description,
		[DESCRIPTION],
		SOURCE_TABLE
	from dbo.V_TRANS T
	where COALESCE(QTY1,0) <> 0
	and ACCT in ('420..888','420..889')
	and RIGHT([DESCRIPTION],5) = 'GROSS'
	and COMPANY	= '650'
	) A
INNER JOIN dbo.[_TELL_Hierarchy_COA] H
	ON A.ACCT = H.ACCT
	AND A.TYPE = H.TYPE
	AND A.Gross_Net_Flag = H.Gross_Net_Flag
LEFT JOIN dbo.[V_Cost_Center] CC
	ON CC.[CC_UID] = A.COST_CENTER
LEFT JOIN dbo.[COA] 
	ON COA.u2_id = A.ACCT