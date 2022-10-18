/******************************
** Name:  [sp_TransformInsertStagedProducingEntityData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
** 2    09/24/2019   Aaron V   Changed the LoadEndDate Population query to use inner join.  It was end dating everything
** 3    09/25/2019   Aaron V   Added logic to set LoadEndDate for any records that are marked as DELETED in DI
--If an entity is deleted in stage, mark it with load end date = deleted date on satellite.  Use entity id for identification.
--Insert any entity that doesn't exist for hash, source and load date for entities that aren't deleted
--If record is updated should you end and replace it?  I don't think so, not given the entity id's that are contained here currently
--so shouldn't we just use Created Date instead for Load Date?
******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedProducingEntityData] AS

BEGIN

UPDATE sat
SET
	sat.LoadEndDate = DATEADD(ss, -1, ISNULL(stg.LoadDate, GETDATE())) 
FROM
	[DW].[SatProducingEntityUID] sat
INNER JOIN
	[DW].[vw_DIProductionHeaderSatStageData] stg
ON
	sat.DIEntityID = stg.DIEntityId AND
	sat.RecordSource = stg.RecordSource AND
	sat.LoadDate = stg.LoadDate
WHERE
	stg.LoadEndDate IS NOT NULL AND
	sat.LoadEndDate IS NULL

UPDATE sat
SET
	sat.LoadEndDate = DATEADD(ss, -1, ISNULL(stg.LoadDate, GETDATE())) 
FROM
	[DW].[SatProducingEntityUID] sat
INNER JOIN
	[DW].[vw_DIProductionHeaderSatStageData] stg
ON
	sat.DIEntityID = stg.DIEntityId AND
	sat.RecordSource = stg.RecordSource AND
	sat.LoadDate = stg.LoadDate AND
	sat.WellHashKey <> stg.WellHashKey
WHERE
	----Aaron Vogt - If record is already expired, it shouldn't be touched
	sat.LoadEndDate IS NOT NULL

UPDATE sat
SET
	sat.LoadEndDate = DATEADD(ss, -1, ISNULL(stg.LoadDate, GETDATE())) 
FROM
	[DW].[SatProducingEntityUID] sat
INNER JOIN
	[DW].[vw_IHSProductionHeaderSatStageData] stg
ON
	sat.IHSEntity = stg.IHSEntity AND
	sat.RecordSource = stg.RecordSource AND
	sat.WellHashKey <> stg.WellHashKey
WHERE
	----Aaron Vogt - If record is already expired, it shouldn't be touched
	sat.LoadEndDate IS NOT NULL

IF OBJECT_ID('tempdb..#getmaxentitysequences') IS NOT NULL DROP TABLE #getmaxentitysequences

SELECT 
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	MAX([EntitySequence])+1 AS MaxEntitySequence
INTO
	#getmaxentitysequences
FROM
	[DW].[SatProducingEntityUID] WITH (NOLOCK)
/*****
	--Aaron Vogt - We are only getting the next entity sequence, so we need to consider expired records, as these
	--affect the PK
	WHERE
	LoadEndDate IS NULL
****/
GROUP BY
	[WellHashKey],
	[RecordSource],
	[LoadDate]

INSERT INTO
	[DW].[SatProducingEntityUID]
(
	[WellHashKey],
	[EntitySequence],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[IHSEntity],
	[DIEntityID]
)
SELECT
	stg.[WellHashKey],
	ISNULL(seq.MaxEntitySequence, 2000) +
		ROW_NUMBER() OVER (PARTITION BY stg.WellHashKey, stg.RecordSource, stg.LoadDate 
			ORDER BY stg.LoadDate DESC, stg.DIEntityId DESC),
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[IHSEntity],
	stg.[DIEntityId]
FROM
	[DW].[vw_DIProductionHeaderSatStageData] stg
LEFT JOIN
	[DW].[SatProducingEntityUID] sat WITH (NOLOCK)
ON
	stg.WellHashKey = sat.WellHashKey AND
	stg.RecordSource = sat.RecordSource AND
	stg.LoadDate = sat.LoadDate 
LEFT JOIN
	#getmaxentitysequences seq
ON
	stg.WellHashKey = seq.WellHashKey AND
	stg.LoadDate = seq.LoadDate AND
	stg.RecordSource = seq.RecordSource
WHERE
	sat.WellHashKey IS NULL AND
	stg.LoadEndDate IS NULL

INSERT INTO
	[DW].[SatProducingEntityUID]
(
	[WellHashKey],
	[EntitySequence],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[IHSEntity],
	[DIEntityID]
)
SELECT
	stg.[WellHashKey],
	ISNULL(seq.MaxEntitySequence, 2000) +
		ROW_NUMBER() OVER (PARTITION BY stg.WellHashKey, stg.RecordSource, stg.LoadDate 
			ORDER BY stg.LoadDate DESC, stg.IHSEntity DESC),
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[IHSEntity],
	stg.[DIEntityID]
FROM
	[DW].[vw_IHSProductionHeaderSatStageData] stg
LEFT JOIN
	[DW].[SatProducingEntityUID] sat WITH (NOLOCK)
ON
	stg.WellHashKey = sat.WellHashKey AND
	stg.RecordSource = sat.RecordSource AND
	stg.LoadDate = sat.LoadDate
LEFT JOIN
	#getmaxentitysequences seq
ON
	stg.WellHashKey = seq.WellHashKey AND
	stg.LoadDate = seq.LoadDate AND
	stg.RecordSource = seq.RecordSource
WHERE
	sat.WellHashKey IS NULL AND
	stg.LoadEndDate IS NULL



IF OBJECT_ID('tempdb..#getmaxentitysequences') IS NOT NULL DROP TABLE #getmaxentitysequences
END