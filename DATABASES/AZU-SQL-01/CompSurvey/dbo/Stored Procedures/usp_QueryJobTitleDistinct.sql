


CREATE PROC [dbo].[usp_QueryJobTitleDistinct] @JobTitle AS nvarchar(max)
AS
BEGIN
	
	Declare @SQL as nvarchar(max)

	Set @SQL = 	'select distinct
		[PublisherCode],
		[Job Title],
		[Job Code]
	from Combined_Indexed
	where ' + @JobTitle +
	' ORDER by [Job Title] ASC, [PublisherCode] ASC'

	exec(@SQL)

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[usp_QueryJobTitleDistinct] TO [RunCompModel]
    AS [dbo];

