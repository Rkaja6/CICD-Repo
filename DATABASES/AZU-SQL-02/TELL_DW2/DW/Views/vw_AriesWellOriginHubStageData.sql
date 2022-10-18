

/******************************
** Name:  [wo.API10]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/09/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/09/2019   Aaron     Object creation
** 2    12/30/2019   Dee       Load dates should be data vault system dates, not source system dates
*******************************/
CREATE VIEW [DW].[vw_AriesWellOriginHubStageData] AS
SELECT
	WellOriginHashKey,
	RecordSource,
	LoadDate,
	API10
FROM
(
		SELECT
			HASHBYTES('SHA2_256', LEFT(wo.API10, 10)) AS WellOriginHashKey,
			wo.RecordSource,
			GETDATE() AS LoadDate,
			LEFT(wo.API10, 10) AS API10,
			ROW_NUMBER() OVER (PARTITION BY LEFT(wo.API10, 10) ORDER BY wo.START_DATE DESC, wo.PROPNUM DESC) AS WellOriginAPISequence
		FROM
		(
				SELECT 
					LEFT(acp.API10, 10) AS API10,
					'Aries AC Property' AS RecordSource,
					CONVERT(DATETIME2(7), acp.START_DATE) AS START_DATE,
					CONVERT(VARCHAR(12), acp.PROPNUM) AS PROPNUM
				FROM
					[StageAries].[AC_PROPERTY]	acp	WITH (NOLOCK)	
		) wo
) wo
WHERE
	wo.WellOriginAPISequence = 1