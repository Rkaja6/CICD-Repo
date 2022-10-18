

/******************************
** Name:  [vw_IHSWellboreHubStageData]
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
CREATE VIEW [DW].[vw_IHSWellboreHubStageData] AS
SELECT
	WellboreHashKey,
	RecordSource,
	LoadDate,
	API12
FROM
(
		SELECT
			HASHBYTES('SHA2_256', wb1.API12) AS WellboreHashKey,
			wb1.RecordSource,
			COALESCE(wb1.UpdatedDate, GETDATE()) AS LoadDate,
			wb1.API12,
			ROW_NUMBER() OVER (PARTITION BY LEFT(wb1.API12, 12) ORDER BY wb1.Priority, wb1.UpdatedDate DESC, wb1.UID DESC) AS WellBoreAPISequence
		FROM
		(
				SELECT 
					1 AS Priority,
					LEFT(pw.API, 12) AS API12,
					'IHS Production Well' AS RecordSource,
					CONVERT(DATETIME2(7), pw.CADIS_SYSTEM_UPDATED) AS UpdatedDate,
					pw.ENTITY AS UID
				FROM
					[StageIHS].[T_PRODUCTION_PRODUCTION_WELL] pw WITH (NOLOCK)
				WHERE
					pw.API IS NOT NULL
			UNION ALL
				SELECT 
					2 AS Priority,
					LEFT(wh.API_NUMBER, 12) AS API12,
					'IHS Well Header' AS RecordSource,
					wh.CADIS_SYSTEM_UPDATED AS UpdatedDate,
					--For UID to 0 so that WellBore ID takes priority
					wh.UWI AS UID
				FROM
					[StageIHS].[T_WELL_HEADER] wh WITH (NOLOCK)
				WHERE
					wh.API_NUMBER IS NOT NULL
			
		) wb1
) wb
WHERE
	wb.WellBoreAPISequence = 1