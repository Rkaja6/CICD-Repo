

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
