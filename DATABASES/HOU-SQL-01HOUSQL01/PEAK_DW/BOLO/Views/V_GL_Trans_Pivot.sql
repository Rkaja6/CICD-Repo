


CREATE VIEW [BOLO].[V_GL_Trans_Pivot] AS

SELECT 
	A.[Cost_Center],
	A.Cost_Center_Number,
	COALESCE(B.Budget_Cost_Center,A.[Cost_Center]) AS Budget_Cost_Center,
	[Cost_Center_Type],
	[State],
	[County],
	[District],
	[Area],
	[Field],
	[Operator],
	[Operated_Property_Flag],
	[WellName],
	[API_Well_No],
	Acctg_Period,
	Gross_Net_Flag,
	COALESCE(Budget_Category,Row_Heading) AS Budget_Heading,
	-- Note that Budget includes gas processing and trans in the gas revenues. 
	-- Need to make an adjustment for these gas revenue deductions
	SUM(
		CASE WHEN Row_Order = 20
			THEN -Transaction_Value
			ELSE Transaction_Value
		END) AS Transaction_Value
FROM BOLO.V_GL_Trans A
LEFT JOIN BOLO.Budget_CC B
	ON B.Cost_Center_Number = A.Cost_Center_Number
where [Hierarchy_Name] = 'NET LOS'
	AND [Gross_Net_Flag] = 'N'
	AND SOURCE_TABLE NOT IN ('TRANS','GL.DET')
GROUP BY 
	A.[Cost_Center],
	A.Cost_Center_Number,
	B.Budget_Cost_Center,
	[Cost_Center_Type],
	[State],
	[County],
	[District],
	[Area],
	[Field],
	[Operator],
	[Operated_Property_Flag],
	[WellName],
	[API_Well_No],
	Acctg_Period,
	Gross_Net_Flag,
	COALESCE(Budget_Category,Row_Heading)