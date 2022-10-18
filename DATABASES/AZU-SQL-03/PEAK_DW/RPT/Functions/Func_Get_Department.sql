CREATE FUNCTION RPT.[Func_Get_Department]
(@Employee_ID NVARCHAR(20))
RETURNS NVARCHAR(20)
AS
BEGIN
	DECLARE @Dept NVARCHAR(20);
	DECLARE @Search_ID NVARCHAR(20);

	-- If the employee is the department head, return the department name
	IF EXISTS (SELECT 1 FROM RPT.Department_Head WHERE Manager_Employee_ID = @Employee_ID)
	BEGIN 
		SELECT @Dept = Department_Name FROM RPT.Department_Head WHERE Manager_Employee_ID = @Employee_ID
	END
	ELSE 
	-- If the employee is not the department head, trace the management chain up until you either reach a NULL (Meg's Manager is NULL) or find a department head 
	BEGIN
		SELECT @Search_ID = @Employee_ID;

		WHILE (@Search_ID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM RPT.Department_Head WHERE Manager_Employee_ID = @Search_ID))
		BEGIN
			SELECT @Search_ID = [Manager ID] FROM RPT.All_Workers WHERE [Employee ID] = @Search_ID
		END

		IF @Search_ID IS NULL 
		BEGIN
			SELECT @Dept = 'Corporate'
		END
		ELSE 
		BEGIN
			SELECT @Dept = [Department_Name] FROM RPT.Department_Head WHERE Manager_Employee_ID = @Search_ID
		END
	END 
	
	RETURN @Dept;
END