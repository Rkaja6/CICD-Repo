
/******************************
** Name:  [sp_TransformInsertStagedAFEData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/11/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/11/2019   Aaron     Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedAFEData] AS

BEGIN

select 1 
--------------------------------------------------------------------------------------
-----------   BOLO AFE   -------------------------------------------------------------------
---------------------------------------------------------------------------------------

--INSERT Records that don't exist at all
/**
INSERT INTO 
	[DW].[HubAFE]
(	   
	[AFEHashKey],
	[RecordSource],
	[LoadDate],
	[AFENumber]
)
SELECT
	stg.[AFEHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[AFENumber]
FROM
	[DW].[vw_BOLOAFEHubStageData] stg
LEFT JOIN
	[DW].[HubAFE] hub WITH (NOLOCK)
ON
	stg.AFEHashKey = hub.AFEHashKey AND
	stg.[RecordSource] = hub.RecordSource
WHERE
	hub.AFEHashKey IS NULL AND
	stg.AFEHashKey IS NOT NULL
**/


END