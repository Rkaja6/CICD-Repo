/******************************
** Name:  [sp_TransformInsertStagedWellOriginWellBoreLinkData]
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
CREATE PROCEDURE [DW].[sp_TransformInsertStagedWellOriginWellBoreLinkData] AS
BEGIN

INSERT INTO
	[DW].[LinkWellOriginWellbore]
(
	[WellOriginWellboreHashKey],
	[WellOriginHashKey],
	[WellboreHashKey],
	[RecordSource],
	[LoadDate]
)
SELECT
	stg.[WellOriginWellboreHashKey],
	stg.[WellOriginHashKey],
	stg.[WellboreHashKey],
	stg.[RecordSource],
	stg.[LoadDate]
FROM
	[DW].[vw_WellOriginWellBoreLinkStageData] stg
LEFT JOIN
	[DW].[LinkWellOriginWellbore] link WITH (NOLOCK)
ON
	stg.[WellOriginWellboreHashKey] = link.[WellOriginWellboreHashKey]
WHERE
	link.[WellOriginWellboreHashKey] IS NULL

END