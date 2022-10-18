

/******************************
** Name: [vw_BOLOAFEEstimatesSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  09/11/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    09/11/2019   Aaron     Object creation
I noticed that this is only pulling data for a hand-full of AFE's.  There isn't a lot of data in wv, so maybe that is the reason?
*******************************/

CREATE VIEW [DW].[vw_BOLOAFEEstimatesSatStageData] AS
SELECT DISTINCT
	HASHBYTES('SHA2_256', proj.PROJ_NO) AS [AFEHashKey],
	'WELLVIEW JOB REPORT' AS [RecordSource],
	CONVERT(DATETIME2(7), jrcg.sysmoddate) AS [AccountingPeriod],
	jrcg.idrec AS JobReportCostGenID,
	CONVERT(DATETIME2(7), jrcg.sysmoddate) AS [LoadDate],
	CONVERT(DATETIME2(7), NULL) AS [LoadEndDate],
	jrcg.cost AS [Amount]
FROM
	[StagePeloton].[wvjobreportcostgen] jrcg WITH (NOLOCK)
INNER JOIN
	[StagePeloton].[wvjobreport] jr WITH (NOLOCK)
ON
	jrcg.idrecparent = jr.idrec
INNER JOIN
	[StagePeloton].[wvjobafe] ja WITH (NOLOCK)
ON
	jr.idrecparent = ja.idrecparent
INNER JOIN
	[StageBOLO].[PROJ] proj WITH (NOLOCK)
ON
	ja.afenumber = proj.PROJ_NO