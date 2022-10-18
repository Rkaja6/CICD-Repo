
/******************************
** Name:  [vw_TellDWWellOriginPropNumSatStageData]
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
CREATE VIEW
	[DW].[vw_TellDWWellOriginPropNumSatStageData] AS
SELECT
	*
FROM
(SELECT 
	HASHBYTES('SHA2_256', acp1.API10) AS WellOriginHashKey,
	'Tell DW' AS RecordSource,
	--Right now, there is no date associated with when a record was inserted/updated in Tell_DW.AC_PROPERTY.  We should consider adding one.
	GETDATE() AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	acp1.PROPNUM AS PropNum,
	ROW_NUMBER() OVER (PARTITION BY acp1.API10 ORDER BY acp1.DATE_COMP DESC, acp1.START_DATE DESC, acp1.PROPNUM DESC) AS PropNumSequence
FROM
	[StageAries].[AC_PROPERTY] acp1 WITH (NOLOCK)) acp
WHERE
	PropNumSequence = 1