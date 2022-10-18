/******************************
** Name:  [sp_TransformInsertStagedWellStatusData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
** 2    10/01/2019   Dee       Added Activity column
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedWellStatusData] AS

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
	[DW].[SatWellStatus]
(	   
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[Status],
	[Activity],
	[Classification]
)
SELECT
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[Status],
	stg.[Activity],
	stg.[Classification]
FROM
	[DW].[vw_DIWellStatusSatStageData] stg
LEFT JOIN
	[DW].[SatWellStatus] sat WITH (NOLOCK)
ON
	stg.WellHashKey = sat.WellHashKey AND
	stg.[RecordSource] = sat.RecordSource
WHERE
	sat.WellHashKey IS NULL AND
	stg.WellHashKey IS NOT NULL

IF OBJECT_ID('tempdb..#new_staged_di_well_statuses') IS NOT NULL DROP TABLE #new_staged_di_well_statuses

--Grab keys for staged records that are newer using the updated date.  Later field hashes can be used, if we find that the updated dates are unreliable
SELECT
	sat.WellHashKey,
	sat.RecordSource,
	sat.LoadDate AS OldLoadDate,
	stg.LoadDate AS NewLoadDate
INTO
	#new_staged_di_well_statuses
FROM
	[DW].[SatWellStatus] sat WITH (NOLOCK)
INNER JOIN
	[DW].[vw_DIWellStatusSatStageData] stg
ON
	sat.WellHashKey = stg.WellHashKey AND
	stg.[RecordSource] = sat.RecordSource AND
	sat.LoadEndDate IS NULL AND
	stg.LoadDate > sat.LoadDate



--End date any records being replaced with the updated date from stage (1 second prior to current record updated date)
UPDATE sat
	SET sat.LoadEndDate = DATEADD(ss, -1, stg.NewLoadDate)
FROM
	[DW].[SatWellStatus] sat
INNER JOIN
	#new_staged_di_well_statuses stg
ON
	sat.WellHashKey = stg.WellHashKey AND
	sat.RecordSource = stg.RecordSource AND
	sat.LoadDate = stg.OldLoadDate

--Insert any records that were tagged as being updated in stage
INSERT INTO 
	[DW].[SatWellStatus]
(	   
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[Status],
	[Activity],
	[Classification]
)
SELECT
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[Status],
	stg.[Activity],
	stg.[Classification]
FROM
	[DW].[vw_DIWellStatusSatStageData] stg
INNER JOIN
	#new_staged_di_well_statuses sat
ON
	stg.WellHashKey = sat.WellHashKey AND
	stg.RecordSource = sat.RecordSource AND
	stg.LoadDate = sat.NewLoadDate

--Release temp space used
IF OBJECT_ID('tempdb..#new_staged_di_well_statuses') IS NOT NULL DROP TABLE #new_staged_di_well_statuses





---------------------------------------------------------------------------------------
-----------   IHS   -------------------------------------------------------------------
---------------------------------------------------------------------------------------



--INSERT Records that don't exist at all
INSERT INTO 
	[DW].[SatWellStatus]
(
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[Status],
	[Activity],
	[Classification]
)
SELECT
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[Status],
	stg.[Activity],
	stg.[Classification]
FROM
	[DW].[vw_IHSWellStatusSatStageData] stg
LEFT JOIN
	[DW].[SatWellStatus] sat
ON
	stg.WellHashKey = sat.WellHashKey AND
	stg.[RecordSource] = sat.RecordSource
WHERE
	sat.WellHashKey IS NULL

IF OBJECT_ID('tempdb..#new_staged_ihs_well_statuses') IS NOT NULL DROP TABLE #new_staged_ihs_well_statuses

--Grab keys for staged records that are newer
SELECT
	sat.WellHashKey,
	sat.RecordSource,
	sat.LoadDate AS OldLoadDate,
	stg.LoadDate AS NewLoadDate
INTO
	#new_staged_ihs_well_statuses
FROM
	[DW].[SatWellStatus] sat
INNER JOIN
	[DW].[vw_IHSWellStatusSatStageData] stg
ON
	stg.WellHashKey = sat.WellHashKey AND
	stg.[RecordSource] = sat.RecordSource AND
	sat.LoadEndDate IS NULL AND
	stg.LoadDate > sat.LoadDate



--End date any records being replaced with the updated date from stage
UPDATE sat
	SET sat.LoadEndDate = DATEADD(ss, -1, stg.NewLoadDate)
FROM
	[DW].[SatWellStatus] sat
INNER JOIN
	#new_staged_ihs_well_statuses stg
ON
	sat.WellHashKey = stg.WellHashKey AND
	sat.RecordSource = stg.RecordSource AND
	sat.LoadDate = stg.OldLoadDate

--Insert any records being replaced
INSERT INTO 
	[DW].[SatWellStatus]
(
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[Status],
	[Activity],
	[Classification]
)
SELECT
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[Status],
	stg.[Activity],
	stg.[Classification]
FROM
	[DW].[vw_IHSWellStatusSatStageData] stg
INNER JOIN
	#new_staged_ihs_well_statuses sat
ON
	stg.WellHashKey = sat.WellHashKey AND
	stg.RecordSource = sat.RecordSource AND
	stg.LoadDate = sat.NewLoadDate

IF OBJECT_ID('tempdb..#new_staged_ihs_well_statuses') IS NOT NULL DROP TABLE #new_staged_ihs_well_statuses



END