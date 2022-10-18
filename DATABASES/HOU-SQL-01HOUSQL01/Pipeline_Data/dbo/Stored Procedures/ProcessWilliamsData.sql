CREATE PROCEDURE [dbo].[ProcessWilliamsData] AS
BEGIN
MERGE
	[dbo].[rawWilliamsTranscoOperationalCapacity] DestinationTable
USING
(
	SELECT
	  [TSP]
      ,[TSP Name]
      ,[Effective Gas Day]
      ,[Effective Time]
      ,[Meas Basis Desc]
      ,[Cycle Desc]
      ,[Posting Date]
      ,[Posting Time]
      ,[Loc QTI Desc]
      ,[Loc]
      ,[Loc Pur Desc]
      ,[Flow Ind]
      ,[Loc Name]
      ,[Loc Zn]
      ,[Design Capacity]
      ,[Operating Capacity]
      ,[Total Scheduled Quantity]
      ,[Operationally Available Capacity]
      ,[IT Indicator]
      ,[All Qty Avail]
      ,[Qty Reason]
	FROM 
		[dbo].[vw_TransformRawWilliamsData]
) SourceData
ON
		SourceData.TSP = DestinationTable.TSP AND
		SourceData.[Effective Gas Day] = DestinationTable.[Effective Gas Day] AND
		SourceData.[Effective Time] = DestinationTable.[Effective Time] AND
		SourceData.Loc = DestinationTable.Loc AND
		SourceData.[FLow Ind] = DestinationTable.[FLow Ind]
WHEN MATCHED THEN UPDATE SET
		DestinationTable.[TSP] = SourceData.[TSP], 
		DestinationTable.[TSP Name] = SourceData.[TSP Name], 
		DestinationTable.[Effective Gas Day] = SourceData.[Effective Gas Day], 
		DestinationTable.[Effective Time] = SourceData.[Effective Time], 
		DestinationTable.[Meas Basis Desc] = SourceData.[Meas Basis Desc], 
		DestinationTable.[Cycle Desc] = SourceData.[Cycle Desc], 
		DestinationTable.[Posting Date] = SourceData.[Posting Date], 
		DestinationTable.[Posting Time] = SourceData.[Posting Time], 
		DestinationTable.[Loc QTI Desc] = SourceData.[Loc QTI Desc], 
		DestinationTable.[Loc] = SourceData.[Loc], 
		DestinationTable.[Loc Pur Desc] = SourceData.[Loc Pur Desc], 
		DestinationTable.[Flow Ind] = SourceData.[Flow Ind], 
		DestinationTable.[Loc Name] = SourceData.[Loc Name], 
		DestinationTable.[Loc Zn] = SourceData.[Loc Zn], 
		DestinationTable.[Design Capacity] = SourceData.[Design Capacity], 
		DestinationTable.[Operating Capacity] = SourceData.[Operating Capacity], 
		DestinationTable.[Total Scheduled Quantity] = SourceData.[Total Scheduled Quantity], 
		DestinationTable.[Operationally Available Capacity] = SourceData.[Operationally Available Capacity], 
		DestinationTable.[IT Indicator] = SourceData.[IT Indicator], 
		DestinationTable.[All Qty Avail] = SourceData.[All Qty Avail], 
		DestinationTable.[Qty Reason] = SourceData.[Qty Reason]
WHEN NOT MATCHED THEN INSERT
	(
	  [TSP]
      ,[TSP Name]
      ,[Effective Gas Day]
      ,[Effective Time]
      ,[Meas Basis Desc]
      ,[Cycle Desc]
      ,[Posting Date]
      ,[Posting Time]
      ,[Loc QTI Desc]
      ,[Loc]
      ,[Loc Pur Desc]
      ,[Flow Ind]
      ,[Loc Name]
      ,[Loc Zn]
      ,[Design Capacity]
      ,[Operating Capacity]
      ,[Total Scheduled Quantity]
      ,[Operationally Available Capacity]
      ,[IT Indicator]
      ,[All Qty Avail]
      ,[Qty Reason]
	)
VALUES
	(
		SourceData.[TSP],
		SourceData.[TSP Name],
		SourceData.[Effective Gas Day],
		SourceData.[Effective Time],
		SourceData.[Meas Basis Desc],
		SourceData.[Cycle Desc],
		SourceData.[Posting Date],
		SourceData.[Posting Time],
		SourceData.[Loc QTI Desc],
		SourceData.[Loc],
		SourceData.[Loc Pur Desc],
		SourceData.[Flow Ind],
		SourceData.[Loc Name],
		SourceData.[Loc Zn],
		SourceData.[Design Capacity],
		SourceData.[Operating Capacity],
		SourceData.[Total Scheduled Quantity],
		SourceData.[Operationally Available Capacity],
		SourceData.[IT Indicator],
		SourceData.[All Qty Avail],
		SourceData.[Qty Reason]
	);
END