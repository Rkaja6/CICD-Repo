
/******************************
** Name:  [vw_PelotonAFEHubStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/11/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/11/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [DW].[vw_PelotonAFEHubStageData] AS
SELECT
	afe.AFEHashKey,
	afe.RecordSource,
	afe.LoadDate,
	afe.AFENumber
FROM
(SELECT DISTINCT
	HASHBYTES('SHA2_256', afe1.[afenumber]) AS AFEHashKey,
	'Peloton Jobs' AS RecordSource,
	CONVERT(DATETIME2(7), afe1.[sysmoddate]) AS LoadDate,
	CONVERT(VARCHAR(50), afe1.[afenumber]) AS AFENumber,
	ROW_NUMBER() OVER (PARTITION BY afe1.[afenumber] ORDER BY afe1.[sysmoddate] DESC, afe1.[afenumber] DESC) AS AFESequence
FROM
	[StagePeloton].[wvjobafe] afe1 WITH (NOLOCK)
) afe
WHERE
	afe.AFESequence = 1