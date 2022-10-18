







CREATE VIEW [dbo].[vw_OperatingCapacityDominion] AS
SELECT 
      [TSP]
      ,[TSP Name] TSPName
		,CONVERT(DATE, [Posting Date] + ' ' + [Posting Time]) PostingDate
      ,CONVERT(DATE, [Eff Gas Day] + ' ' + [Eff Time]) EffectiveDate
      ,[Loc] Location
      ,[Loc Name] LocationName
	  ,[Loc Purp Desc] LocationType
	  ,CASE
		WHEN CHARINDEX('RECEIPT', UPPER([Loc QTI Desc])) <> 0 AND CHARINDEX('POINT', UPPER([Loc QTI Desc])) <> 0 AND CHARINDEX('QUANTITY', UPPER([Loc QTI Desc])) <> 0 THEN 'RPQ'
		WHEN CHARINDEX('DELIVER', UPPER([Loc QTI Desc])) <> 0 AND CHARINDEX('POINT', UPPER([Loc QTI Desc])) <> 0 AND CHARINDEX('QUANTITY', UPPER([Loc QTI Desc])) <> 0 THEN 'DPQ'
		ELSE [Loc QTI Desc]
		END QuantityType
      ,TRY_CONVERT(NUMERIC(32,24), [Design Capacity]) DesignCapacity
      ,TRY_CONVERT(NUMERIC(32,24), [Operating Capacity]) OperatingCapacity
      ,TRY_CONVERT(NUMERIC(32,24), [Operationally Available Capacity]) AvailableCapacity
	  ,TRY_CONVERT(NUMERIC(32,24),[Total Scheduled Qty] ) ScheduledQuantity
	  ,[IT]
	  ,[Flow Ind] FlowIndicator
	  ,[All Quantities Available Indicator] AllQuantitiesAvailableFlag
  FROM [Pipeline_Data].[dbo].[rawDominionOperationalCapacity]
  WHERE CycleDesc = 'Timely'