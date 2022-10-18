

/******************************
** Name:  [vw_BOLOAFEWellLinkStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/10/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/09/2019   Aaron     Object creation
*******************************/
CREATE VIEW [DW].[vw_BOLOAFEWellLinkStageData] AS
SELECT 
	HASHBYTES('SHA2_256', CONCAT(proj.PROJ_NO, '|', cc.API_WELL_NO)) AS AFEWellHashKey,
	HASHBYTES('SHA2_256', proj.PROJ_NO) AS AFEHashKey,
	HASHBYTES('SHA2_256', cc.API_WELL_NO) AS WellHashKey,
	'BOLO Cost Center and Project' AS RecordSource,
	CONVERT(DATETIME2(7), proj.time_stamp) AS LoadDate
FROM
	[StageBOLO].[CC] cc WITH (NOLOCK)
INNER JOIN
	[StageBOLO].[PROJ] proj WITH (NOLOCK)
ON
	cc.u2_id = proj.COST_CENTER
WHERE
	cc.API_WELL_NO IS NOT NULL AND
	proj.PROJ_NO IS NOT NULL