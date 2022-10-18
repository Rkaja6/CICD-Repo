/******************************
** Name:  AC_PROP_PB
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
	[Upstream].[AC_PROP_PB]
AS 
SELECT 
	*
FROM
	Upstream.UV_AC_PROP_AT prop
WHERE
	(prop.STATE_NAME = 'texas' OR prop.STATE_NAME = 'new mexico') AND
	(prop.COUNTY_NAME = 'eddy' OR
		prop.COUNTY_NAME = 'lea' OR
		prop.COUNTY_NAME = 'culberson' OR
		prop.COUNTY_NAME = 'reeves' OR
		prop.COUNTY_NAME = 'pecos' OR
		prop.COUNTY_NAME = 'loving' OR
		prop.COUNTY_NAME = 'ward' OR
		prop.COUNTY_NAME = 'winkler' OR
		prop.COUNTY_NAME = 'ector' OR
		prop.COUNTY_NAME = 'andrews' OR
		prop.COUNTY_NAME = 'gaines' OR
		prop.COUNTY_NAME = 'dawson' OR
		prop.COUNTY_NAME = 'borden' OR
		prop.COUNTY_NAME = 'scurry' OR
		prop.COUNTY_NAME = 'crane' OR
		prop.COUNTY_NAME = 'terry' OR
		prop.COUNTY_NAME = 'yoakum' OR
		prop.COUNTY_NAME = 'crockett' OR
		prop.COUNTY_NAME = 'sutton' OR
		prop.COUNTY_NAME = 'schleicher' OR
		prop.COUNTY_NAME = 'irion' OR
		prop.COUNTY_NAME = 'tom green' OR
		prop.COUNTY_NAME = 'sterling' OR
		prop.COUNTY_NAME = 'upton' OR
		prop.COUNTY_NAME = 'reagan' OR 
		prop.COUNTY_NAME = 'mitchell' OR
		prop.COUNTY_NAME = 'midland' OR
		prop.COUNTY_NAME = 'glasscock' OR
		prop.COUNTY_NAME = 'martin' OR
		prop.COUNTY_NAME = 'howard')