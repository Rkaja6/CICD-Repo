





CREATE PROC [dbo].[usp_ReturnJobCodeQuery_OLD] @CodeJson AS nvarchar(max)
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
		(SELECT [UID]
      ,[Job Code]
	  ,[YearCode]
      ,[PublisherCode]
      ,[TypeCode]
      ,[WeightCode]
      ,[RegionCode]
	  ,[SubRegionCode]
	  ,[StateCode]
	  ,[CityCode]
      ,[DeptCode]
      ,[IndustryCode]
      ,[CorpCode]
      ,[DetailCode]
      ,[ScopeCode]
		FROM OPENJSON(@CodeJson) 
		WITH (
		[UID] [varchar](500),
		[Job Code] [varchar](50),
		[YearCode] [varchar](4),
		[PublisherCode] [varchar](10),
		[TypeCode] [varchar](10),
		[WeightCode] [varchar](10),
		[RegionCode] [varchar](200),
		[SubRegionCode] [varchar](200),
	    [StateCode] [varchar](10),
	    [CityCode] [varchar](200),
		[DeptCode] [varchar](20),
		[IndustryCode] [varchar](20),
		[CorpCode] [varchar](20),
		[DetailCode] [varchar](200),
		[ScopeCode] [varchar](200)
		) 
		)B
	ON (A.[UID] = B.[UID] OR A.[Job Code] = B.[Job Code])
	WHERE (A.PublisherCode = B.PublisherCode or B.PublisherCode is null)
	AND (A.YearCode = B.YearCode or B.YearCode is null)
	AND (A.TypeCode = B.TypeCode or B.TypeCode is null)
	AND (A.WeightCode = B.WeightCode or B.WeightCode is null)
	AND (A.RegionCode = B.RegionCode or B.RegionCode is null)
	AND (A.SubRegionCode = B.SubRegionCode or B.SubRegionCode is null)
	AND (A.StateCode = B.StateCode or B.StateCode is null)
	AND (A.CityCode = B.CityCode or B.CityCode is null)
	AND (A.DeptCode = B.DeptCode or B.DeptCode is null)
	AND (A.IndustryCode = B.IndustryCode or B.IndustryCode is null)
	AND (A.CorpCode = B.CorpCode or B.CorpCode is null)
	AND (A.DetailCode = B.DetailCode or B.DetailCode is null)
	AND (A.ScopeCode = B.ScopeCode or B.ScopeCode is null)

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_ReturnJobCodeQuery_OLD] TO [RunCompModel]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_ReturnJobCodeQuery_OLD] TO [TLN\ROrdonez]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_ReturnJobCodeQuery_OLD] TO [TLN\BManrriquez]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_ReturnJobCodeQuery_OLD] TO [TLN\mdean]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_ReturnJobCodeQuery_OLD] TO [TLN\CMartin]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_ReturnJobCodeQuery_OLD] TO [TLN\mgriffith]
    AS [dbo];

