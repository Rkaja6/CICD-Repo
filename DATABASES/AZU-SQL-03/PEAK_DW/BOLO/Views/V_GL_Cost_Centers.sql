
Create View [BOLO].[V_GL_Cost_Centers] AS
select distinct 
	CC.Cost_Center,
	CC.Cost_Center_Number,
	CC.Cost_Center_Type
from bolo.TRANS T
INNER JOIN [BOLO].[Cost_Center] CC
	ON CC.[CC_UID] = T.COST_CENTER
INNER JOIN [ETL].[Hierarchy_COA] H
	ON T.ACCT = H.ACCT
WHERE H.Hierarchy_Name in ('GROSS LOS','NET LOS')