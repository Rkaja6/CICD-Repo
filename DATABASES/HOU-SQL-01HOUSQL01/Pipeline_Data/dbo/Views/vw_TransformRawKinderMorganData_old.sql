

CREATE VIEW [dbo].[vw_TransformRawKinderMorganData_old] AS
SELECT 
	  RTRIM(LTRIM((SELECT TOP 1 Column1 FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RowNumber = (SELECT TOP 1 RowNumber FROM Pipeline_Data.DBO.RawStagingTable WHERE Column1 = 'TSP' ORDER BY RowNumber) + 1)))[TSP]
      ,RTRIM(LTRIM((SELECT TOP 1 Column2 FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RowNumber = (SELECT TOP 1 RowNumber FROM Pipeline_Data.DBO.RawStagingTable WHERE Column2 = 'TSP Name' ORDER BY RowNumber) + 1)))[TSP Name]
      ,RTRIM(LTRIM((SELECT TOP 1 Column3 FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RowNumber = (SELECT TOP 1 RowNumber FROM Pipeline_Data.DBO.RawStagingTable WHERE Column3 = 'Eff Gas Day/Eff Time' ORDER BY RowNumber) + 1)))[Eff Gas Day Eff Time]
      ,RTRIM(LTRIM((SELECT TOP 1 Column4 FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RowNumber = (SELECT TOP 1 RowNumber FROM Pipeline_Data.DBO.RawStagingTable WHERE Column4 = 'CycleDesc' ORDER BY RowNumber) + 1)))[CycleDesc]
      ,RTRIM(LTRIM((SELECT TOP 1 Column5 FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RowNumber = (SELECT TOP 1 RowNumber FROM Pipeline_Data.DBO.RawStagingTable WHERE Column5 = 'Loc Purp Desc' ORDER BY RowNumber) + 1)))[Loc Purp Desc]
      ,RTRIM(LTRIM((SELECT TOP 1 Column6 FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RowNumber = (SELECT TOP 1 RowNumber FROM Pipeline_Data.DBO.RawStagingTable WHERE Column6 = 'Meas Basis Desc' ORDER BY RowNumber) + 1)))[Meas Basis Desc]
      ,RTRIM(LTRIM((SELECT TOP 1 Column7 FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RowNumber = (SELECT TOP 1 RowNumber FROM Pipeline_Data.DBO.RawStagingTable WHERE Column7 = 'Post Date/Post Time' ORDER BY RowNumber) + 1)))[Post Date Post Time]
      ,RTRIM(LTRIM((SELECT TOP 1 Column8 FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RowNumber = (SELECT TOP 1 RowNumber FROM Pipeline_Data.DBO.RawStagingTable WHERE Column8 = 'Loc/QTI Desc' ORDER BY RowNumber) + 1)))[Loc QTI Desc]
      ,RTRIM(LTRIM([Column1]))[Loc]
      ,RTRIM(LTRIM([Column2]))[Loc Name]
      ,RTRIM(LTRIM([Column3]))[Loc Zn]
      ,RTRIM(LTRIM([Column4]))[Loc (Segment)]
      ,RTRIM(LTRIM([Column5]))[Design Capacity]
      ,RTRIM(LTRIM([Column6]))[Operating Capacity]
      ,RTRIM(LTRIM([Column7]))[Total Scheduled Quantity]
      ,RTRIM(LTRIM([Column8]))[Operationally Available Capacity]
      ,RTRIM(LTRIM([Column9]))[IT]
      ,RTRIM(LTRIM([Column10]))[Flow Ind]
      ,RTRIM(LTRIM([Column11]))[All Qty Avail]
      ,RTRIM(LTRIM([Column12]))[Qty Reason]
  FROM [Pipeline_Data].[dbo].[RawStagingTable]
  WHERE Column11 IN ('Y','N') AND ISNuMERIC(Column5) = 1