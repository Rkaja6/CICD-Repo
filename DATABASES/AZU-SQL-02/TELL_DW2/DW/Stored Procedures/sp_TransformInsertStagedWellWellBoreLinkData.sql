/******************************
** Name:  [sp_TransformInsertStagedWellWellBoreLinkData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedWellWellBoreLinkData] AS
BEGIN

INSERT INTO
	[DW].[LinkWellboreWell]	
(
	[WellboreWellHashKey],
	[WellboreHashKey],
	[WellHashKey],
	[RecordSource],
	[LoadDate]
)
SELECT
	stg.[WellboreWellHashKey],
	stg.[WellboreHashKey],
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate]
FROM
	[DW].[vw_WellWellBoreLinkStageData] stg
LEFT JOIN
	[DW].[LinkWellboreWell] link WITH (NOLOCK)
ON
	stg.[WellboreWellHashKey] = link.[WellboreWellHashKey]
WHERE
	link.WellboreHashKey IS NULL

END