IF OBJECT_ID('[dbo].[vw_ZediRawData]') IS NOT NULL
	DROP VIEW [dbo].[vw_ZediRawData];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

Create View [dbo].[vw_ZediRawData] as
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

GO
