CREATE VIEW tell.[vw_AFECostItem_Raw]
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
	  ,A.[afeitems_id]
      ,A.[line_number]
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
      ,[WorkoverCost]
      ,[WorkoverCode]
      ,[ProductionCost]
      ,[ProductionCode]
      ,[NonAFECost]
      ,[NonAFECode]
      ,[LOECost]
      ,[LOECode]
      ,[FacilitiesCost]
      ,[FacilitiesCode]
      ,[ExpenseDescription]
      ,[DrillingCost]
      ,[DrillingCode]
      ,[CustomCost5Code]
      ,[CustomCost5]
      ,[CustomCost4Code]
      ,[CustomCost4]
      ,[CustomCost3Code]
      ,[CustomCost3]
      ,[CustomCost2Code]
      ,[CustomCost2]
      ,[CustomCostCode]
      ,[CustomCost]
      ,[CompletionCost]
      ,[CompletionCode]
  FROM [dbo].[AFEItems] A
  LEFT JOIN dbo.WellInfo W
	ON W.well_id = A.well_id
LEFT JOIN dbo.JobDetails J
	ON J.job_number = A.job_number
WHERE W.WellName not in ('Testing & Training')