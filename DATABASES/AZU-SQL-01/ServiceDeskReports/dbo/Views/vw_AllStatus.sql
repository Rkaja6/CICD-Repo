Create view vw_AllStatus
as
SELECT
	STATUSNAME as [Request Status]
FROM servicedesk.dbo.StatusDefinition