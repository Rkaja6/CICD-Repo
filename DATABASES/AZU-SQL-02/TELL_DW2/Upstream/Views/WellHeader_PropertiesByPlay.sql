/******************************
** Name:  WellHeader_PropertiesByPlay
** Desc:  View to provide a list of well properties by shale play. Eventually, we should build a materialized/persistent view/table holding all properties and production info, by play
** Auth:  Aaron Vogt
** Date:  11/19/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/19/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [Upstream].[WellHeader_PropertiesByPlay]
	AS 
SELECT 
		prop.*,
		play.[New_Play]
	FROM
		Upstream.UV_AC_PROP_AT prop WITH (NOLOCK)
	INNER JOIN
		Upstream.RefWell_PlayByStateCounty play WITH (NOLOCK)
	ON
		prop.STATE_NAME = play.State AND
		prop.COUNTY_NAME = play.County