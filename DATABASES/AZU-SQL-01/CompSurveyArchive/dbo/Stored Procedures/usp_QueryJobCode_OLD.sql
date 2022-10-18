
CREATE PROC [dbo].[usp_QueryJobCode_OLD] @CodeJson AS nvarchar(max)
AS
BEGIN
	-- Update the JobCodeQuery table
	TRUNCATE TABLE dbo.JobCodeQuery;
	INSERT INTO dbo.JobCodeQuery 
		(
		[Job Code],
		[Source],
		[TabName],
		[Industry],
		[Corporate-Noncorporate],
		[Rev Responsibility-Location-Other],
		[Family],
		[Sub-Family],
		[Specialization],
		[Mercer Job Type],
		[AonHewitt Scope From],
		[AonHewitt Scope To],
		[AonHewitt Scope Desc]
		) 
	SELECT *
	FROM OPENJSON(@CodeJson) 
	WITH (
		[Job Code] [varchar](4000),
		[Source] [varchar](4000),
		[TabName] [varchar](4000),
		[Industry] [varchar](4000),
		[Corporate-Noncorporate] [varchar](4000),
		[Rev Responsibility-Location-Other] [varchar](4000),
		[Family] [varchar](4000),
		[Sub-Family] [varchar](4000),
		[Specialization] [varchar](4000),
		[Mercer Job Type] [varchar](4000),
		[AonHewitt Scope From] [varchar](4000),
		[AonHewitt Scope To] [varchar](4000),
		[AonHewitt Scope Desc] [varchar](4000)
		);
	
	-- Get results
	SELECT 
		[Job Title]
      ,A.[Job Code]
	  ,A.[Source]
      ,A.[TabName]
      ,[Inc]
      ,[Cos]
      ,[Effective Date]
      ,[Base 25th Percentile]
      ,[Base 50th Percentile]
      ,[Base 75th Percentile]
      ,[Base 90th Percentile]
      ,[Actual TC 25th Percentile]
      ,[Actual TC 50th Percentile]
      ,[Actual TC 75th Percentile]
      ,[Actual TC 90th Percentile]
      ,[Target TC 25th Percentile]
      ,[Target TC 50th Percentile]
      ,[Target TC 75th Percentile]
      ,[Target TC 90th Percentile]
      ,[LTI 25th Percentile]
      ,[LTI 50th Percentile]
      ,[LTI 75th Percentile]
      ,[LTI 90th Percentile]
      ,[Total Direct Actual 25th Percentile]
      ,[Total Direct Actual 50th Percentile]
      ,[Total Direct Actual 75th Percentile]
      ,[Total Direct Actual 90th Percentile]
      ,[Target TDC 25th Percentile]
      ,[Target TDC 50th Percentile]
      ,[Target TDC 75th Percentile]
      ,[Target TDC 90th Percentile]
      ,[Calc AI % 25th Percentile]
      ,[Calc AI % 50th Percentile]
      ,[Calc AI % 75th Percentile]
      ,[Calc AI % 90th Percentile]
      ,[Calc LTI % 25th Percentile]
      ,[Calc LTI % 50th Percentile]
      ,[Calc LTI % 75th Percentile]
      ,[Calc LTI % 90th Percentile]
      ,A.[Industry]
      ,A.[Corporate-Noncorporate]
      ,A.[Rev Responsibility-Location-Other]
      ,A.[Family]
      ,A.[Sub-Family]
      ,A.[Specialization]
      ,[Job Description]
      ,A.[Mercer Job Type]
      ,A.[AonHewitt Scope From]
      ,A.[AonHewitt Scope To]
      ,A.[AonHewitt Scope Desc]
      ,[CreatedDate]
	FROM dbo.Combined A
	INNER JOIN dbo.JobCodeQuery B
	ON A.[Job Code] = B.[Job Code]
	AND (A.[Source] = B.[Source] or B.[Source] is null)
	AND (A.[TabName] = B.[TabName] or B.[TabName] is null)
	AND (A.[Industry] = B.[Industry] or B.[Industry] is null)
	AND (A.[Corporate-Noncorporate] = B.[Corporate-Noncorporate] or B.[Corporate-Noncorporate] is null)
	AND (A.[Rev Responsibility-Location-Other] = B.[Rev Responsibility-Location-Other] or B.[Rev Responsibility-Location-Other] is null)
	AND (A.[Family] = B.[Family] or B.[Family] is null)
	AND (A.[Sub-Family] = B.[Sub-Family] or B.[Sub-Family] is null)
	AND (A.[Specialization] = B.[Specialization] or B.[Specialization] is null)
	AND (A.[Mercer Job Type] = B.[Mercer Job Type] or B.[Mercer Job Type] is null)
	AND (A.[AonHewitt Scope From] = B.[AonHewitt Scope From] or B.[AonHewitt Scope From] is null)
	AND (A.[AonHewitt Scope To] = B.[AonHewitt Scope To] or B.[AonHewitt Scope To] is null)
	AND (A.[AonHewitt Scope Desc] = B.[AonHewitt Scope Desc] or B.[AonHewitt Scope Desc] is null)
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobCode_OLD] TO [RunCompModel]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobCode_OLD] TO [TLN\CMartin]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobCode_OLD] TO [TLN\mgriffith]
    AS [dbo];

