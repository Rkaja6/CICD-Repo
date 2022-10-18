

CREATE PROCEDURE [dbo].[ProcessDominionData] AS
BEGIN
MERGE
	[Pipeline_Data].[dbo].[rawDominionOperationalCapacity] DestinationTable
USING
(
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
) SourceData
ON
	SourceData.[Eff Gas Day] = DestinationTable.[Eff Gas Day] AND 
	SourceData.[CycleDesc] = DestinationTable.[CycleDesc] AND
	SourceData.[Loc Purp Desc] = DestinationTable.[Loc Purp Desc] AND
	SourceData.[Loc] = DestinationTable.[Loc]
WHEN MATCHED THEN
	UPDATE SET
		[Posting Date] = SourceData.[Posting Date],
		[Posting Time] = SourceData.[Posting Time],
		[TSP] = SourceData.[TSP],
		[TSP Name] = SourceData.[TSP Name],
		[CycleDesc] = SourceData.[CycleDesc],
		[Eff Gas Day] = SourceData.[Eff Gas Day],
		[Eff Time] = SourceData.[Eff Time],
		[Meas Basis Desc] = SourceData.[Meas Basis Desc],
		[Loc Purp Desc] = SourceData.[Loc Purp Desc],
		[Loc QTI Desc] = SourceData.[Loc QTI Desc],
		[Interconnect Party Name] = SourceData.[Interconnect Party Name],
		[OIA] = SourceData.[OIA],
		[Loc] = SourceData.[Loc],
		[Loc Name] = SourceData.[Loc Name],
		[Operating Capacity] = SourceData.[Operating Capacity],
		[Total Scheduled Qty] = SourceData.[Total Scheduled Qty],
		[Operationally Available Capacity] = SourceData.[Operationally Available Capacity],
		[Design Capacity] = SourceData.[Design Capacity],
		[All Quantities Available Indicator] = SourceData.[All Quantities Available Indicator],
		[Quantity Not Available Reason] = SourceData.[Quantity Not Available Reason],
		[Flow Ind] = SourceData.[Flow Ind],
		[IT] = SourceData.[IT],
		[Column 22] = SourceData.[Column 22]
WHEN NOT MATCHED THEN
	INSERT
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
	VALUES
	(
		SourceData.[Posting Date],
		SourceData.[Posting Time],
		SourceData.[TSP],
		SourceData.[TSP Name],
		SourceData.[CycleDesc],
		SourceData.[Eff Gas Day],
		SourceData.[Eff Time],
		SourceData.[Meas Basis Desc],
		SourceData.[Loc Purp Desc],
		SourceData.[Loc QTI Desc],
		SourceData.[Interconnect Party Name],
		SourceData.[OIA],
		SourceData.[Loc],
		SourceData.[Loc Name],
		SourceData.[Operating Capacity],
		SourceData.[Total Scheduled Qty],
		SourceData.[Operationally Available Capacity],
		SourceData.[Design Capacity],
		SourceData.[All Quantities Available Indicator],
		SourceData.[Quantity Not Available Reason],
		SourceData.[Flow Ind],
		SourceData.[IT],
		SourceData.[Column 22]
	);
END