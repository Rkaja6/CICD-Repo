/******************************
** Name:  AC_PROP_AB
** Desc:  View to replace the table from IHS Meridian with data from the data warehouse
** Auth:  Aaron Vogt
** Date:  11/19/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/19/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [Upstream].[AC_PROP_AB]
	AS
SELECT 
		*
	FROM 
		Upstream.WellHeader_PropertiesByPlay prop
	WHERE 
		prop.New_Play = 'Anadarko'