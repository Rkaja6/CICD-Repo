

Create View [BOLO].[V_GL_Acctg_Periods] AS
select distinct 
	T.ACCTG_PERIOD
from bolo.TRANS T
INNER JOIN [ETL].[Hierarchy_COA] H
	ON T.ACCT = H.ACCT
WHERE H.Hierarchy_Name in ('GROSS LOS','NET LOS')