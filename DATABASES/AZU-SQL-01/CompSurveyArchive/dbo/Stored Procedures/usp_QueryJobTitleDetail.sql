





CREATE PROC [dbo].[usp_QueryJobTitleDetail] @JobTitle AS nvarchar(max)
AS
BEGIN
	
	Declare @SQL as nvarchar(max)

	Set @SQL = 	'select 
		source,
		tabname, 
		[Job Title],
		[UID],
		[Job Description],
		[Job Code],
		[YearCode],
		[PublisherCode],
	    [TypeCode],
	    [WeightCode],
	    [RegionCode],
		[SubRegionCode],
		[StateCode],
		[CityCode],
	    [DeptCode],
	    [IndustryCode],
	    [CorpCode],
	    [DetailCode],
	    [ScopeCode]
	from Combined_Indexed
	where ' + @JobTitle +
	' ORDER by [Job Title] ASC, [UID] ASC'

	exec(@SQL)
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobTitleDetail] TO [RunCompModel]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobTitleDetail] TO [TLN\BManrriquez]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobTitleDetail] TO [TLN\mdean]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobTitleDetail] TO [TLN\CMartin]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobTitleDetail] TO [TLN\mgriffith]
    AS [dbo];

