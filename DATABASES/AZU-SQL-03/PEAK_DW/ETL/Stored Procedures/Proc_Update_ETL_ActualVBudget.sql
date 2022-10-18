create procedure ETL.Proc_Update_ETL_ActualVBudget
AS
UPDATE [ETL].[ActualVBudget]
SET
	[Gas Sales Volumes] =  COALESCE(pvt.[Gas Volume (MCF)],0)
	,[Oil Sales Volumes] = COALESCE(pvt.[Oil Volume (BBLS)],0)
      ,[Gas Sales Revenues] = COALESCE(pvt.[Gas Revenue ($)],0)
      ,[Oil Sales Revenues] = COALESCE(pvt.[Oil Revenue ($)],0)
      ,[Processing Rev/Deducts] = 
			COALESCE(pvt.[PROCESSING FEE INCOME],0)  
			+ COALESCE(pvt.[SERVICE FEE INCOME],0)
			- COALESCE(pvt.[GAS PROCESSING FEES],0) 
			- COALESCE(pvt.[GATHERING FEES],0)  
			- COALESCE(pvt.[MARKETING FEES],0)  
			- COALESCE(pvt.[TRANSPORTATION FEES],0)  
			- COALESCE(pvt.[ACCRUED REVENUE DEDUCTIONS],0)    
      ,[Production taxes] = COALESCE(pvt.[PRODUCTION TAXES],0)
      ,[LOE - Recurring] = COALESCE(pvt.[RECURRING LOE],0)
      ,[LOE - Non Recurring] = COALESCE(pvt.[NON RECURRING LOE],0)
      ,[Expense Workover] = COALESCE(pvt.[WELL WORKOVER EXPENSES],0)
      ,[Ad valorem taxes] = COALESCE(pvt.[JIB AD VALOREM TAXES],0)
      ,[Capital expenditures] = COALESCE(pvt.[CAPITAL EXPENDITURES],0)
from
	(select 
		ACCTG_PERIOD,
		CASE Row_Group_Heading
			WHEN 'RECURRING LOE' THEN Row_Group_Heading
			WHEN 'NON RECURRING LOE' THEN Row_Group_Heading
			WHEN 'CAPITAL EXPENDITURES' THEN Row_Group_Heading
			ELSE Row_Heading
		END AS Line_Item,
		Transaction_Value
	from bolo.V_NET_LOS) A
PIVOT
	(
	SUM(Transaction_Value)
	For Line_Item in 
		(
		[TRANSPORTATION FEES],
		[Oil Volume (BBLS)],
		[PRODUCTION TAXES],
		[Gas Revenue ($)],
		[PLUG & ABANDONMENT],
		[SERVICE FEE INCOME],
		[JIB AD VALOREM TAXES],
		[NON RECURRING LOE],
		[RECURRING LOE],
		[WELL WORKOVER EXPENSES],
		[Net Operating Income (Loss)],
		[Oil Revenue ($)],
		[GAS PROCESSING FEES],
		[REVENUE DEDUCT PURCH PRICE ADJ],
		[PROCESSING FEE INCOME],
		[Revenues],
		[Lease Operating Expenses],
		[MCF Equivalent Volumes],
		[Gas Volume (MCF)],
		[GATHERING FEES],
		[Revenues After Deductions],
		[Sales Revenues],
		[ACCRUED REVENUE DEDUCTIONS],
		[MARKETING FEES],
		[CAPITAL EXPENDITURES]
		)
	) Pvt
where [Amount Type] = 'Actual'
and Date = ACCTG_PERIOD


--select distinct 
--		'[' + CASE Row_Group_Heading
--			WHEN 'RECURRING LOE' THEN Row_Group_Heading
--			WHEN 'NON RECURRING LOE' THEN Row_Group_Heading
--			WHEN 'CAPITAL EXPENDITURES' THEN Row_Group_Heading
--			ELSE Row_Heading
--		END + '],' AS Line_Item
--from bolo.V_NET_LOS