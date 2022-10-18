


CREATE PROCEDURE [dbo].[ProcessCheniereData] AS
BEGIN
MERGE
	[dbo].[rawCheniereOperationalCapacity] DestinationTable
USING
(
	SELECT
	  [TSP]
      ,[TSP Name]
      ,[Posting Date Time]
      ,[Eff Gas Day Time]
      ,[Loc]	  
      ,[Loc Name]
      ,[Loc Purp Desc]
      ,[Loc QTI ]
      ,[All Qty Avail]
      ,[IT]
      ,[Design Capacity]
      ,[Operating Capacity]
      ,[Total Sched Quantity]
      ,[Operationally Available Capacity]
      ,[Flow Ind]
	FROM [dbo].[vw_TransformRawCheniereData]
) SourceData
ON
		SourceData.TSP = DestinationTable.TSP AND
		SourceData.[Eff Gas Day Time] = DestinationTable.[Eff Gas Day Time] AND
		SourceData.Loc = DestinationTable.Loc
WHEN MATCHED THEN UPDATE SET
	DestinationTable.[TSP] = SourceData.[TSP], 
	DestinationTable.[TSP Name] = SourceData.[TSP Name], 
	DestinationTable.[Posting Date Time] = SourceData.[Posting Date Time], 
	DestinationTable.[Eff Gas Day Time] = SourceData.[Eff Gas Day Time], 
	DestinationTable.[Loc] = SourceData.[Loc], 
	DestinationTable.[Loc Name] = SourceData.[Loc Name], 
	DestinationTable.[Loc Purp Desc] = SourceData.[Loc Purp Desc], 
	DestinationTable.[Loc QTI ] = SourceData.[Loc QTI ], 
	DestinationTable.[All Qty Avail] = SourceData.[All Qty Avail], 
	DestinationTable.[IT] = SourceData.[IT], 
	DestinationTable.[Design Capacity] = SourceData.[Design Capacity], 
	DestinationTable.[Operating Capacity] = SourceData.[Operating Capacity], 
	DestinationTable.[Total Sched Quantity] = SourceData.[Total Sched Quantity], 
	DestinationTable.[Operationally Available Capacity] = SourceData.[Operationally Available Capacity], 
	DestinationTable.[Flow Ind] = SourceData.[Flow Ind]
WHEN NOT MATCHED THEN INSERT
	(
	  [TSP]
      ,[TSP Name]
      ,[Posting Date Time]
      ,[Eff Gas Day Time]
      ,[Loc]	  
      ,[Loc Name]
      ,[Loc Purp Desc]
      ,[Loc QTI ]
      ,[All Qty Avail]
      ,[IT]
      ,[Design Capacity]
      ,[Operating Capacity]
      ,[Total Sched Quantity]
      ,[Operationally Available Capacity]
      ,[Flow Ind]
	)
VALUES
	(
	  SourceData.[TSP]
      ,SourceData.[TSP Name]
      ,SourceData.[Posting Date Time]
      ,SourceData.[Eff Gas Day Time]
      ,SourceData.[Loc]	  
      ,SourceData.[Loc Name]
      ,SourceData.[Loc Purp Desc]
      ,SourceData.[Loc QTI ]
      ,SourceData.[All Qty Avail]
      ,SourceData.[IT]
      ,SourceData.[Design Capacity]
      ,SourceData.[Operating Capacity]
      ,SourceData.[Total Sched Quantity]
      ,SourceData.[Operationally Available Capacity]
      ,SourceData.[Flow Ind]
	);
END