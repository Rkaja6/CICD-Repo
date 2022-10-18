




Create View [BOLO].[V_GL_Row_Headings] AS

	select distinct 
		H.Row_Group_Heading,
		CASE H.Row_Heading 
			WHEN '~ACCT.NAME' THEN COA.NAME
			ELSE H.Row_Heading
		END AS Row_Heading,
		Row_Group,
		Row_Order
	from ETL.Hierarchy_COA H
	LEFT JOIN BOLO.COA COA
		ON COA.u2_id = H.ACCT
	WHERE Hierarchy_Name in ('GROSS LOS','NET LOS')
	UNION ALL
	select distinct 
		Row_Group_Heading,
		'TOTAL' AS Row_Heading,
		Row_Group,
		100 AS Row_Order
	from ETL.Hierarchy_COA H
	WHERE Hierarchy_Name in ('GROSS LOS','NET LOS')