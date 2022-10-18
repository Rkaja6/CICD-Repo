/******************************
** Name:  [sp_TransformInsertStagedWellOriginPropNumData]
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
CREATE PROCEDURE [DW].[sp_TransformInsertStagedWellOriginPropNumData] AS

BEGIN

--TODO Add try catch blocks once completed
--TODO Add code to attempt to catch invalid typed fields (dates/numeric)
--TODO Add code to end date deleted records
--TODO Some fields in the well header views still need to be identified - Please note that data was pulled from levels beyond the Well Headers (e.g. Well Bores)

---------------------------------------------------------------------------------------
-----------   DI   -------------------------------------------------------------------
---------------------------------------------------------------------------------------

--INSERT Records that don't exist at all
INSERT INTO 
	[DW].[SatWellOriginPropNum]
(	   
	[WellOriginHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[PropNum]
)
SELECT
	stg.[WellOriginHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[PropNum]
FROM
	[DW].[vw_TellDWWellOriginPropNumSatStageData] stg
LEFT JOIN
	[DW].[SatWellOriginPropNum] sat WITH (NOLOCK)
ON
	stg.[WellOriginHashKey] = sat.[WellOriginHashKey] AND
	stg.[RecordSource] = sat.RecordSource
WHERE
	sat.[WellOriginHashKey] IS NULL AND
	stg.[WellOriginHashKey] IS NOT NULL

IF OBJECT_ID('tempdb..#new_staged_di_well_propnums') IS NOT NULL DROP TABLE #new_staged_di_well_propnums

--Grab keys for staged records that are newer using the updated date.  Later field hashes can be used, if we find that the updated dates are unreliable
SELECT
	sat.[WellOriginHashKey],
	sat.RecordSource,
	sat.LoadDate AS OldLoadDate,
	stg.LoadDate AS NewLoadDate
INTO
	#new_staged_di_well_propnums
FROM
	[DW].[SatWellOriginPropNum] sat WITH (NOLOCK)
INNER JOIN
	[DW].[vw_TellDWWellOriginPropNumSatStageData] stg
ON
	sat.[WellOriginHashKey] = stg.[WellOriginHashKey] AND
	stg.[RecordSource] = sat.RecordSource AND
	sat.LoadEndDate IS NULL AND
	stg.[PropNum] <> sat.[PropNum]



--End date any records being replaced with the updated date from stage (1 second prior to current record updated date)
UPDATE sat
	SET sat.LoadEndDate = DATEADD(ss, -1, stg.NewLoadDate)
FROM
	[DW].[SatWellOriginPropNum] sat
INNER JOIN
	#new_staged_di_well_propnums stg
ON
	sat.[WellOriginHashKey] = stg.[WellOriginHashKey] AND
	sat.RecordSource = stg.RecordSource AND
	sat.LoadDate = stg.OldLoadDate

--Insert any records that were tagged as being updated in stage
INSERT INTO 
	[DW].[SatWellOriginPropNum]
(	   
	[WellOriginHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[PropNum]
)
SELECT
	stg.[WellOriginHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[PropNum]
FROM
	[DW].[vw_TellDWWellOriginPropNumSatStageData] stg
INNER JOIN
	#new_staged_di_well_propnums sat WITH (NOLOCK)
ON
	stg.[WellOriginHashKey] = sat.[WellOriginHashKey] AND
	stg.RecordSource = sat.RecordSource AND
	stg.LoadDate = sat.NewLoadDate

--Release temp space used
IF OBJECT_ID('tempdb..#new_staged_di_well_propnums') IS NOT NULL DROP TABLE #new_staged_di_well_propnums
END