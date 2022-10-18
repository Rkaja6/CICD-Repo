
create view [PEL].[V_Rockcliff_StimPerf_Depths_Tableau]
as
SELECT distinct [WellID]
      ,[WellName]
      ,[WellAPI]
	  ,'STIM' AS TableName
      ,[StimIntID] as IDREC
      ,[StageTopDepth] as TopDepth
	  ,[StageBottomDepth] as BottomDepth
	  ,[StageBottomDepth] - [StageTopDepth] as StimLength
      ,[StageNumber] AS [IntervalNumber]
	  ,[StageNumber] 
	  ,NULL as ClusterNumber
FROM [PEL].[V_Rockcliff_StimIntervals]
where [StimIntID] is not null
UNION ALL
SELECT DISTINCT [WellID]
      ,[WellName]
      ,[WellAPI]
	  ,'PERF' AS TableName
	  ,PerfID as IDREC
	  ,[PerfTopDepth] as TopDepth
	  ,PerfBottomDepth as BottomDepth
	  ,PerfBottomDepth - [PerfTopDepth] as StimLength
      ,[PerfIntervalNumber] + (ClusterNumber / 10) AS [IntervalNumber]
	  ,[PerfIntervalNumber]
	  ,ClusterNumber
FROM [PEL].[V_Rockcliff_Perforations]
where PerfID is not null