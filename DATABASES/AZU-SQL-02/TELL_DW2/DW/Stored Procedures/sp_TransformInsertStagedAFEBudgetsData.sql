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
CREATE PROCEDURE [DW].[sp_TransformInsertStagedAFEBudgetsData] AS

BEGIN
--------------------------------------------------------------------------------------
-----------   BOLO AFE   -------------------------------------------------------------------
---------------------------------------------------------------------------------------

--INSERT Records that don't exist at all
INSERT INTO 
	[DW].[SatAFEBudgets]
(	   
	[AFEHashKey],
	[AFEBudgetSequence],
	[Account],
	[Company],
	[AccountingPeriod],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[Amount]
)
SELECT
	stg.[AFEHashKey],
	stg.[AFEBudgetSequence],
	stg.[Account],
	stg.[Company],
	stg.[AccountingPeriod],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[Amount]
FROM
	[DW].[vw_BOLOAFEBudgetsSatStageData] stg
LEFT JOIN
	[DW].[SatAFEBudgets] sat WITH (NOLOCK)
ON
	stg.[AFEHashKey] = sat.[AFEHashKey] AND
	stg.[AFEBudgetSequence] = sat.[AFEBudgetSequence] AND
	stg.[Account] = sat.[Account] AND
	stg.[Company] = sat.[Company] AND
	stg.[AccountingPeriod] = sat.[AccountingPeriod] AND
	stg.[LoadDate] = sat.[LoadDate] AND
	stg.[RecordSource] = sat.RecordSource
WHERE
	sat.[AFEHashKey] IS NULL

END