
/******************************
** Name:  [vw_PelotonWellHubStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/10/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/10/2019   Aaron     Object creation
*******************************/
CREATE VIEW [DW].[vw_PelotonWellHubStageData] AS
SELECT
	wh.WellHashKey,
	wh.RecordSource,
	wh.LoadDate,
	wh.API14
FROM
(
		SELECT
			HASHBYTES('SHA2_256', LEFT(wh1.wellida, 14)) AS WellHashKey,
			'Peloton Well Header' AS RecordSource,
			COALESCE(wh1.sysmoddate, GETDATE()) AS LoadDate,
			LEFT(wh1.wellida, 14) AS API14,
			ROW_NUMBER() OVER (PARTITION BY LEFT(wh1.wellida, 14) ORDER BY wh1.sysmoddate DESC, wh1.idwell DESC) AS WellAPISequence
		FROM
			StagePeloton.wvwellheader wh1 WITH (NOLOCK)
		WHERE
			wh1.wellida IS NOT NULL
) wh
WHERE
	wh.WellAPISequence = 1