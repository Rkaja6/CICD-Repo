




CREATE VIEW [dbo].[vw_OperatingCapacityCheniere] AS
SELECT 
	   [TSP]
      ,[TSP Name] AS TSPName
      ,CONVERT(DATE, [Posting Date Time]) AS PostDate
      ,CONVERT(DATE, [Eff Gas Day Time]) AS EffectiveDate
      ,[Loc] Location
      ,[Loc Name] LocationName
	  ,[Loc Purp Desc] LocationType
	  ,CASE
		WHEN CHARINDEX('RECEIPT', UPPER([Loc QTI])) <> 0 AND CHARINDEX('POINT', UPPER([Loc QTI])) <> 0 AND CHARINDEX('QUANTITY', UPPER([Loc QTI])) <> 0 THEN 'RPQ'
		WHEN CHARINDEX('DELIVER', UPPER([Loc QTI])) <> 0 AND CHARINDEX('POINT', UPPER([Loc QTI])) <> 0 AND CHARINDEX('QUANTITY', UPPER([Loc QTI])) <> 0 THEN 'DPQ'
		ELSE [Loc QTI]
		END AS QuantityType
      ,CONVERT(NUMERIC(32,24), [Design Capacity]) DesignCapacity
      ,CONVERT(NUMERIC(32,24), [Operating Capacity]) OperatingCapacity
      ,CONVERT(NUMERIC(32,24), [Operationally Available Capacity]) AvailableCapacity
	  ,CONVERT(NUMERIC(32,24), [Total Sched Quantity]) ScheduledQuantity
	  ,[IT]
	  ,[Flow Ind] FlowIndicator
	  ,[All Qty Avail] AllQuantitiesAvailableFlag
  FROM [Pipeline_Data].[dbo].[rawCheniereOperationalCapacity]