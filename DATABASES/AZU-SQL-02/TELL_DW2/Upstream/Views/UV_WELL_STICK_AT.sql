/******************************
** Name:  UV_WELL_STICK_AT
** Desc:  View to replace the view from IHS Meridian with data from the data warehouse.  Note - This view now will support all data sources (DI and IHS)
** Auth:  Aaron Vogt
** Date:  10/29/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    10/29/2019   Aaron V   Object creation
*******************************/
CREATE VIEW
	[Upstream].[UV_WELL_STICK_AT]
AS
SELECT
	[API_NUMBER] AS UWI,
    [SURFACE_LATITUDE] as LATITUDE,
    [SURFACE_LONGITUDE] AS LONGITUDE,
	1 AS [INDEX],
	LoadDate AS [RECORD_CREATION_DATE],
	LoadDate AS [RECORD_UPDATE_DATE]
FROM 
	[Upstream].[UV_AC_PROP_AT] WITH (NOLOCK)
UNION ALL
SELECT 
	[API_NUMBER] AS UWI,
    [BH_LATITUDE] as LATITUDE,
    [BH_LONGITUDE] AS LONGITUDE,
	2 AS [INDEX],
	LoadDate AS [RECORD_CREATION_DATE],
	LoadDate AS [RECORD_UPDATE_DATE]
FROM [Upstream].[UV_AC_PROP_AT] WITH (NOLOCK)