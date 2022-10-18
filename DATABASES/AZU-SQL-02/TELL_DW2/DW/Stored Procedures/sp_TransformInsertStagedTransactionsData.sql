/******************************
** Name:  [sp_TransformInsertStagedTransactionsData]
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
CREATE PROCEDURE [DW].[sp_TransformInsertStagedTransactionsData] AS

BEGIN
--------------------------------------------------------------------------------------
-----------   BOLO Transactions   -------------------------------------------------------------------
---------------------------------------------------------------------------------------

--INSERT Records that don't exist at all
INSERT INTO 
	[DW].[HubTransaction]
(	   
	[TransactionHashKey],
	[RecordSource],
	[LoadDate],
	[Transaction_u2_id]
)
SELECT
	stg.[TransactionHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[Transaction_u2_id]
FROM
	 [DW].[vw_BOLOTransactionHubStageData] stg
LEFT JOIN
	[DW].[HubTransaction] hub WITH (NOLOCK)
ON
	stg.TransactionHashKey = hub.TransactionHashKey AND
	stg.[RecordSource] = hub.RecordSource
WHERE
	hub.TransactionHashKey IS NULL AND
	stg.TransactionHashKey IS NOT NULL

END