/******************************
** Name:  WELL_STICK_AB_2K
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
CREATE VIEW [Upstream].[WELL_STICK_AB_2K]
	AS 
select ws.*
	from UV_WELL_STICK_AT ws 
	inner join [Upstream].[AC_PROP_AB_2K] prop 
	on ws.UWI = prop.UWI