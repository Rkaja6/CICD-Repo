






CREATE PROC [dbo].[usp_ReturnJobCodeQuery] @CodeJson AS nvarchar(max)
AS
BEGIN

	-- Get results
	SELECT 
		[Job Title]
      ,A.[UID]
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
	  ,A.[YearCode]
	  ,A.[PublisherCode]
      ,A.[TypeCode]
      ,A.[WeightCode]
      ,A.[CorpCode]
      ,A.[IndustryCode]
      ,A.[RegionCode]
	  ,A.[SubRegionCode]
	  ,A.[StateCode]
	  ,A.CityCode
      ,A.[DeptCode]
      ,A.[DetailCode]
      ,A.[ScopeCode]
    FROM dbo.Combined_Indexed A
	INNER JOIN 
		(SELECT [Job Code]
	  ,[YearCode]
		FROM OPENJSON(@CodeJson) 
		WITH (
		[Job Code] [varchar](50),
		[YearCode] [varchar](4)
		) 
		)B
	ON  A.[Job Code] = B.[Job Code]
	WHERE A.YearCode = B.YearCode OR B.YearCode is null

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_ReturnJobCodeQuery] TO [RunCompModel]
    AS [dbo];

