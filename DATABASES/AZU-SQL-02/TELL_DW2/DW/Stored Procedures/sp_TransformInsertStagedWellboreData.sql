


/******************************
** Name:  [[sp_TransformInsertStagedWellboreData]]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/20/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/20/2019   Aaron     Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedWellboreData] AS
BEGIN

INSERT INTO
	[DW].[HubWellbore]	
(
	[WellboreHashKey],
	[RecordSource],
	[LoadDate],
	[API12]
)
SELECT
	stg.[WellboreHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[API12]
FROM
	[DW].[vw_DIWellboreHubStageData] stg
LEFT JOIN
	[DW].[HubWellbore] hub WITH (NOLOCK)
ON
	stg.WellboreHashKey = hub.WellboreHashKey
WHERE
	hub.WellboreHashKey IS NULL


INSERT INTO
	[DW].[HubWellbore]	
(
	[WellboreHashKey],
	[RecordSource],
	[LoadDate],
	[API12]
)
SELECT
	stg.[WellboreHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[API12]
FROM
	[DW].[vw_IHSWellboreHubStageData] stg
LEFT JOIN
	[DW].[HubWellbore] hub WITH (NOLOCK)
ON
	stg.WellboreHashKey = hub.WellboreHashKey
WHERE
	hub.WellboreHashKey IS NULL AND
	stg.WellboreHashKey IS NOT NULL


/*
-- AC_PROPERTY Does not have data below the API10 level
INSERT INTO
	[DW].[HubWellbore]	
SELECT
	stg.[WellboreHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[API12]
FROM
	[DW].[vw_AriesWellboreHubStageData] stg
LEFT JOIN
	[DW].[HubWellbore] hub
ON
	stg.WellboreHashKey = hub.WellboreHashKey
WHERE
	hub.WellboreHashKey IS NULL AND
	stg.WellboreHashKey IS NOT NULL
*/
	END