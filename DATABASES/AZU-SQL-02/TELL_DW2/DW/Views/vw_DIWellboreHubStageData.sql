


/******************************
** Name:  [vw_DIWellboreHubStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/05/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/05/2019   Aaron     Object creation
** 2    12/10/2019   Dee       Added checks to avoid NULL API 12
*******************************/
CREATE VIEW [DW].[vw_DIWellboreHubStageData] AS
SELECT
	WellboreHashKey,
	RecordSource,
	LoadDate,
	API12
FROM
(
		SELECT
			CONVERT(binary(32), HASHBYTES('SHA2_256', wb1.GovernmentID)) AS WellboreHashKey,
			wb1.RecordSource,
			COALESCE(wb1.UpdatedDate, GETDATE()) AS LoadDate,
			LEFT(wb1.GovernmentID, 12) AS API12,
			ROW_NUMBER() OVER (PARTITION BY LEFT(wb1.GovernmentID, 12) ORDER BY wb1.Priority, wb1.UpdatedDate DESC, wb1.UID DESC) AS WellBoreAPISequence
		FROM
		(
				SELECT 
					1 AS Priority,
					LEFT(wb2.GovernmentID, 12) AS GovernmentID,
					'DI Well Bores' AS RecordSource,
					CONVERT(DATETIME2(7), wb2.UpdatedDate) AS UpdatedDate,
					CONVERT(VARCHAR(30), wb2.UID) AS UID
				FROM
					StageDI.WellBores wb2 WITH (NOLOCK)
				WHERE 
					wb2.GovernmentID IS NOT NULL
			UNION ALL
				SELECT 
					2 AS Priority,
					LEFT(wr.API12, 12) AS GovernmentID,
					'DI Well Rollups' AS RecordSource,
					wr.UpdatedDate AS UpdatedDate,
					--For UID to 0 so that WellBore ID takes priority
					CONVERT(VARCHAR(30), '') AS UID
				FROM
					StageDI.WellRollups wr WITH (NOLOCK)
				WHERE 
					wr.API12 IS NOT NULL
			
		) wb1
) wb
WHERE
	wb.WellBoreAPISequence = 1