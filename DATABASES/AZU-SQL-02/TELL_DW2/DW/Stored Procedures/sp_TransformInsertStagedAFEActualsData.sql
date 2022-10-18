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
CREATE PROCEDURE [DW].[sp_TransformInsertStagedAFEActualsData] AS

BEGIN
--------------------------------------------------------------------------------------
-----------   BOLO AFE   -------------------------------------------------------------------
---------------------------------------------------------------------------------------

--INSERT Records that don't exist at all
INSERT INTO 
	[DW].[SatAFEActuals]
(	   
	[TransactionHashKey],
	[RecordSource],
	[LoadDate],
	[InvoiceNumber],
	[AccountingPeriod],
	[TransactionDate],
	[Amount],
	[IsPaid]
)
SELECT
	stg.[TransactionHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[InvoiceNumber],
	stg.[AccountingPeriod],
	stg.[TransactionDate],
	stg.[Amount],
	stg.[IsPaid]
FROM
	[DW].[vw_BOLOAFEActualsSatStageData] stg
LEFT JOIN
	[DW].[SatAFEActuals] sat WITH (NOLOCK)
ON
	stg.[TransactionHashKey] = sat.[TransactionHashKey] AND
	stg.[RecordSource] = sat.RecordSource
WHERE
	sat.[TransactionHashKey] IS NULL AND
	stg.[TransactionHashKey] IS NOT NULL

END