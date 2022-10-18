



CREATE PROC [dbo].[usp_QueryJobUIDDetail] @JobUID AS nvarchar(max)
AS
BEGIN
	
	Declare @SQL as nvarchar(max)

	Set @SQL = 	'select top 1 
		[Job Title],
		[UID],
		[PublisherCode],
		[TypeCode],
		[WeightCode],
		[Effective Date],
		[Inc],
		[Cos],
		[Base 25th Percentile]/1000 AS [Base 25th Percentile],
		[Base 50th Percentile]/1000 AS [Base 50th Percentile],
		[Base 75th Percentile]/1000 AS [Base 75th Percentile],
		[Base 90th Percentile]/1000 AS [Base 90th Percentile],
		([Actual TC 50th Percentile] - [Base 50th Percentile])/1000 AS [Bonus Median],
		[Actual TC 25th Percentile]/1000 AS [Actual TC 25th Percentile],
		[Actual TC 50th Percentile]/1000 AS [Actual TC 50th Percentile],
		[Actual TC 75th Percentile]/1000 AS [Actual TC 75th Percentile],
		[Actual TC 90th Percentile]/1000 AS [Actual TC 90th Percentile],
		[Target TC 25th Percentile]/1000 AS [Target TC 25th Percentile],
		[Target TC 50th Percentile]/1000 AS [Target TC 50th Percentile],
		[Target TC 75th Percentile]/1000 AS [Target TC 75th Percentile],
		[Target TC 90th Percentile]/1000 AS [Target TC 90th Percentile],
		[LTI 25th Percentile]/1000 as [LTI 25th Percentile],
		[LTI 50th Percentile]/1000 as [LTI 50th Percentile],
		[LTI 75th Percentile]/1000 as [LTI 75th Percentile],
		[LTI 90th Percentile]/1000 as [LTI 90th Percentile],
		[Total Direct Actual 25th Percentile]/1000 as [Total Direct Actual 25th Percentile],
		[Total Direct Actual 50th Percentile]/1000 as [Total Direct Actual 50th Percentile],
		[Total Direct Actual 75th Percentile]/1000 as [Total Direct Actual 75th Percentile],
		[Total Direct Actual 90th Percentile]/1000 as [Total Direct Actual 90th Percentile],
		[Target TDC 25th Percentile]/1000 as [Target TDC 25th Percentile],
		[Target TDC 50th Percentile]/1000 as [Target TDC 50th Percentile],
		[Target TDC 75th Percentile]/1000 as [Target TDC 75th Percentile],
		[Target TDC 90th Percentile]/1000 as [Target TDC 90th Percentile],
		[Calc AI % 25th Percentile]/100 as [AI % 25th Percentile],
		[Calc AI % 50th Percentile]/100 as [AI % 50th Percentile],
		[Calc AI % 75th Percentile]/100 as [AI % 75th Percentile],
		[Calc AI % 90th Percentile]/100 as [AI % 90th Percentile],
		[Calc LTI % 25th Percentile]/100 as [LTI % 25th Percentile],
		[Calc LTI % 50th Percentile]/100 as [LTI % 50th Percentile],
		[Calc LTI % 75th Percentile]/100 as [LTI % 75th Percentile],
		[Calc LTI % 90th Percentile]/100 as [LTI % 90th Percentile]
	from Combined_Indexed
	where [UID] = ''' + @JobUID + ''''

	exec(@SQL)
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobUIDDetail] TO [RunCompModel]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobUIDDetail] TO [TLN\BManrriquez]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobUIDDetail] TO [TLN\mdean]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobUIDDetail] TO [TLN\CMartin]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobUIDDetail] TO [TLN\mgriffith]
    AS [dbo];

