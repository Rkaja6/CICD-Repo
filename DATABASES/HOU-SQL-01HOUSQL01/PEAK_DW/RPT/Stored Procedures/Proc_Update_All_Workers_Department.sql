
CREATE PROCEDURE [RPT].[Proc_Update_All_Workers_Department]
AS
BEGIN
	
	-- Take department heads out of worker population so they don't take on the department of their manager 
	-- (i.e., John will be Upstream even though he reports to a manager in the Corporate dept)
	WITH Workers AS
	(
	SELECT 
		W.[Employee ID],
		W.[Manager ID]
	FROM RPT.All_Workers W
	LEFT JOIN RPT.Department_Head D
		ON W.[Employee ID] = D.Manager_Employee_ID
	WHERE D.Department_Name IS NULL
	),
	RecursiveCTE AS
	(
	-- Start at the top with either Department Heads or people whose managers = NULL
	SELECT
		COALESCE(D.Department_Name,'Corporate') AS Department,
		W.[Employee ID]
	FROM RPT.All_Workers W
	LEFT JOIN RPT.Department_Head D
		ON W.[Employee ID] = D.Manager_Employee_ID
	WHERE 
		W.[Manager ID] IS NULL 
		OR D.Department_Name IS NOT NULL
	UNION ALL
	-- Find the people who report to them and use the manager's department
	SELECT
		R.Department,
		W.[Employee ID]
	FROM Workers W
	INNER JOIN RecursiveCTE R
		ON W.[Manager ID] = R.[Employee ID]
	)
	UPDATE Tgt
	SET Department = COALESCE(Src.Department,'Corporate')
	FROM RPT.All_Workers Tgt
	LEFT JOIN RecursiveCTE Src
		ON Tgt.[Employee ID] = Src.[Employee ID]
END