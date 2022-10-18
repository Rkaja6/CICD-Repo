





Create view [PEL].[V_Rockcliff_Combined_Frac_Data] AS 
SELECT [WellName]
      ,[WellAPI]
	  ,MAX([StageNumber]) OVER (PARTITION BY WellAPI) AS TotalNumberOfStages
	  ,(MAX([StageBottomDepth]) OVER (PARTITION BY WellAPI) - 
		MIN([StageTopDepth]) OVER (PARTITION BY WellAPI))  AS [Completed Lateral Length]
      ,[StageNumber]
      ,[StageTopDepth]
      ,[StageBottomDepth]
      ,[NumberOfClusters]
      ,([StageBottomDepth] - [StageTopDepth]) as [Stage Length]
      ,[AvgShotDensity] as [Shot Density]
      ,[TotalShot] as [Total Holes]
      ,[MinPerfDate] as StartDate
      ,[MaxPerfDate] as EndDate
      ,COALESCE([FracGradient], [FracGradientEnd]) AS [FracGradient]
      ,[PresTreatAvg] as [Avg Treat Pressure]
      ,[PresTreatMax] as [Max Treat Pressure] 
      ,[ShutInPresFinal] as [Final ISIP]
      ,[RateSlurryAvg] as [Avg Rate]
      ,[RateSlurryMax] as [Max Rate]
	  ,[VolCleanTotal] as [Clean Volume]
      ,[VolSlurryTotal] as [Slurry Volume]
      ,[ProppantTotal]
	  ,[PropType1] as [Prop Type 1]
	  ,[PropType1Size] as [Type 1 Size]
	  ,[PropType1Amt] as [Type 1 Volume]
	  ,[PropType2] as [Prop Type 2]
	  ,[PropType2Size] as [Type 2 Size]
	  ,[PropType2Amt] as [Type 2 Volume]
	  ,[PropType3] as [Prop Type 3]
	  ,[PropType3Size] as [Type 3 Size]
	  ,[PropType3Amt] as [Type 3 Volume]
      ,[RateSlurryAvg] / [NumberOfClusters] as [Rate Per Cluster]
	  ,[VolCleanTotal] / [NumberOfClusters] as [Volume Per Cluster (bbls)]
      ,[ProppantTotal] / [NumberOfClusters] as [Proppant Per Cluster]
	  ,[RateSlurryAvg] / ([StageBottomDepth] - [StageTopDepth]) as [Rate Per Ft]
	  ,[VolCleanTotal]/ ([StageBottomDepth] - [StageTopDepth]) as [Volume Per Ft]
      ,[ProppantTotal]/ ([StageBottomDepth] - [StageTopDepth]) as [Proppant Per Ft]
	  ,SUM([VolCleanTotal]) OVER (PARTITION BY WellAPI) AS [Total Clean Volume (Well)]
      ,SUM([VolSlurryTotal]) OVER (PARTITION BY WellAPI) AS [Total Slurry Volume (Well)]
      ,SUM([ProppantTotal]) OVER (PARTITION BY WellAPI) AS [Total Proppant (Well)]
	  ,SUM([PropType1Amt]) OVER (PARTITION BY WellAPI) AS [Total Proppant Type 1 (Well)]
	  ,SUM([PropType2Amt]) OVER (PARTITION BY WellAPI) AS [Total Proppant Type 2 (Well)]
      ,SUM([PropType3Amt]) OVER (PARTITION BY WellAPI) AS [Total Proppant Type 3 (Well)]
  FROM [PEL].[V_Rockcliff_StimIntervals]