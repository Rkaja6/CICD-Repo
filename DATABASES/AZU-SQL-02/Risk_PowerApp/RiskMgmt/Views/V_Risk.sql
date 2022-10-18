












  create view [RiskMgmt].[V_Risk]
  AS
  WITH 
	CTE_Additional_People (RiskID, FullName)
		  AS
		  (
		  Select distinct
			RiskID,
			STUFF(
					(
					SELECT ', ' + P.FullName
					FROM [RiskMgmt].[Tag_Additional_People] AA
					INNER JOIN [RiskMgmt].Person P
						ON P.PersonID = AA.PersonID
					WHERE AA.RiskID = A.RiskID
					FOR XML PATH('')
					), 1, 2, ''
				) AS FullName
		  from [RiskMgmt].[Tag_Additional_People] A
		  ),
	CTE_Impact (RiskID, Impact)
		  AS
		  (
		  Select 
			RiskID,
			Impact
		  from [RiskMgmt].[History_Impact] A
		  where [EndDate] is null
		  ),
	CTE_Likelihood (RiskID, Likelihood)
		  AS
		  (
		  Select 
			RiskID,
			Likelihood
		  from [RiskMgmt].[History_Likelihood] A
		  where [EndDate] is null
		  ),
	CTE_Status (RiskID, Status)
		  AS
		  (
		  Select 
			RiskID,
			Status
		  from [RiskMgmt].[History_Status] A
		  where [EndDate] is null
		  ),
	CTE_Action (RiskID, LastAction, LastActionBy, LastActionDate, RowNum)
		  AS
		  (
		  Select 
			A.RiskID,
			COALESCE(A.ActionComment, A.ActionDesc) as LastAction,
			A.ActionBy AS LastActionBy,
			B.LastActionDate,
			ROW_NUMBER() OVER (PARTITION BY A.RiskID ORDER BY A.ActionComment DESC) AS RowNum
		  from [RiskMgmt].[History_Action] A
		  INNER JOIN 
			(
			Select
				RiskID,
				MAX(ActionDate) AS LastActionDate
			From [RiskMgmt].[History_Action] A
			GROUP BY RiskID
			) B 
		  ON A.RiskID = B.RiskID
		  AND A.ActionDate = B.LastActionDate
		  ),
	CTE_Created (RiskID, CreatedBy, CreatedDate)
		  AS
		  (
		  Select 
			A.RiskID,
			A.ActionBy AS CreatedBy,
			A.ActionDate AS CreatedDate
		  from [RiskMgmt].[History_Action] A
		  WHERE ActionDesc = 'New Risk'
		  )
	SELECT
		R.RiskID,
		R.Title,
		R.Description,
		R.Category,
		R.RiskGroup,
		R.Cost_Flag,
		R.Schedule_Flag,
		R.HSE_Flag,
		I.Impact,
		L.Likelihood,
		R.Response,
		A.LastAction,
		A.LastActionBy,
		A.LastActionDate,
		S.Status,
		R.Type,
		R.Opportunity_Flag,
		P_Owner.FullName as OwnerName,
		AP.FullName as AdditionalPeople,
		C.CreatedBy,
		C.CreatedDate,
		I.Impact * L.Likelihood AS RiskScore,
		-- for Power BI matrix column heading
		'Likelihood:' + STR(L.Likelihood) AS [Risk Matrix],
		'Impact:' + STR(I.Impact) AS [Impact Label]
	FROM RiskMgmt.Risk R
	LEFT JOIN CTE_Additional_People AP
		ON R.RiskID = AP.RiskID
	LEFT JOIN CTE_Impact I
		ON R.RiskID = I.RiskID
	LEFT JOIN CTE_Likelihood L
		ON R.RiskID = L.RiskID
	LEFT JOIN CTE_Status S
		ON R.RiskID = S.RiskID
	LEFT JOIN 
		(
		SELECT * 
		FROM CTE_Action 
		WHERE RowNum = 1
		) A
		ON R.RiskID = A.RiskID
	LEFT JOIN RiskMgmt.Person P_Owner
		ON R.Owner_PersonID = P_Owner.PersonID
	LEFT JOIN CTE_Created C
		ON C.RiskID = R.RiskID