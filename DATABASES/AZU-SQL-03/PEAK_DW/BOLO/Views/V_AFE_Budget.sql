﻿

Create view [BOLO].[V_AFE_Budget] AS
SELECT 
	B.ACCT,
	B.COMPANY,
	B.COST_CENTER,
	CAST(A.ACCTG_PERIODS AS DATE) AS ACCTG_PERIOD,
	A.STAT1_AMTS AS [Value],
	AFE.PROJECT AS AFE_Number,
	AFE.DESCRIPTION AS AFE_Description,
	AFE.STATUS AS AFE_Status
FROM BOLO.[GL_BUD] B
LEFT JOIN bolo.[GL_BUD_ACCTG_PER] A
on B.u2_id = A.u2_id
LEFT JOIN BOLO.PROJ AFE
on AFE.u2_id = B.PROJ
where proj is not null