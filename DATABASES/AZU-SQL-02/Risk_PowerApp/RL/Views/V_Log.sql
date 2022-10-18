Create view RL.V_Log
AS
SELECT [RequisitionID]
      ,[ScopeOfWork]
      ,[PotentialVendors]
      ,[StartDateEst]
      ,[EndDateEst]
      ,[DurationEst]
      ,[ContractValueEst]
      ,[Note]
      ,[MajorFabricationConstructionFlag]
      ,[MinorFabricationConstructionFlag]
      ,[HeavyLiftFlag]
      ,[HazmatFlag]
      ,[MarineFlag]
      ,[AviationFlag]
      ,[PurchaseFlag]
      ,[SpecialConstructionFlag]
      ,[EngConsultFlag]
      ,[ConfidentialityFlag]
      ,[BudgetedFlag]
      ,[NewAgreementFlag]
      ,[StatusName]
      ,[WorkLocationName]
      ,[ContractOwnerName]
      ,[SiteProjectName]
      ,[DisciplineName]
      ,[AgreementTypeName]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ClosedDate]
      ,[ClosedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [RL].[Log] L
  LEFT JOIN [RL].[Lst_AgreementType] A
	ON L.[AgreementTypeID] = A.[AgreementTypeID]
  LEFT JOIN [RL].[Lst_ContractOwner] O
	ON L.[ContractOwnerID] = O.[ContractOwnerID]
  LEFT JOIN [RL].[Lst_Discipline] D
	ON L.[DisciplineID] = D.[DisciplineID]
  LEFT JOIN [RL].[Lst_SiteProject] P
	ON L.[SiteProjectID] = P.[SiteProjectID]
  LEFT JOIN [RL].[Lst_WorkLocation] W
	ON L.[WorkLocationID] = W.[WorkLocationID]
  LEFT JOIN [RL].[Lst_Status] S
	ON L.[StatusID] = S.[StatusID]