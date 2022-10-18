






CREATE VIEW [BOLO].[V_GROSS_LOS] AS



WITH LOS_SUM AS
(
SELECT 
	[Cost_Center],
	Cost_Center_Number,
	[Cost_Center_Type],
	[State],
	[County],
	[District],
	[Area],
	[Field],
	[Operator],
	[Operated_Property_Flag],
	[WellName],
	[API_Well_No],
	Acctg_Period,
	Activity_Date,
	Activity_Month,
	Gross_Net_Flag,
	AFE_Number,
	COALESCE([GAS SALES_V],0) AS [GAS SALES_V],
	COALESCE([GAS SALES_A],0) AS [GAS SALES_A],
	COALESCE([OIL AND CONDENSATE SALES_V],0) AS [OIL AND CONDENSATE SALES_V],
	COALESCE([OIL AND CONDENSATE SALES_A],0) AS [OIL AND CONDENSATE SALES_A],
	COALESCE([OTHER REVENUE_A],0) AS [OTHER REVENUE_A],
	COALESCE([REVENUE DEDUCTIONS_A],0) AS [REVENUE DEDUCTIONS_A],
	COALESCE([LOE_A],0) AS [LOE_A],
	COALESCE([OTHER EXPENSES_A],0) AS[OTHER EXPENSES_A] ,
	COALESCE([ACQUISITION COSTS_A],0) AS [ACQUISITION COSTS_A],
	COALESCE([LEASEHOLD COSTS_A],0) AS [LEASEHOLD COSTS_A],
	COALESCE([CAPITAL EXPENDITURES_A],0) AS [CAPITAL EXPENDITURES_A]
FROM
	(
	SELECT 
		[Cost_Center],
		Cost_Center_Number,
		[Cost_Center_Type],
		[State],
		[County],
		[District],
		[Area],
		[Field],
		[Operator],
		[Operated_Property_Flag],
		[WellName],
		[API_Well_No],
		Acctg_Period,
		Activity_Date,
		EOMONTH([ACTIVITY_DATE]) AS Activity_Month,
		Gross_Net_Flag,
		AFE_Number,
		Row_Group_Heading  + '_' + LEFT(Transaction_Type,1) AS Col_Heading,
		Transaction_Value
	FROM BOLO.V_GL_Trans
	where [Hierarchy_Name] = 'GROSS LOS'
	AND [Gross_Net_Flag] = 'G'
	AND SOURCE_TABLE NOT IN ('TRANS','GL.DET')
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
		[LOE_A],
		[OTHER EXPENSES_A],
		[ACQUISITION COSTS_A],
		[LEASEHOLD COSTS_A],
		[CAPITAL EXPENDITURES_A]
		)
	) AA
)

	SELECT Row_Order
		  ,Row_Group
		  ,[Row_Heading] 
		  ,[Row_Group_Heading]
		  ,Major
		  ,Minor
		  ,Account_Code
		  ,[Cost_Center]
		  ,[Cost_Center_Number]
		  ,[Cost_Center_Type]
		  ,[State]
		  ,[County]
		  ,[District]
		  ,[Area]
		  ,[Field]
		  ,[Operator]
		  ,[Operated_Property_Flag]
		  ,[WellName]
		  ,[API_Well_No]
		  ,Acctg_Period
		  ,Activity_Date
		  ,EOMONTH([ACTIVITY_DATE]) AS Activity_Month
		  ,Gross_Net_Flag
		  ,Invoice_Date
		  ,Invoice_No
		  ,Vendor
		  ,AP_ACCT AS AP_Account_Code
		  ,Voucher
		  ,AFE_Number
		  ,Description
		  ,JE_Description
		  ,Transaction_Type
		  ,[Transaction_Value]
	FROM [BOLO].V_GL_Trans
	where [Hierarchy_Name] = 'GROSS LOS'
	AND [Gross_Net_Flag] = 'G'
	AND SOURCE_TABLE NOT IN ('TRANS','GL.DET')
	UNION ALL
	-- Total Sales Revenues
	SELECT
		0 as Row_Order,
		3 as Row_Group,
		'Sales Revenues' as Row_Heading,
		'SALES REVENUES' as Row_Group_Heading,
		NULL AS Major,
		NULL AS Minor,
		NULL AS Account_Code,
		[Cost_Center],
		Cost_Center_Number,
		[Cost_Center_Type],
		[State],
		[County],
		[District],
		[Area],
		[Field],
		[Operator],
		[Operated_Property_Flag],
		[WellName],
		[API_Well_No],
		Acctg_Period,
		Activity_Date,
		Activity_Month,
		Gross_Net_Flag,
		NULL AS Invoice_Date,
		NULL AS Invoice_No,
		NULL AS Vendor,
		NULL AS AP_Account_Code,
		NULL AS Voucher,
		AFE_Number,
		NULL AS Description,
		NULL AS JE_Description,
		'Amounts' AS Transaction_Type,
		[GAS SALES_A] + [OIL AND CONDENSATE SALES_A] AS Transaction_Value
	FROM LOS_SUM
	UNION ALL
	-- Total Revenues
	SELECT
		0 as Row_Order,
		5 as Row_Group,
		'Revenues' as Row_Heading,
		'REVENUES' as Row_Group_Heading,
		NULL AS Major,
		NULL AS Minor,
		NULL AS Account_Code,
		[Cost_Center],
		Cost_Center_Number,
		[Cost_Center_Type],
		[State],
		[County],
		[District],
		[Area],
		[Field],
		[Operator],
		[Operated_Property_Flag],
		[WellName],
		[API_Well_No],
		Acctg_Period,
		Activity_Date,
		Activity_Month,
		Gross_Net_Flag,
		NULL AS Invoice_Date,
		NULL AS Invoice_No,
		NULL AS Vendor,
		NULL AS AP_Account_Code,
		NULL AS Voucher,
		AFE_Number,
		NULL AS Description,
		NULL AS JE_Description,
		'Amounts' AS Transaction_Type,
		[GAS SALES_A] + [OIL AND CONDENSATE SALES_A] + [OTHER REVENUE_A] AS Transaction_Value
	FROM LOS_SUM
	UNION ALL
	-- Total Revenues After Deductions
	SELECT
		0 as Row_Order,
		7 as Row_Group,
		'Revenues After Deductions' as Row_Heading,
		'REVENUES AFTER DEDUCTIONS' as Row_Group_Heading,
		NULL AS Major,
		NULL AS Minor,
		NULL AS Account_Code,
		[Cost_Center],
		Cost_Center_Number,
		[Cost_Center_Type],
		[State],
		[County],
		[District],
		[Area],
		[Field],
		[Operator],
		[Operated_Property_Flag],
		[WellName],
		[API_Well_No],
		Acctg_Period,
		Activity_Date,
		Activity_Month,
		Gross_Net_Flag,
		NULL AS Invoice_Date,
		NULL AS Invoice_No,
		NULL AS Vendor,
		NULL AS AP_Account_Code,
		NULL AS Voucher,
		AFE_Number,
		NULL AS Description,
		NULL AS JE_Description,
		'Amounts' AS Transaction_Type,
		[GAS SALES_A] + [OIL AND CONDENSATE SALES_A] + [OTHER REVENUE_A] - [REVENUE DEDUCTIONS_A] AS Transaction_Value
	FROM LOS_SUM
	UNION ALL
	-- Total LOE
	--SELECT
	--	0 as Row_Order,
	--	10 as Row_Group,
	--	'Lease Operating Expenses' as Row_Heading,
	--	'LEASE OPERATING EXPENSES' as Row_Group_Heading,
	--	NULL AS Major,
	--	NULL AS Minor,
	--	NULL AS Account_Code,
	--	[Cost_Center],
	--	Cost_Center_Number,
	--	[Cost_Center_Type],
	--	[State],
	--	[County],
	--	[District],
	--	[Area],
	--	[Field],
	--	[Operator],
	--	[Operated_Property_Flag],
	--	[WellName],
	--	[API_Well_No],
	--	Acctg_Period,
	--	Activity_Date,
	--	Activity_Month,
	--	Gross_Net_Flag,
	--	NULL AS Invoice_Date,
	--	NULL AS Invoice_No,
	--	NULL AS Vendor,
	--	NULL AS AP_Account_Code,
	--	NULL AS Voucher,
	--	AFE_Number,
	--	NULL AS Description,
	--	NULL AS JE_Description,
	--	'Amounts' AS Transaction_Type,
	--	[NON LOE_A] + [LOE_A] AS Transaction_Value
	--FROM LOS_SUM
	--UNION ALL
	-- Total Net Operating Income
	SELECT
		0 as Row_Order,
		12 as Row_Group,
		'Net Operating Income (Loss)' as Row_Heading,
		'NET OPERATING INCOME (LOSS)' as Row_Group_Heading,
		NULL AS Major,
		NULL AS Minor,
		NULL AS Account_Code,
		[Cost_Center],
		Cost_Center_Number,
		[Cost_Center_Type],
		[State],
		[County],
		[District],
		[Area],
		[Field],
		[Operator],
		[Operated_Property_Flag],
		[WellName],
		[API_Well_No],
		Acctg_Period,
		Activity_Date,
		Activity_Month,
		Gross_Net_Flag,
		NULL AS Invoice_Date,
		NULL AS Invoice_No,
		NULL AS Vendor,
		NULL AS AP_Account_Code,
		NULL AS Voucher,
		AFE_Number,
		NULL AS Description,
		NULL AS JE_Description,
		'Amounts' AS Transaction_Type,
		[GAS SALES_A] + [OIL AND CONDENSATE SALES_A] + [OTHER REVENUE_A] 
		- ([LOE_A] + [OTHER EXPENSES_A] + [REVENUE DEDUCTIONS_A] ) AS Transaction_Value
	FROM LOS_SUM
	UNION ALL
	-- Total MCFE
	SELECT
		0 as Row_Order,
		16 as Row_Group,
		'MCF Equivalent Volumes' as Row_Heading,
		'MCF EQUIVALENT VOLUMES' as Row_Group_Heading,
		NULL AS Major,
		NULL AS Minor,
		NULL AS Account_Code,
		[Cost_Center],
		Cost_Center_Number,
		[Cost_Center_Type],
		[State],
		[County],
		[District],
		[Area],
		[Field],
		[Operator],
		[Operated_Property_Flag],
		[WellName],
		[API_Well_No],
		Acctg_Period,
		Activity_Date,
		Activity_Month,
		Gross_Net_Flag,
		NULL AS Invoice_Date,
		NULL AS Invoice_No,
		NULL AS Vendor,
		NULL AS AP_Account_Code,
		NULL AS Voucher,
		AFE_Number,
		NULL AS Description,
		NULL AS JE_Description,
		'Volumes' AS Transaction_Type,
		[GAS SALES_V] + ([OIL AND CONDENSATE SALES_V] * 6) AS Transaction_Value
	FROM LOS_SUM