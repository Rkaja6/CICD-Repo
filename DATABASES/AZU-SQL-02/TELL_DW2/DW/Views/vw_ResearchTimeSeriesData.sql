/******************************
** Name:  vw_ResearchTimeSeriesData
** Desc:
** Auth:  Aaron Vogt
** Date:  01/28/2020
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    01/28/2020   Aaron V   Object creation
*******************************/
CREATE VIEW [DW].[vw_ResearchTimeSeriesData]
	AS 
SELECT 
	hub.SeriesID,
	hub.UnitOfMeasure,
	sat.StartDate,
	sat.EndDate,
	sat.Value
FROM 
	DW.HubTimeSeries hub
INNER JOIN
	DW.SatTimeSeries sat
ON
	hub.TimeSeriesHashKey = sat.TimeSeriesHashKey