/******************************
** Name:  AC_PROP_2K
** Desc:  View to replace the view from IHS Meridian with data from the data warehouse
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
	[Upstream].[AC_PROP_2K]
AS 
SELECT
	PROP.*
FROM
	Upstream.UV_AC_PROP_AT prop WITH (NOLOCK)
INNER JOIN
	Upstream.WellHeader prod
ON
	PROD.API14 = PROP.API_NUMBER
WHERE PROD.Date_First_Production >= '01/01/2000'