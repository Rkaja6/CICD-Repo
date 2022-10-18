
CREATE VIEW [GIS].[V_Pipeline_Postings] AS
SELECT 
	B.[Objectid] AS RXT_ObjectID
      ,B.[Pntrid] AS RXT_PntrID
      ,B.[PointUID]
      ,B.[PipelineName]
      ,B.[LocationName]
      ,B.[LocationCode]
      ,A.[TSPName]
      ,A.[PostDate]
      ,A.[EffectiveDate]
      ,A.[LocationType]
      ,A.[QuantityType]
      ,A.[DesignCapacity]
      ,A.[OperatingCapacity]
      ,A.[AvailableCapacity]
      ,A.[ScheduledQuantity]
      ,A.[IT]
      ,A.[FlowIndicator]
      ,A.[AllQuantitiesAvailableFlag]
	  ,'https://app.powerbi.com/groups/me/apps/b39b57be-af78-4d0a-8ee1-998640f3ea67' AS ReportURL
FROM [Pipeline_Data].DBO.[vw_OperatingCapacityMaster] A
INNER JOIN [GIS].[V_Pipeline_Meter_Points] B
	ON A.TSP + '_' + A.Location = B.PointUID