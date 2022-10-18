





Create proc [stage].[usp_UpdateCombinedSTG]
AS
BEGIN

-- Truncate the Combined_STG table
	TRUNCATE TABLE dbo.Combined_STG

-- Copy into Combined_STG. AH percentages have to be converted.
INSERT INTO [dbo].[Combined_STG]	
SELECT T.[Index]
      ,T.[Source]
      ,T.[TabName]
      ,T.[Job Title]
      ,T.[Job Code]
      ,[dbo].[ufn_ConvertAmtString](T.[Inc]) AS [Inc]
      ,[dbo].[ufn_ConvertAmtString](T.[Cos]) AS [Cos]
	  ,CONVERT(varchar,T.[Effective Date],101) AS [Effective Date]
      ,[dbo].[ufn_ConvertAmtString]([Base 25th Percentile]) AS [Base 25th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Base 50th Percentile]) AS [Base 50th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Base 75th Percentile]) AS [Base 75th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Base 90th Percentile]) AS [Base 90th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Actual TC 25th Percentile]) AS [Actual TC 25th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Actual TC 50th Percentile]) AS [Actual TC 50th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Actual TC 75th Percentile]) AS [Actual TC 75th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Actual TC 90th Percentile]) AS [Actual TC 90th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Target TC 25th Percentile]) AS [Target TC 25th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Target TC 50th Percentile]) AS [Target TC 50th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Target TC 75th Percentile]) AS [Target TC 75th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Target TC 90th Percentile]) AS [Target TC 90th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([LTI 25th Percentile]) AS [LTI 25th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([LTI 50th Percentile]) AS [LTI 50th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([LTI 75th Percentile]) AS [LTI 75th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([LTI 90th Percentile]) AS [LTI 90th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Total Direct Actual 25th Percentile]) AS [Total Direct Actual 25th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Total Direct Actual 50th Percentile]) AS [Total Direct Actual 50th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Total Direct Actual 75th Percentile]) AS [Total Direct Actual 75th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Total Direct Actual 90th Percentile]) AS [Total Direct Actual 90th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Target TDC 25th Percentile]) AS [Target TDC 25th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Target TDC 50th Percentile]) AS [Target TDC 50th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Target TDC 75th Percentile]) AS [Target TDC 75th Percentile]
      ,[dbo].[ufn_ConvertAmtString]([Target TDC 90th Percentile]) AS [Target TDC 90th Percentile]
      ,[Industry]
      ,[Corporate-Noncorporate]
      ,[Rev Responsibility-Location-Other]
      ,[Family]
      ,[Sub-Family]
      ,[Specialization]
      ,[Job Description]
      ,[Mercer Job Type]
      ,[AonHewitt Scope From]
      ,[AonHewitt Scope To]
      ,[AonHewitt Scope Desc]
      ,CASE WHEN S.PublisherCode = 'AH' THEN [dbo].[ufn_ConvertPctString]([AI Percentage 25th Percentile])
		ELSE [dbo].[ufn_ConvertAmtString]([AI Percentage 25th Percentile]) END AS [AI Percentage 25th Percentile]
      ,CASE WHEN S.PublisherCode = 'AH' THEN [dbo].[ufn_ConvertPctString]([AI Percentage 50th Percentile])
		ELSE [dbo].[ufn_ConvertAmtString]([AI Percentage 50th Percentile]) END  AS [AI Percentage 50th Percentile]
      ,CASE WHEN S.PublisherCode = 'AH' THEN [dbo].[ufn_ConvertPctString]([AI Percentage 75th Percentile])
		ELSE [dbo].[ufn_ConvertAmtString]([AI Percentage 75th Percentile]) END  AS [AI Percentage 75th Percentile]
      ,CASE WHEN S.PublisherCode = 'AH' THEN [dbo].[ufn_ConvertPctString]([AI Percentage 90th Percentile])
		ELSE [dbo].[ufn_ConvertAmtString]([AI Percentage 90th Percentile]) END  AS [AI Percentage 90th Percentile]
      ,CASE WHEN S.PublisherCode = 'AH' THEN [dbo].[ufn_ConvertPctString]([LTI Percent of Base 25th Percentile])
		ELSE [dbo].[ufn_ConvertAmtString]([LTI Percent of Base 25th Percentile]) END  AS [LTI Percent of Base 25th Percentile]
      ,CASE WHEN S.PublisherCode = 'AH' THEN [dbo].[ufn_ConvertPctString]([LTI Percent of Base 50th Percentile])
		ELSE [dbo].[ufn_ConvertAmtString]([LTI Percent of Base 50th Percentile]) END  AS [LTI Percent of Base 50th Percentile]
      ,CASE WHEN S.PublisherCode = 'AH' THEN [dbo].[ufn_ConvertPctString]([LTI Percent of Base 75th Percentile])
		ELSE [dbo].[ufn_ConvertAmtString]([LTI Percent of Base 75th Percentile]) END  AS [LTI Percent of Base 75th Percentile]
      ,CASE WHEN S.PublisherCode = 'AH' THEN [dbo].[ufn_ConvertPctString]([LTI Percent of Base 90th Percentile])
		ELSE [dbo].[ufn_ConvertAmtString]([LTI Percent of Base 90th Percentile]) END  AS [LTI Percent of Base 90th Percentile]
	  ,NULL AS [Calc AI % 25th Percentile]
	  ,NULL AS [Calc AI % 50th Percentile]
	  ,NULL AS [Calc AI % 75th Percentile]
	  ,NULL AS [Calc AI % 90th Percentile]
	  ,NULL AS [Calc LTI % 25th Percentile]
	  ,NULL AS [Calc LTI % 50th Percentile]
	  ,NULL AS [Calc LTI % 75th Percentile]
	  ,NULL AS [Calc LTI % 90th Percentile]
      ,CONVERT(varchar,[CreatedDate],120) AS [CreatedDate]
  FROM [stage].[TransformData] T
	LEFT JOIN dbo.Code_Source S
		ON T.Source = S.Source
		AND T.TabName = S.TabName
  WHERE T.[Job Code] IS NOT NULL

  -- Update the calculated columns
  UPDATE dbo.Combined_STG
	SET 
		[Calc AI % 25th Percentile] = 
			CASE WHEN [AI Percentage 25th Percentile] IS NULL
			THEN (([Target TDC 25th Percentile] - [Base 50th Percentile]) / [Base 50th Percentile]) * 100
			ELSE [AI Percentage 25th Percentile] END,
		[Calc AI % 50th Percentile] = 
			CASE WHEN [AI Percentage 50th Percentile] IS NULL
			THEN (([Target TDC 50th Percentile] - [Base 50th Percentile]) / [Base 50th Percentile]) * 100
			ELSE [AI Percentage 50th Percentile] END,
		[Calc AI % 75th Percentile] = 
			CASE WHEN [AI Percentage 75th Percentile] IS NULL
			THEN (([Target TDC 75th Percentile] - [Base 50th Percentile]) / [Base 50th Percentile]) * 100
			ELSE [AI Percentage 75th Percentile] END,
		[Calc AI % 90th Percentile] = 
			CASE WHEN [AI Percentage 90th Percentile] IS NULL
			THEN (([Target TDC 90th Percentile] - [Base 50th Percentile]) / [Base 50th Percentile]) * 100
			ELSE [AI Percentage 90th Percentile] END,
		[Calc LTI % 25th Percentile] = 
			CASE WHEN [LTI Percent of Base 25th Percentile] IS NULL
			THEN (([LTI 25th Percentile] - [Base 50th Percentile]) / [Base 50th Percentile]) * 100
			ELSE [LTI Percent of Base 25th Percentile] END,
		[Calc LTI % 50th Percentile] = 
			CASE WHEN [LTI Percent of Base 50th Percentile] IS NULL
			THEN (([LTI 50th Percentile] - [Base 50th Percentile]) / [Base 50th Percentile]) * 100
			ELSE [LTI Percent of Base 50th Percentile] END,
		[Calc LTI % 75th Percentile] = 
			CASE WHEN [LTI Percent of Base 75th Percentile] IS NULL
			THEN (([LTI 75th Percentile] - [Base 50th Percentile]) / [Base 50th Percentile]) * 100
			ELSE [LTI Percent of Base 75th Percentile] END,
		[Calc LTI % 90th Percentile] = 
			CASE WHEN [LTI Percent of Base 90th Percentile] IS NULL
			THEN (([LTI 90th Percentile] - [Base 50th Percentile]) / [Base 50th Percentile]) * 100
			ELSE [LTI Percent of Base 90th Percentile] END

END