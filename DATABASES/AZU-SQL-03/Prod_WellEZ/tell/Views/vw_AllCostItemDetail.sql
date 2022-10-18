


CREATE VIEW [tell].[vw_AllCostItemDetail]
AS
SELECT 
	W.well_id
	  ,W.WellName
	  ,W.State
	  ,W.County
	  ,W.LatitudeLocation
	  ,W.LongitudeLocation
	  ,W.AssetName
	  ,W.Area
	  ,W.FieldName
	  ,W.Lease
	  ,W.APINo
	  ,W.UserDefined_8 [Well Status]
	  ,W.UserDefined_9 [ARIES Propnum]
	  ,W.UserDefined_10 [Bolo Cost Center]
	  ,W.StatePermitNo
	  ,W.NetRevenueInterest
	  ,J.job_number
      ,J.job_status
	  ,J.jobDescription
	  ,j.WorkingInterest
	  ,j.WellEngineer
	  ,j.SubCode
	  ,j.StartDate
	  ,j.SpudDate
	  ,j.RigNumber
	  ,j.RigContractor
	  ,j.PermitNo
	  ,j.Operator
	  ,j.Objective
	  ,j.Category
	  ,j.AFENumberD AS [AFE Number]
	  ,j.AFEAmountC
	  ,j.AFEAmountCC
	  ,CI.[report_Date]
      ,CI.[line_number]
      ,CI.[completioncostitem_id]
      ,V.VendorName
	  ,CI.VendorId
      ,CI.[reportTypeId]
      ,CI.[Remarks]
      ,CI.[ItemCode]
      ,CI.[ExpenseDescription]
      ,CI.[SubExpenseDescription]
	  ,CI.ExpenseCategory
      ,CI.[Cost]
  FROM [tell].[vw_AllCostItemTbls] CI
  LEFT JOIN dbo.WellInfo W
	ON W.well_id = CI.well_id
LEFT JOIN dbo.JobDetails J
	ON J.job_number = CI.job_number
LEFT JOIN dbo.CostVendor V
	ON CI.vendorid = V.RowID
WHERE WellName not in ('Testing & Training')