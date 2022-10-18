




CREATE VIEW [dbo].[vw_TransformRawWilliamsData] AS
SELECT 
      (SELECT TOP 1 LTRIM(RTRIM(Column3)) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE LTRIM(RTRIM(Column1)) = 'TSP:' ORDER BY RowNumber) TSP,
	  (SELECT TOP 1 REPLACE(LTRIM(RTRIM(Column4)), '|', '') FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE LTRIM(RTRIM(Column2)) = 'TSP Name:' ORDER BY RowNumber) [TSP Name],
	  (SELECT TOP 1 LTRIM(RTRIM(Column4)) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE LTRIM(RTRIM(Column2)) = 'Effective Gas Day:' ORDER BY RowNumber) [Effective Gas Day],
	  (SELECT TOP 1 LTRIM(RTRIM(Column4)) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE LTRIM(RTRIM(Column2)) = 'Effective Time:' ORDER BY RowNumber) [Effective Time],
	  (SELECT TOP 1 LTRIM(RTRIM(Column3)) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE LTRIM(RTRIM(Column2)) = 'Meas Basis Desc:' ORDER BY RowNumber) [Meas Basis Desc],
	  (SELECT TOP 1 LTRIM(RTRIM(Column7)) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE LTRIM(RTRIM(Column5)) = 'Cycle Desc:' ORDER BY RowNumber) [Cycle Desc],
	  (SELECT TOP 1 LTRIM(RTRIM(Column8)) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE LTRIM(RTRIM(Column6)) = 'Posting Date:' ORDER BY RowNumber) [Posting Date],
	  (SELECT TOP 1 LTRIM(RTRIM(Column8)) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE LTRIM(RTRIM(Column6)) = 'Posting Time:' ORDER BY RowNumber) [Posting Time],
	  RTRIM(LTRIM((SELECT TOP 1 RIGHT(Column3, LEN(Column3) - CHARINDEX(':', Column3) - 1) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE Column3 LIKE 'Loc/QTI Desc:%' ORDER BY RowNumber))) [Loc QTI Desc],
	  RTRIM(LTRIM([Column2]))[Loc]
      ,RTRIM(LTRIM([Column4]))[Loc Pur Desc]
      ,RTRIM(LTRIM([Column6]))[Flow Ind]
      ,RTRIM(LTRIM([Column10]))[Loc Name]
      ,RTRIM(LTRIM([Column12]))[Loc Zn]
      ,RTRIM(LTRIM(REPLACE([Column14], '|', '')))[Design Capacity]
      ,RTRIM(LTRIM(REPLACE([Column16], '|', '')))[Operating Capacity]
      ,RTRIM(LTRIM(REPLACE([Column18], '|', '')))[Total Scheduled Quantity]
      ,RTRIM(LTRIM(REPLACE([Column20], '|', '')))[Operationally Available Capacity]
      ,RTRIM(LTRIM([Column22]))[IT Indicator]
      ,LTRIM(RTRIM([Column23]))+LTRIM(RTRIM([Column24]))[All Qty Avail]
      ,RTRIM(LTRIM([Column25]))[Qty Reason]
  FROM [Pipeline_Data].[dbo].[RawStagingTable]
  WHERE LTRIM(RTRIM(Column4)) IN ('Delivery Location','Receipt Location','Storage Area') AND ISNuMERIC(Column2) = 1