
/******************************
** Name:  [vw_IHSWellOriginHubStageData]
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
CREATE VIEW [DW].[vw_IHSWellOriginHubStageData] AS
SELECT
	WellOriginHashKey,
	RecordSource,
	LoadDate,
	API10
FROM
(
		SELECT
			HASHBYTES('SHA2_256', wb1.API10) AS WellOriginHashKey,
			wb1.RecordSource,
			COALESCE(wb1.UpdatedDate, GETDATE()) AS LoadDate,
			wb1.API10,
			ROW_NUMBER() OVER (PARTITION BY LEFT(wb1.API10, 10) ORDER BY wb1.Priority, wb1.UpdatedDate DESC, wb1.UID DESC) AS WellOriginAPISequence
		FROM
		(
				SELECT 
					1 AS Priority,
					LEFT(pw.API, 10) AS API10,
					'IHS Production Well' AS RecordSource,
					CONVERT(DATETIME2(7), pw.CADIS_SYSTEM_UPDATED) AS UpdatedDate,
					pw.ENTITY AS UID
				FROM
					[StageIHS].[T_PRODUCTION_PRODUCTION_WELL] pw WITH (NOLOCK)
			UNION ALL
				SELECT 
					2 AS Priority,
					LEFT(wh.API_NUMBER, 10) AS API10,
					'IHS Well Header' AS RecordSource,
					wh.CADIS_SYSTEM_UPDATED AS UpdatedDate,
					--For UID to 0 so that WellOrigin ID takes priority
					wh.UWI AS UID
				FROM
					[StageIHS].[T_WELL_HEADER] wh WITH (NOLOCK)
			
		) wb1
) wb
WHERE
	wb.WellOriginAPISequence = 1