






CREATE PROC [dbo].[usp_InsertJSON] @json AS nvarchar(max)
AS
BEGIN
	INSERT INTO dbo.Combined_STG 
		(
		[Index],
		[Source]
		  ,[TabName]
		  ,[Job Title]
		  ,[Job Code]
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
		  ,[Industry]
		  ,[Corporate-Noncorporate]
		  ,[Rev Responsibility-Location-Other]
		  ,[Family]
		  ,[Sub-Family]
		  ,[Specialization]
		  ,[Job Description]
		  ,[Mercer Job Type]
		  ,[AonHewitt Scope From]
		  ,[AonHewitt Scope To]
	      ,[AonHewitt Scope Desc]
		  ,[AI Percentage 25th Percentile],
		[AI Percentage 50th Percentile],
		[AI Percentage 75th Percentile],
		[AI Percentage 90th Percentile],
		[LTI Percent of Base 25th Percentile],
		[LTI Percent of Base 50th Percentile],
		[LTI Percent of Base 75th Percentile],
		[LTI Percent of Base 90th Percentile],
		[Calc AI % 25th Percentile],
		[Calc AI % 50th Percentile],
		[Calc AI % 75th Percentile],
		[Calc AI % 90th Percentile],
		[Calc LTI % 25th Percentile],
		[Calc LTI % 50th Percentile],
		[Calc LTI % 75th Percentile],
		[Calc LTI % 90th Percentile],
		[CreatedDate]
		  ) 
	SELECT *  
	FROM OPENJSON(@json) 
	WITH (
	[Index] int,
	[Source] [varchar](200) ,
	[TabName] [varchar](200) ,
	[Job Title] [varchar](200) ,
	[Job Code] [varchar](50) ,
	[Inc] [numeric](18, 2) ,
	[Cos] [numeric](18, 2) ,
	[Effective Date] [varchar](10) ,
	[Base 25th Percentile] [numeric](18, 2) ,
	[Base 50th Percentile] [numeric](18, 2) ,
	[Base 75th Percentile] [numeric](18, 2) ,
	[Base 90th Percentile] [numeric](18, 2) ,
	[Actual TC 25th Percentile] [numeric](18, 2) ,
	[Actual TC 50th Percentile] [numeric](18, 2) ,
	[Actual TC 75th Percentile] [numeric](18, 2) ,
	[Actual TC 90th Percentile] [numeric](18, 2) ,
	[Target TC 25th Percentile] [numeric](18, 2) ,
	[Target TC 50th Percentile] [numeric](18, 2) ,
	[Target TC 75th Percentile] [numeric](18, 2) ,
	[Target TC 90th Percentile] [numeric](18, 2) ,
	[LTI 25th Percentile] [numeric](18, 2) ,
	[LTI 50th Percentile] [numeric](18, 2) ,
	[LTI 75th Percentile] [numeric](18, 2) ,
	[LTI 90th Percentile] [numeric](18, 2) ,
	[Total Direct Actual 25th Percentile] [numeric](18, 2) ,
	[Total Direct Actual 50th Percentile] [numeric](18, 2) ,
	[Total Direct Actual 75th Percentile] [numeric](18, 2) ,
	[Total Direct Actual 90th Percentile] [numeric](18, 2) ,
	[Target TDC 25th Percentile] [numeric](18, 2) ,
	[Target TDC 50th Percentile] [numeric](18, 2) ,
	[Target TDC 75th Percentile] [numeric](18, 2) ,
	[Target TDC 90th Percentile] [numeric](18, 2) ,
	[Industry] [varchar](200) ,
	[Corporate-Noncorporate] [varchar](200) ,
	[Rev Responsibility-Location-Other] [varchar](500) ,
	[Family] [varchar](200) ,
	[Sub-Family] [varchar](200) ,
	[Specialization] [varchar](200) ,
	[Job Description] [varchar](8000) ,
	[Mercer Job Type] [varchar](200),
	[AonHewitt Scope From] [varchar](200),
	[AonHewitt Scope To] [varchar](200),
	[AonHewitt Scope Desc] [varchar](200),
	[AI Percentage 25th Percentile] [numeric](18, 2),
	[AI Percentage 50th Percentile] [numeric](18, 2),
	[AI Percentage 75th Percentile] [numeric](18, 2),
	[AI Percentage 90th Percentile] [numeric](18, 2),
	[LTI Percent of Base 25th Percentile] [numeric](18, 2),
	[LTI Percent of Base 50th Percentile] [numeric](18, 2),
	[LTI Percent of Base 75th Percentile] [numeric](18, 2),
	[LTI Percent of Base 90th Percentile] [numeric](18, 2),
	[Calc AI % 25th Percentile] [numeric](18, 2),
	[Calc AI % 50th Percentile] [numeric](18, 2),
	[Calc AI % 75th Percentile] [numeric](18, 2),
	[Calc AI % 90th Percentile] [numeric](18, 2),
	[Calc LTI % 25th Percentile] [numeric](18, 2),
	[Calc LTI % 50th Percentile] [numeric](18, 2),
	[Calc LTI % 75th Percentile] [numeric](18, 2),
	[Calc LTI % 90th Percentile] [numeric](18, 2),
	[CreatedDate] [varchar](10)
		)
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_InsertJSON] TO [RunCompModel]
    AS [dbo];

