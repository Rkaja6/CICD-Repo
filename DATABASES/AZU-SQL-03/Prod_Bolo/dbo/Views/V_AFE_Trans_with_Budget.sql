




CREATE VIEW [dbo].[V_AFE_Trans_with_Budget] AS

SELECT 
	A.ACCT AS Account_Code,
	LEFT(A.ACCT,3) AS Major,
	RIGHT(A.ACCT,3) AS Minor,
	COA.Name AS Account_Name,
	CC.Cost_Center,
	CC.Cost_Center_Number,
	CC.Cost_Center_Type,
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
	EOMONTH(A.ACTIVITY_DATE) AS ACTIVITY_MONTH,
	A.Value AS Amount,
	A.Gross_Net_Flag,
	A.Actual_or_Budget_Flag,
	A.[INVOICE_DATE],
	A.[INVOICE_NO],
	A.[Vendor], 
	A.Vendor_ID,
	A.Party,
	A.AP_ACCT,
	A.Voucher, 
	A.AFE_Number,
	A.JE_Description,
	A.[DESCRIPTION],
	A.SOURCE_TABLE,
	A.AFE_Description,
	A.AFE_Status,
	A.PAY_DISP,
	A.PAID_IN_FULL_PERIOD,
	A.Transaction_ID
FROM 
	(
	select 
		ACCT,
		COMPANY,
		COST_CENTER,
		CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
		CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
		STAT1_AMT as [Value],
		'G' AS Gross_Net_Flag,
		'A' AS Actual_or_Budget_Flag,
		[INVOICE_DATE],
		[INVOICE_NO],
		[Vendor],
		Vendor_ID,
		Party,
		AP_ACCT,
		Voucher, 
		AFE_Number,
		JE_Description,
		[DESCRIPTION],
		SOURCE_TABLE,
		AFE_Description,
		AFE_Status,
		PAY_DISP,
		PAID_IN_FULL_PERIOD,
		u2_id AS Transaction_ID
	from dbo.V_TRANS T
	where COALESCE(STAT1_AMT,0) <> 0
	and COMPANY	= '651'
	AND AFE_Number is not null
	UNION ALL
	select 
		ACCT,
		COMPANY,
		COST_CENTER,
		CAST(ACCTG_PERIOD AS DATE) AS ACCTG_PERIOD,
		CAST(ACTIVITY_DATE AS DATE) AS ACTIVITY_DATE,
		AMT as [Value],
		'N' AS Gross_Net_Flag,
		'A' AS Actual_or_Budget_Flag,
		[INVOICE_DATE],
		[INVOICE_NO],
		[Vendor],
		Vendor_ID,
		Party,
		AP_ACCT,
		Voucher, 
		AFE_Number,
		JE_Description,
		[DESCRIPTION],
		SOURCE_TABLE,
		AFE_Description,
		AFE_Status,
		PAY_DISP,
		PAID_IN_FULL_PERIOD,
		u2_id AS Transaction_ID
	from dbo.V_TRANS T
	where COALESCE(AMT,0) <> 0
	and COMPANY	= '650'
	AND AFE_Number is not null
	UNION ALL
	SELECT 
		[ACCT],
		[COMPANY],
		[COST_CENTER],
		[ACCTG_PERIOD],
		[ACCTG_PERIOD] AS [ACTIVITY_DATE],
		[Value],
		CASE COMPANY
			WHEN '651' THEN 'G'
			WHEN '650' THEN 'N'
		END AS Gross_Net_Flag,
		'B' AS Actual_or_Budget_Flag,
		NULL AS [INVOICE_DATE],
		NULL AS [INVOICE_NO],
		NULL AS [Vendor],
		NULL AS Vendor_ID,
		NULL AS Party,
		NULL AS AP_ACCT,
		NULL AS Voucher, 
		[AFE_Number],
		NULL AS JE_Description,
		NULL AS [DESCRIPTION],
		NULL AS SOURCE_TABLE,
		[AFE_Description],
		AFE_Status,
		NULL AS PAY_DISP,
		NULL AS PAID_IN_FULL_PERIOD,
		NULL AS Transaction_ID
	FROM [dbo].[V_AFE_Budget]
	-- Net numbers are the same as gross numbers and on the wrong minor accounts so exclude them
	WHERE COMPANY	= '651'
	) A
LEFT JOIN [dbo].[V_Cost_Center] CC
	ON CC.[CC_UID] = A.COST_CENTER
LEFT JOIN [dbo].[COA] 
	ON COA.u2_id = A.ACCT