

Create View [GIS].[V_Pipeline_Meter_Points] AS
SELECT 
	R.Objectid,
	R.Pntrid,
	T.TSP + '_' + COALESCE(R.PNTPROPLOC,D.Location) AS PointUID,
	COALESCE(R.PNTPLNAME,D.TSPName) AS PipelineName,
	COALESCE(R.PNTLOCNAME,D.LocationName) AS LocationName, 
	COALESCE(R.PNTPROPLOC,D.Location) AS LocationCode
FROM GIS.[RXT_NG_METER_POINTS] R
INNER JOIN GIS.TSP T ON R.PNTPLNAME = T. TSP_Name
INNER JOIN 
	(
	SELECT DISTINCT 
		TSP, 
		TSPName, 
		Location, 
		LocationName
	FROM [Pipeline_Data].dbo.[vw_OperatingCapacityMaster]
	) D
	ON D.TSP = T.TSP
	AND D.Location = R.PNTPROPLOC