
/******************************
** Name:  [[sp_TransformInsertStagedWellOriginData]]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
** 2    09/09/2019   Aaron V   Added API10's from Aries AC PROPERTY table
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedWellOriginData] AS
BEGIN

INSERT INTO
	[DW].[HubWellOrigin]	
(
	[WellOriginHashKey],
	[RecordSource],
	[LoadDate],
	[API10]
)
SELECT
	stg.[WellOriginHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[API10]
FROM
	[DW].[vw_DIWellOriginHubStageData] stg
LEFT JOIN
	[DW].[HubWellOrigin] hub WITH (NOLOCK)
ON
	stg.WellOriginHashKey = hub.WellOriginHashKey
WHERE
	hub.WellOriginHashKey IS NULL


INSERT INTO
	[DW].[HubWellOrigin]	
(
	[WellOriginHashKey],
	[RecordSource],
	[LoadDate],
	[API10]
)
SELECT
	stg.[WellOriginHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[API10]
FROM
	[DW].[vw_IHSWellOriginHubStageData] stg
LEFT JOIN
	[DW].[HubWellOrigin] hub WITH (NOLOCK)
ON
	stg.WellOriginHashKey = hub.WellOriginHashKey
WHERE
	hub.WellOriginHashKey IS NULL AND
	stg.WellOriginHashKey IS NOT NULL



INSERT INTO
	[DW].[HubWellOrigin]	
(
	[WellOriginHashKey],
	[RecordSource],
	[LoadDate],
	[API10]
)
SELECT
	stg.[WellOriginHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[API10]
FROM
	[DW].[vw_AriesWellOriginHubStageData] stg
LEFT JOIN
	[DW].[HubWellOrigin] hub WITH (NOLOCK)
ON
	stg.WellOriginHashKey = hub.WellOriginHashKey
WHERE
	hub.WellOriginHashKey IS NULL AND
	stg.WellOriginHashKey IS NOT NULL

	END