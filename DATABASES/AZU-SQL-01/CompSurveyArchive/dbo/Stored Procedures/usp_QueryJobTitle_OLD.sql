




CREATE PROC [dbo].[usp_QueryJobTitle_OLD] @JobTitle AS nvarchar(max)
AS
BEGIN

-- Old version
-- as of 8/22/2019, replaced by [dbo].[usp_QueryJobTitleDetail] and [dbo].[usp_QueryJobTitleDistinct]

	select 
		source,
		tabname, 
		[Job Title],
		[Job Code],
		Industry,
		[Corporate-Noncorporate],
		[Rev Responsibility-Location-Other],
		Family,
		[Sub-Family],
		Specialization,
		[Mercer Job Type],
		[AonHewitt Scope To],
		[AonHewitt Scope From],
		[AonHewitt Scope Desc],
		[Job Description]
	from Combined_Indexed
	where [Job Title] like '%' + @JobTitle + '%'

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobTitle_OLD] TO [RunCompModel]
    AS [dbo];

