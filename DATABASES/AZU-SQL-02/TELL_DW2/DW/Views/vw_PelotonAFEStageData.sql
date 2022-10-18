

/******************************
** Name:  [vw_PelotonAFEStageData]
** Desc:
** Auth:  Dee Glazebrook
** Date:  11/20/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/20/2019   Dee       Object creation
*******************************/
CREATE VIEW [DW].[vw_PelotonAFEStageData] AS
SELECT DISTINCT
	HASHBYTES('SHA2_256', CONCAT(afenumber,'_651')) AS AFEHashKey,
	'WellView JobAFE' AS RecordSource,
	A.sysmoddate AS LoadDate,
	CONVERT(DATETIME2 (7), NULL) AS LoadEndDate,
	CONVERT(VARCHAR(50), CONCAT(afenumber,'_651')) AS AFENumber,
	costtyp as [AFE_CATEGORY],
	dttmafe AS AFE_DATE,
	typ as AFE_TYPE,
	projectname as [NAME],
	afestatus as [STATUS],
	afenumbersupp as SUPPLEMENT_NO,
	dttmafeclose as EXP_DATE,
	workingint,
	workingintnote,
	w.wellida AS API14,
-- may have to revisit this code when we start doing AFE supplements.
	HASHBYTES('SHA2_256', CONCAT(afenumbersupp,'_651')) AS SuppAFEHashKey,
	HASHBYTES('SHA2_256', CONCAT(afenumber,'_651','|',afenumbersupp,'_651')) AS [LinkAFESuppHashKey]
FROM 
	[StagePeloton].wvjobafe A
--LEFT JOIN 
--	[StagePeloton].wvjob J
--ON 
--	J.idrec = A.idrecparent
LEFT JOIN 
	StagePeloton.wvwellheader w
ON
	W.idwell = A.idwell
WHERE
-- Don't include AFEs from a prior company
	A.systag is null