





CREATE VIEW [dbo].[vw_OperatingCapacityKinderMorgan] AS
SELECT 
      [TSP]
      ,[TSP Name] TSPName
,CONVERT(DATE, REPLACE([Post Date Post Time], 'CCT', '')) PostingDate
      ,CONVERT(DATE, REPLACE([Eff Gas Day Eff Time], 'CCT', '')) EffectiveDate
,Loc Location
,[Loc Name] LocationName
,[Loc Purp Desc] LocationType
,CASE
	WHEN CHARINDEX('RECEIPT', UPPER([Loc QTI Desc])) <> 0 AND CHARINDEX('POINT', UPPER([Loc QTI Desc])) <> 0 AND CHARINDEX('QUANTITY', UPPER([Loc QTI Desc])) <> 0 THEN 'RPQ'
	WHEN CHARINDEX('DELIVER', UPPER([Loc QTI Desc])) <> 0 AND CHARINDEX('POINT', UPPER([Loc QTI Desc])) <> 0 AND CHARINDEX('QUANTITY', UPPER([Loc QTI Desc])) <> 0 THEN 'DPQ'
	ELSE [Loc QTI Desc]
 END QuantityType
,CONVERT(NUMERIC(32,24), REPLACE([Design Capacity],',','')) DesignCapacity,
CONVERT(NUMERIC(32,24), REPLACE([Operating Capacity],',','')) OperatingCapacity,
CONVERT(NUMERIC(32,24), REPLACE([Operationally Available Capacity],',','')) AvailableCapacity,
CONVERT(NUMERIC(32,24), REPLACE([Total Scheduled Quantity],',','')) ScheduledQuantity,
	  [IT],
	  [Flow Ind] FlowIndicator,
	  [All Qty Avail] AllQuantitiesAvailableFlag
  FROM [Pipeline_Data].[dbo].[rawKinderMorganOperationalCapacity]