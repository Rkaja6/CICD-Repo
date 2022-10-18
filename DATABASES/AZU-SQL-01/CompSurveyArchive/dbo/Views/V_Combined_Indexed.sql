










Create view [dbo].[V_Combined_Indexed] AS

SELECT C.[Source]
      ,C.[TabName]
      ,C.[Job Title]
      ,C.[Job Code]
      ,C.[Inc]
      ,C.[Cos]
      ,COALESCE(C.[Effective Date], S.[Effective Date]) as [Effective Date]
      ,C.[Base 25th Percentile]
      ,C.[Base 50th Percentile]
      ,C.[Base 75th Percentile]
      ,C.[Base 90th Percentile]
      ,C.[Actual TC 25th Percentile]
      ,C.[Actual TC 50th Percentile]
      ,C.[Actual TC 75th Percentile]
      ,C.[Actual TC 90th Percentile]
      ,C.[Target TC 25th Percentile]
      ,C.[Target TC 50th Percentile]
      ,C.[Target TC 75th Percentile]
      ,C.[Target TC 90th Percentile]
      ,C.[LTI 25th Percentile]
      ,C.[LTI 50th Percentile]
      ,C.[LTI 75th Percentile]
      ,C.[LTI 90th Percentile]
      ,C.[Total Direct Actual 25th Percentile]
      ,C.[Total Direct Actual 50th Percentile]
      ,C.[Total Direct Actual 75th Percentile]
      ,C.[Total Direct Actual 90th Percentile]
      ,C.[Target TDC 25th Percentile]
      ,C.[Target TDC 50th Percentile]
      ,C.[Target TDC 75th Percentile]
      ,C.[Target TDC 90th Percentile]
      ,C.[Industry]
      ,C.[Corporate-Noncorporate]
      ,C.[Rev Responsibility-Location-Other]
      ,C.[Family]
      ,C.[Sub-Family]
      ,C.[Specialization]
      ,C.[Job Description]
      ,C.[Mercer Job Type]
      ,C.[AonHewitt Scope From]
      ,C.[AonHewitt Scope To]
      ,C.[AonHewitt Scope Desc]
      ,C.[AI Percentage 25th Percentile]
      ,C.[AI Percentage 50th Percentile]
      ,C.[AI Percentage 75th Percentile]
      ,C.[AI Percentage 90th Percentile]
      ,C.[LTI Percent of Base 25th Percentile]
      ,C.[LTI Percent of Base 50th Percentile]
      ,C.[LTI Percent of Base 75th Percentile]
      ,C.[LTI Percent of Base 90th Percentile]
      ,C.[Calc AI % 25th Percentile]
      ,C.[Calc AI % 50th Percentile]
      ,C.[Calc AI % 75th Percentile]
      ,C.[Calc AI % 90th Percentile]
      ,C.[Calc LTI % 25th Percentile]
      ,C.[Calc LTI % 50th Percentile]
      ,C.[Calc LTI % 75th Percentile]
      ,C.[Calc LTI % 90th Percentile]
      ,C.[CreatedDate]
	  ,C.[Job Code] + COALESCE('_' +  S.YearCode,'') + COALESCE('_' +  S.PublisherCode,'') + COALESCE('_' + S.TypeCode,'') + COALESCE('_' + S.WeightCode,'') +  COALESCE(' ' + S.OrgCode, '') + COALESCE('_' + CC.CorpCode,'') + COALESCE('_' + COALESCE(I.IndustryCode, S.IndustryCode),'') + COALESCE('_' + S.RegionCode,'') + COALESCE('_' + S.DeptCode,'') + COALESCE('_' + D.DetailCode,'') + COALESCE('_' + SS.ScopeCode,'') as [UID],
	  S.OrgCode,
	  S.YearCode,
	  S.PublisherCode,
	  S.TypeCode,
	  S.WeightCode,
	  CC.CorpCode,
	  COALESCE(I.IndustryCode, S.IndustryCode) as IndustryCode,
	  COALESCE(S.RegionCode, D.RegionCode) as RegionCode,
	  S.DeptCode,
	  D.DetailCode,
	  D.SubRegionCode,
	  D.StateCode,
	  D.CityCode,
	  SS.ScopeCode
  FROM [dbo].[Combined] C
  left join Code_Source S
  on C.Source = S.Source
  and COALESCE(C.TabName,'') = S.TabName
  Left join Code_Industry I
  on I.Industry = COALESCE(C.Industry,'')
  left join Code_Corporate CC
  on CC.[Corporate-Noncorporate] = COALESCE(C.[Corporate-Noncorporate],'')
  left join Code_Detail D
on D.[RevResponsibility-Location-Other] = COALESCE(C.[Rev Responsibility-Location-Other],'') 
	left join Code_Scope SS
	on SS.[ScopeDesc] = COALESCE(C.[AonHewitt Scope Desc],'') 
	and SS.[ScopeTo] = COALESCE(C.[AonHewitt Scope To],'') 
	and SS.[ScopeFrom] = COALESCE(C.[AonHewitt Scope From],'')