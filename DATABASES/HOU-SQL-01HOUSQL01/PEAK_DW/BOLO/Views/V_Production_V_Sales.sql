﻿

Create view [BOLO].[V_Production_V_Sales]
AS

SELECT [Date]
      ,[API]
      ,[Cost Center]
      ,[Op or Nonop]
      ,[Bolo Gas Sales]
      ,[Alloc Gas Production]
      ,[ProdView Gas Sales]
      ,[Fuel Gas]
      ,[Cost Center Number]
      ,[County]
      ,[District]
      ,[Area]
      ,[Field]
      ,[Operator]
      ,[WorkingInterest]
      ,[Gas_NRI]
      ,[Producing_Method]
      ,[ARIES_Propnum]
      ,[Downtime_Type]
      ,[Downtime_Code]
      ,[Downtime_Duration]
  FROM [ETL].[ProdVSales]