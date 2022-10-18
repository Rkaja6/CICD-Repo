
/**
========================
Name: RPT.Proc_AvgWorkerCountDetail
Created By: Dee Glazebrook
Purpose: Calculate the average number of workers in a year
Notes: 
	- If this is run with a YearEndDate greater than today's date, it assumes that all active employees continue working until the YearEndDate.
	- Contractor type Contingent Workers count as Employees for Worked Hours reporting (OSHA says they are employees).
========================
**/
Create Procedure RPT.Proc_AvgWorkerCountDetail
(@YearStartDate date, @YearEndDate date)
AS
BEGIN

	SELECT
		[Employee ID],
		[Legal Name],
		[Hire Date],
		[Termination Date],
		[Worker Type],
		[Contingent Worker Type],
		CASE [Worker Type]
			WHEN 'Employee' THEN 'Employee'
			ELSE
			CASE [Contingent Worker Type]
				WHEN 'Contractor' THEN 'Employee'
				ELSE 'Other Workers'
			END
		END AS WorkerType,
		CASE WHEN [Termination Date] IS NULL 

			THEN -- Employee is still Active
			
				CASE WHEN YEAR([Hire Date]) = YEAR(@YearStartDate)

					THEN -- Employee was hired in the current year
						DATEDIFF(DAY,[Hire Date], @YearEndDate)

					ELSE -- Employee was hired in a previous year 
						DATEDIFF(DAY, DATEADD(DAY, -1, @YearStartDate), @YearEndDate)
					
				END

			ELSE -- Employee is been terminated
			
				CASE WHEN YEAR([Hire Date]) = YEAR(@YearStartDate)
				
					THEN -- Employee was hired in the current year
						DATEDIFF(DAY,[Hire Date],[Termination Date])

					ELSE -- Employee was hired in a previous year 
						DATEDIFF(DAY, DATEADD(DAY, -1, @YearStartDate), [Termination Date])
				END
			
		END AS YearFraction
	FROM [RPT].[All_Workers]
	WHERE
	([Termination Date] is null OR YEAR([Termination Date]) = YEAR(@YearStartDate))

END