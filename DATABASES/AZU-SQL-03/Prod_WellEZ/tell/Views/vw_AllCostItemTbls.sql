
CREATE VIEW [tell].[vw_AllCostItemTbls]
AS

SELECT [completioncostitem_id]
      ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'Completion' as ExpenseCategory
      ,[Cost]
  FROM [Prod_WellEZ].[dbo].[CompletionCostItem]

UNION ALL

SELECT custom1costitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'Custom1' as ExpenseCategory
      ,[Cost]
  FROM [dbo].[Custom1CostItem] AS Custom1

UNION ALL

SELECT custom2costitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'Custom2' as ExpenseCategory
      ,[Cost]
  FROM [dbo].[Custom2CostItem] AS Custom2

UNION ALL

SELECT custom3costitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	 ,'Custom3' as ExpenseCategory
      ,[Cost]
  FROM [dbo].[Custom3CostItem] AS Custom3

UNION ALL

SELECT custom4costitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'Plug & Abandon' as ExpenseCategory
      ,[Cost]
  FROM [dbo].[Custom4CostItem] AS PlugAbandon

UNION ALL

SELECT custom5costitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'Custom5' as ExpenseCategory
      ,[Cost]
  FROM [dbo].[Custom5CostItem] AS Custom5

UNION ALL

SELECT drillingcostitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'Drilling' as ExpenseCategory
      ,[Cost]
  FROM [dbo].[DrillingCostItem] As Drilling

UNION ALL

SELECT facilitiescostitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'Facilities' as ExpenseCategory
      ,[Cost]
  FROM [dbo].FacilitiesCostItem

UNION ALL

SELECT loecostitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'LOE' as ExpenseCategory
      ,[Cost]
  FROM [dbo].[LOECostItem]

UNION ALL

SELECT nonafecostitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'NonAFE' as ExpenseCategory
      ,[Cost]
  FROM [dbo].NonAFECostItem

UNION ALL

SELECT productioncostitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'Production' as ExpenseCategory
      ,[Cost]
  FROM [dbo].ProductionCostItem

UNION ALL
    
SELECT workovercostitem_id
  ,[well_id]
      ,[report_Date]
      ,[line_number]
      ,[job_number]
      ,[VendorId]
      ,[reportTypeId]
      ,[Remarks]
      ,[ItemCode]
      ,[ExpenseDescription]
      ,[SubExpenseDescription]
	  ,'Workover' as ExpenseCategory
      ,[Cost]
  FROM [dbo].WorkoverCostItem