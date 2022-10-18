
/******************************
** Name:  [vw_DIWellOriginHubStageData]
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
CREATE VIEW [DW].[vw_DIWellOriginHubStageData] AS
SELECT
	WellOriginHashKey,
	RecordSource,
	LoadDate,
	API10
FROM
(
		SELECT
			HASHBYTES('SHA2_256', LEFT(wo1.GovernmentID, 10)) AS WellOriginHashKey,
			wo1.RecordSource,
			COALESCE(wo1.UpdatedDate, GETDATE()) AS LoadDate,
			LEFT(wo1.GovernmentID, 10) AS API10,
			ROW_NUMBER() OVER (PARTITION BY LEFT(wo1.GovernmentID, 10) ORDER BY wo1.Priority, wo1.UpdatedDate DESC, wo1.UID DESC) AS WellOriginAPISequence
		FROM
		(
				SELECT 
					1 AS Priority,
					LEFT(wo2.GovernmentID, 10) AS GovernmentID,
					'DI Well Origins' AS RecordSource,
					CONVERT(DATETIME2(7), wo2.UpdatedDate) AS UpdatedDate,
					CONVERT(VARCHAR(30), wo2.UID) AS UID
				FROM
					StageDI.WellOrigins wo2 WITH (NOLOCK)
			UNION ALL
				SELECT 
					2 AS Priority,
					LEFT(wr.API10, 10) AS GovernmentID,
					'DI Well Rollups' AS RecordSource,
					wr.UpdatedDate AS UpdatedDate,
					--For UID to 0 so that WellBore ID takes priority
					wr.UWI AS UID
				FROM
					StageDI.WellRollups wr WITH (NOLOCK)
			
		) wo1
) wo
WHERE
	wo.WellOriginAPISequence = 1