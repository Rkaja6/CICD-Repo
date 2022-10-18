


CREATE VIEW [tell].[vw_AFECostItemTbls]
AS
SELECT 
		well_id
		,job_number
	  ,[afeitems_id]
      ,[line_number]
      ,[WorkoverCost] AS Cost
      ,[WorkoverCode] AS Code
	  ,'Workover' AS ExpenseCategory
	  ,[ExpenseDescription]
  FROM [dbo].[AFEItems]
  WHERE [WorkoverCost] IS NOT NULL

UNION ALL

SELECT 
	well_id
		,job_number
	,[afeitems_id]
    ,[line_number]
	,[ProductionCost] as Cost
    ,[ProductionCode] as Code
	,'Production' AS ExpenseCategory
	,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [ProductionCost] IS NOT NULL

UNION ALL

SELECT 
	well_id
	,job_number
	,[afeitems_id]
    ,[line_number]
      ,[NonAFECost] as Cost
      ,[NonAFECode] as Code
	  ,'NonAFE' AS ExpenseCategory
	  ,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [NonAFECost] IS NOT NULL

UNION ALL

SELECT 
	well_id
	,job_number
	,[afeitems_id]
    ,[line_number]
      ,[LOECost] as Cost
      ,[LOECode] as Code
	  ,'LOE' AS ExpenseCategory
	  ,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [LOECost] IS NOT NULL

UNION ALL

SELECT 
	well_id
	,job_number
	,[afeitems_id]
    ,[line_number]
      ,[FacilitiesCost] as Cost
      ,[FacilitiesCode] as Code
	  ,'Facilities' AS ExpenseCategory
	  ,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [FacilitiesCost] IS NOT NULL

UNION ALL

SELECT 
	well_id
	,job_number
	,[afeitems_id]
    ,[line_number]
      ,[DrillingCost] as Cost
      ,[DrillingCode] as Code
	  ,'Drilling' AS ExpenseCategory
	  ,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [DrillingCost] IS NOT NULL

UNION ALL

SELECT 
	well_id
	,job_number
	,[afeitems_id]
    ,[line_number]
      ,[CustomCost5] as Cost
	  ,[CustomCost5Code] as Code
	  ,'CustomCost5' AS ExpenseCategory
	  ,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [CustomCost5] IS NOT NULL

UNION ALL
      
SELECT 
	well_id
	,job_number
	,[afeitems_id]
    ,[line_number]
      ,[CustomCost4] as Cost
	  ,[CustomCost4Code] as Code
	  ,'Plug & Abandon' AS ExpenseCategory
	  ,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [CustomCost4] IS NOT NULL

UNION ALL

SELECT 
	well_id
	,job_number
	,[afeitems_id]
    ,[line_number]
      ,[CustomCost3] as Cost
	  ,[CustomCost3Code] as Code
	  ,'CustomCode3' AS ExpenseCategory
	  ,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [CustomCost3] IS NOT NULL

UNION ALL

SELECT 
	well_id
	,job_number
	,[afeitems_id]
    ,[line_number]
      ,[CustomCost2] as Cost
	  ,[CustomCost2Code] as Code
	  ,'CustomCost2' AS ExpenseCategory
	  ,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [CustomCost2] IS NOT NULL

UNION ALL

SELECT 
	well_id
	,job_number
	,[afeitems_id]
    ,[line_number]
      ,[CustomCost] as Cost
	  ,[CustomCostCode] as Code
	  ,'CustomCost' AS ExpenseCategory
	  ,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [CustomCost] IS NOT NULL

UNION ALL

SELECT 
	well_id
	,job_number
	,[afeitems_id]
    ,[line_number]
      ,[CompletionCost] as Cost
      ,[CompletionCode] as Code
	  ,'Completion' AS ExpenseCategory
	  ,[ExpenseDescription]
FROM [dbo].[AFEItems]
WHERE [CompletionCost] IS NOT NULL