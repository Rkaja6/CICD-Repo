
/******************************
** Name: [vw_DIProductionHeaderSatStageData]
** Desc:
** Auth: Aaron Vogt
** Date: 09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
** 2    09/25/2019   Aaron V   Changed LoadEndDate to represent the DeletedDate to allow the handling of records that DI expires.
*******************************/
CREATE VIEW [DW].[vw_DIProductionHeaderSatStageData] AS
SELECT
	HASHBYTES('SHA2_256', ph1.ApiNo) AS WellHashKey,
	'DI Production Header' AS RecordSource,
	CONVERT(DATETIME2(7), ph1.[UpdatedDate]) AS LoadDate,
	CONVERT(DATETIME2(7), 
		CASE
			WHEN DeletedDate = '01/01/1900' THEN NULL
			ELSE DeletedDate
		END
		) AS LoadEndDate,
	CONVERT(VARCHAR(40), NULL) AS IHSEntity,
	ph1.EntityId AS DIEntityId
FROM
	[StageDI].[ProducingEntities] ph1 WITH (NOLOCK)