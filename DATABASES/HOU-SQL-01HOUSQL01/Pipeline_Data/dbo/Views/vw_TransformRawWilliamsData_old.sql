﻿CREATE VIEW [dbo].[vw_TransformRawWilliamsData_old] AS 
SELECT       (SELECT TOP 1 Column2 FROM Pipeline_Data.[dbo].[RawStagingTable] WHERE Column1 = 'TSP:' ORDER BY RowNumber) TSP,  (SELECT TOP 1 Column2 FROM Pipeline_Data.[dbo].[RawStagingTable] WHERE Column1 = 'TSP Name:' ORDER BY RowNumber) [TSP Name],  (SELECT TOP 1 Column2 FROM Pipeline_data.[dbo].[RawStagingTable] WHERE Column1 = 'Effective Gas Day:' ORDER BY RowNumber) [Effective Gas Day],  (SELECT TOP 1 Column2 FROM Pipeline_Data.[dbo].[RawStagingTable] WHERE Column1 = 'Effective Time:' ORDER BY RowNumber) [Effective Time],  (SELECT TOP 1 Column2 FROM Pipeline_Data.[dbo].[RawStagingTable] WHERE Column1 = 'Meas Basis Desc:' ORDER BY RowNumber) [Meas Basis Desc],  (SELECT TOP 1 Column4 FROM Pipeline_Data.[dbo].[RawStagingTable] WHERE Column3 = 'Cycle Desc:' ORDER BY RowNumber) [Cycle Desc],  (SELECT TOP 1 Column4 FROM Pipeline_Data.[dbo].[RawStagingTable] WHERE Column3 = 'Posting Date:' ORDER BY RowNumber) [Posting Date],  (SELECT TOP 1 Column4 FROM Pipeline_Data.[dbo].[RawStagingTable] WHERE Column3 = 'Posting Time:' ORDER BY RowNumber) [Posting Time],  (SELECT TOP 1 RIGHT(Column1, LEN(Column1) - CHARINDEX(':', Column1) - 1) FROM Pipeline_Data.[dbo].[RawStagingTable] WHERE Column1 LIKE 'Loc/QTI Desc:%' ORDER BY RowNumber) [Loc QTI Desc],  [Column1][Loc]      ,[Column2][Loc Pur Desc]      ,[Column3][Flow Ind]      ,[Column5][Loc Name]      ,[Column6][Loc Zn]      ,[Column7][Design Capacity]      ,[Column8][Operating Capacity]      ,[Column9][Total Scheduled Quantity]      ,[Column10][Operationally Available Capacity]      ,[Column11][IT Indicator]      ,[Column12][All Qty Avail]      ,[Column13][Qty Reason]  FROM Pipeline_Data.[dbo].[RawStagingTable]  WHERE Column2 IN ('Delivery Location','Receipt Location','Storage Area') AND ISNuMERIC(Column1) = 1