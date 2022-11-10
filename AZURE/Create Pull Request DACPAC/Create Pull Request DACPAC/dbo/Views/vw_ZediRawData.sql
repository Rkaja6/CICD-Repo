
Create View vw_ZediRawData as
SELECT [location_id]
      ,[location]
      ,[dbo].[ufn_ConvertUTCToCT]([readingtime]) AS readingtime
      ,[sensor]
      ,[sensor_id]
      ,[unit]
      ,[amount]
      ,[amountstring]
      ,[amountdatetimeutc]
  FROM [dbo].[ZediData]

