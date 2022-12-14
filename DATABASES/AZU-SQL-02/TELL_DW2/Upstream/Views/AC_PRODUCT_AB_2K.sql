/******************************
** Name:  AC_PRODUCT_AB_2K
** Desc:  View to replace the view from IHS Meridian with data from the data warehouse
** Auth:  Aaron Vogt
** Date:  11/19/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/19/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [Upstream].[AC_PRODUCT_AB_2K]
	AS
SELECT PROD.*, 'IHS' as Record_Source
	FROM
		Upstream.UV_AC_PRODUCT_AT PROD WITH (NOLOCK)
	INNER JOIN 
		Upstream.AC_PROP_AB PROP
	ON
		PROD.API = PROP.UWI
	WHERE (YEAR(PROD.FirstProdDate) > 2000)