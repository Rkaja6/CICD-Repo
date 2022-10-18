/******************************
** Name:  WELL_STICK_MS_2K
** Desc:  View to replace the table from IHS Meridian with data from the data warehouse
** Auth:  Aaron Vogt
** Date:  11/18/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/18/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [Upstream].[WELL_STICK_MS_2K]
	AS
SELECT ws.*
	FROM Upstream.UV_WELL_STICK_AT ws 
	INNER JOIN [Upstream].[AC_PROP_MS_2K] prop 
	ON ws.UWI = prop.UWI