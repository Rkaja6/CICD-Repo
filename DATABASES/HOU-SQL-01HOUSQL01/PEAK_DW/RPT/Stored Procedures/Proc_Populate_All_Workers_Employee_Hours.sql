



CREATE PROCEDURE [RPT].[Proc_Populate_All_Workers_Employee_Hours]
AS
BEGIN
	
	-- Truncate and reload All Wokers
	TRUNCATE TABLE RPT.All_Workers;

	INSERT INTO RPT.All_Workers
	SELECT 
		S.[Employee ID]
      ,S.[Legal Name]
      ,S.[Hire Date]
      ,CASE
		WHEN S.[Worker Status] = 'Active' THEN NULL
		ELSE S.[Termination Date]
	   END AS [Termination Date]
      ,S.[Worker Status]
      ,S.[Work Address - Country] AS [Country]
      ,S.[Worker Type]
      ,
	  CASE
		WHEN CHARINDEX(')', S.[Worker's Manager]) = 0 Then NULL
		ELSE REVERSE(SUBSTRING(REVERSE(S.[Worker's Manager]), CHARINDEX(')', REVERSE(S.[Worker's Manager])) + 1, 4))
	  END AS [Manager ID]
      ,CASE
		WHEN CHARINDEX('(', S.[Worker's Manager]) = 0 Then S.[Worker's Manager]
		ELSE LEFT(S.[Worker's Manager], CHARINDEX('(', S.[Worker's Manager]) - 2)
	   END AS [Manager Name]
      ,S.[Location] AS [Workday Location]
      ,L.[Location_Short_Name] AS [Location]
      ,NULL AS [Department]
	  ,S.[Contingent Worker Type]
	  ,S.[Time Type]
	FROM RPT.Stage_All_Workers S
	LEFT JOIN RPT.Office_Location L
		ON S.[Location] = L.[Workday_Location]
	WHERE S.[Employee ID] IS NOT NULL;

	-- Merge Employee Hours
	WITH CTE AS
	(
	SELECT
		[EE ID],
		[NAME],
		[Period],
		SUM([Hours (unprorated) Related Calculation]) AS WorkedHours
	FROM RPT.Stage_Employee_Hours
	WHERE [EE ID] IS NOT NULL
	GROUP BY
		[EE ID],
		[NAME],
		[Period]
	)
	MERGE RPT.Employee_Hours Tgt
	USING CTE Src
	ON (Src.[EE ID] = Tgt.[Employee ID]
		AND CAST(LEFT(Src.[Period], CHARINDEX('-',Src.[Period]) - 2) AS DATE) = CAST(Tgt.[Period Start Date] AS DATE))
	WHEN MATCHED
		THEN UPDATE 
			SET Tgt.[Legal Name] = Src.[NAME],
				Tgt.[Period End Date] = CAST(SUBSTRING(Src.[Period], CHARINDEX('-', Src.[Period]) + 2, CHARINDEX('(', Src.[Period]) - CHARINDEX('-', Src.[Period]) - 4) AS DATE),
				Tgt.[Worked Hours in Period] = Src.WorkedHours
	WHEN NOT MATCHED BY TARGET
		THEN INSERT ([Employee ID],[Legal Name],[Period Start Date],[Period End Date],[Worked Hours In Period])
		VALUES
		(
		Src.[EE ID],
		Src.[NAME],
		CAST(LEFT(Src.[Period], CHARINDEX('-',Src.[Period]) - 2) AS DATE),
		CAST(SUBSTRING(Src.[Period], CHARINDEX('-', Src.[Period]) + 2, CHARINDEX('(', Src.[Period]) - CHARINDEX('-', Src.[Period]) - 4) AS DATE),
		Src.WorkedHours
		);

END