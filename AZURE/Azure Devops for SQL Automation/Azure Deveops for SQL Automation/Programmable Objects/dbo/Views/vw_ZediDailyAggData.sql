IF OBJECT_ID('[dbo].[vw_ZediDailyAggData]') IS NOT NULL
	DROP VIEW [dbo].[vw_ZediDailyAggData];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


  CREATE View [dbo].[vw_ZediDailyAggData] as
  SELECT [location_id]
      ,[location]
      ,[dbo].[ufn_ConvertUTCToCT](starttime) AS starttime
      ,[dbo].[ufn_ConvertUTCToCT](endtime) AS endtime
      ,[sensor]
      ,[sensor_id]
      ,[unit]
      ,[amount]
      ,[qtrtype]
  FROM [ZediDataQTR]
GO
