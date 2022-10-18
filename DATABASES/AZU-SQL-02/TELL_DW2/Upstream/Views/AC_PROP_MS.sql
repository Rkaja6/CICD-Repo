/******************************
** Name:  AC_PROP_MS
** Desc:  View to replace the table from IHS Meridian with data from the data warehouse
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
	[Upstream].[AC_PROP_MS]
AS 
SELECT 
	*
FROM
	Upstream.UV_AC_PROP_AT prop WITH (NOLOCK)
WHERE
	(prop.STATE_NAME = 'pennsylvania' or 
		prop.STATE_NAME = 'west virginia' or 
		prop.STATE_NAME = 'ohio')