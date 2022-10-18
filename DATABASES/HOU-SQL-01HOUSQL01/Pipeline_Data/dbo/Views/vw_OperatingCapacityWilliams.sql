






CREATE VIEW [dbo].[vw_OperatingCapacityWilliams] AS
SELECT
	   [TSP]
      ,[TSP Name] AS TSPName
      ,CONVERT(DATE, [Posting Date] + ' ' + [Posting Time]) PostDate
      ,CONVERT(DATE, [Effective Gas Day] + ' ' + REPLACE([Effective Time], 'CT', '')) EffectiveDate
      ,[Loc] Location
      ,[Loc Name] LocationName
	  ,[Loc Pur Desc] LocationType
	  ,CASE
		WHEN CHARINDEX('Delivery point (s) quantity', [Loc QTI Desc]) > 0 THEN 'DPQ'
		WHEN CHARINDEX('Mainline quantity', [Loc QTI Desc]) > 0 THEN 'MLQ'
		WHEN CHARINDEX('Receipt point (s) quantity', [Loc QTI Desc]) > 0 THEN 'RPQ'
		WHEN CHARINDEX('Receipt point (s) to delivery point (s) quantity', [Loc QTI Desc]) > 0 THEN 'RDQ'
		WHEN CHARINDEX('Segment (s) quantity', [Loc QTI Desc]) > 0 THEN 'SGQ'
		WHEN CHARINDEX('Storage injection quantity', [Loc QTI Desc]) > 0 THEN 'SIQ'
		WHEN CHARINDEX('Storage quantity', [Loc QTI Desc]) > 0 THEN 'STQ'
		WHEN CHARINDEX('Storage withdrawal quantity', [Loc QTI Desc]) > 0 THEN 'SWQ'
		ELSE [Loc QTI Desc]
		END QuantityType
      ,CONVERT(NUMERIC(32,24), CASE WHEN ISNUMERIC([Design Capacity]) <> 1 THEN 0 ELSE [Design Capacity] END) DesignCapacity
      ,CONVERT(NUMERIC(32,24), CASE WHEN ISNUMERIC([Design Capacity]) <> 1 THEN 0 ELSE [Operating Capacity] END) OperatingCapacity
      ,CONVERT(NUMERIC(32,24), CASE WHEN ISNUMERIC([Design Capacity]) <> 1 THEN 0 ELSE [Operationally Available Capacity] END) AvailableCapacity
	  ,CONVERT(NUMERIC(32,24), CASE WHEN ISNUMERIC([Design Capacity]) <> 1 THEN 0 ELSE [Total Scheduled Quantity] END) ScheduledQuantity
	  ,[IT Indicator]
	  ,[Flow Ind] FlowIndicator
	  ,[All Qty Avail] AllQuantitiesAvailableFlag
  FROM [Pipeline_Data].[dbo].[rawWilliamsTranscoOperationalCapacity]