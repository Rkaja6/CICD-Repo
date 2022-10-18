/******************************
** Name:  [sp_TransformInsertStagedAFEEstimatesData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/12/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/12/2019   Aaron     Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedAFEEstimatesData] AS

BEGIN
--------------------------------------------------------------------------------------
-----------   BOLO AFE   -------------------------------------------------------------------
---------------------------------------------------------------------------------------

--INSERT Records that don't exist at all
INSERT INTO 
	[DW].[SatAFEEstimates]
(	   
	[AFEHashKey],
	[RecordSource],
	[AccountingPeriod],
	[JobReportCostGenID],
	[LoadDate],
	[LoadEndDate],
	[Amount]
)
SELECT
	stg.[AFEHashKey],
	stg.[RecordSource],
	stg.[AccountingPeriod],
	stg.[JobReportCostGenID],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[Amount]
FROM
	[DW].[vw_BOLOAFEEstimatesSatStageData] stg
LEFT JOIN
	[DW].[SatAFEEstimates] sat WITH (NOLOCK)
ON
	stg.[AFEHashKey] = sat.[AFEHashKey] AND
	stg.[JobReportCostGenID] = sat.[JobReportCostGenID] AND
	stg.[AccountingPeriod] = sat.[AccountingPeriod] AND
	stg.[LoadDate] = sat.[LoadDate] AND
	stg.[RecordSource] = sat.RecordSource
WHERE
	sat.[AFEHashKey] IS NULL

END