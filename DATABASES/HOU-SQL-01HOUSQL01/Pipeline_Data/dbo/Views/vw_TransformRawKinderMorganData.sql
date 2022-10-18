



CREATE VIEW [dbo].[vw_TransformRawKinderMorganData] AS
SELECT 
	  (SELECT TOP 1 RTRIM(LTRIM(Column2)) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RTRIM(LTRIM(Column3)) = 'Eff Gas Day' ORDER BY RowNumber)[TSP]
      ,(SELECT TOP 1 RTRIM(LTRIM(Column2)) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RTRIM(LTRIM(Column3)) = 'TSP' ORDER BY RowNumber)[TSP Name]
      ,(SELECT TOP 1 CONVERT(VARCHAR, CONVERT(DATE, Column1)) FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RowNumber = 1)[Eff Gas Day Eff Time]
      ,'INTRADAY 3' AS [CycleDesc]
      ,'Delivery Location' [Loc Purp Desc]
      ,'Million BTU''s (displayed as Dth)' [Meas Basis Desc]
      ,(SELECT TOP 1 Column1 FROM [Pipeline_Data].[dbo].[RawStagingTable] WHERE RowNumber = 1)[Post Date Post Time]
      ,'Delivery points(s) quantity' [Loc QTI Desc]
      ,[Column2][Loc]
      ,[Column3][Loc Name]
      ,[Column4][Loc Zn]
      ,[Column5][Loc (Segment)]
      ,[Column6][Design Capacity]
      ,[Column7][Operating Capacity]
      ,[Column8][Total Scheduled Quantity]
      ,[Column9][Operationally Available Capacity]
      ,[Column10][IT]
      ,[Column11][Flow Ind]
      ,[Column12][All Qty Avail]
      ,[Column13][Qty Reason]
  FROM [Pipeline_Data].[dbo].[RawStagingTable]
  WHERE Column12 IN ('Y','N') AND ISNuMERIC(Column2) = 1