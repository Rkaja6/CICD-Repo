﻿
CREATE PROCEDURE [dbo].[ProcessDominionData_manualinsert] AS
INSERT INTO [Pipeline_Data].[dbo].[rawDominionOperationalCapacity]
(
		[Posting Date]
      ,[Posting Time]
      ,[TSP]
      ,[TSP Name]
      ,[CycleDesc]
      ,[Eff Gas Day]
      ,[Eff Time]
      ,[Meas Basis Desc]
      ,[Loc Purp Desc]
      ,[Loc QTI Desc]
      ,[Interconnect Party Name]
      ,[OIA]
      ,[Loc]
      ,[Loc Name]
      ,[Operating Capacity]
      ,[Total Scheduled Qty]
      ,[Operationally Available Capacity]
      ,[Design Capacity]
      ,[All Quantities Available Indicator]
      ,[Quantity Not Available Reason]
      ,[Flow Ind]
      ,[IT]
      ,[Column 22]
)
SELECT 
		[Column1][Posting Date]
      ,[Column2][Posting Time]
      ,[Column3][TSP]
      ,[Column4][TSP Name]
      ,[Column5][CycleDesc]
      ,[Column6][Eff Gas Day]
      ,[Column7][Eff Time]
      ,[Column8][Meas Basis Desc]
      ,[Column9][Loc Purp Desc]
      ,[Column10][Loc QTI Desc]
      ,[Column11][Interconnect Party Name]
      ,[Column12][OIA]
      ,[Column13][Loc]
      ,[Column14][Loc Name]
      ,[Column15][Operating Capacity]
      ,[Column16][Total Scheduled Qty]
      ,[Column17][Operationally Available Capacity]
      ,[Column18][Design Capacity]
      ,[Column19][All Quantities Available Indicator]
      ,[Column20][Quantity Not Available Reason]
      ,[Column21][Flow Ind]
      ,[Column22][IT]
      ,[Column23][Column 22]
  FROM [Pipeline_Data].[dbo].[RawStagingTable]
  WHERE ISNUMERIC(Column3) = 1