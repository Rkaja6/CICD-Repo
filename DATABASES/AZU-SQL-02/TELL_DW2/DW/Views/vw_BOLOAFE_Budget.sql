
/******************************
** Name:  [vw_BOLO_AFE_Budget]
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
CREATE VIEW [DW].[vw_BOLOAFE_Budget] AS
SELECT 
	B.ACCT,
	B.COMPANY,
	B.COST_CENTER,
	CAST(A.ACCTG_PERIODS AS DATE) AS ACCTG_PERIOD,
	A.STAT1_AMTS AS [Value],
	AFE.PROJECT AS AFE_Number,
	AFE.DESCRIPTION AS AFE_Description,
	AFE.STATUS AS AFE_Status
FROM StageBOLO.[GL_BUD] B WITH (NOLOCK)	
LEFT JOIN StageBOLO.[GL_BUD_ACCTG_PER] A WITH (NOLOCK)	
on B.u2_id = A.u2_id
LEFT JOIN StageBOLO.PROJ AFE WITH (NOLOCK)
on AFE.u2_id = B.PROJ
where PROJ is not null