





CREATE VIEW [dbo].[vw_TicketsMerged] 
AS

SELECT 
  child_woid AS [Original Request ID],
  Title,
  CASE 
	WHEN CREATEDTIME = 0 
	THEN NULL 
	ELSE DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(CREATEDTIME,10)),'1970-01-01 00:00:00')
  END AS [Created Time],
  WORKORDERID AS [Merged Request ID]
FROM 
  servicedesk.dbo.Conversation

--CREATE VIEW [dbo].[vw_TicketsMergedInPastWeek] 
--AS

--WITH MergedTickets
--AS
--	(
--	SELECT 
--		WORKORDERID, 
--		OPERATIONTIME, 
--		REPLACE(REPLACE(REPLACE(DESCRIPTION, 'Request ID ', ''), ' merged with this request', ''), ', ', ',') as MergedIDs
--	FROM [servicedesk].dbo.[WorkOrderHistory]
--	where OPERATION = 'MERGEWITH'
--	)
--SELECT 
--  VALUE AS [Original Request ID],
--  WORKORDERID AS [Merged Request ID],
--  CASE 
--	WHEN OPERATIONTIME = 0 
--	THEN NULL 
--	ELSE DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(OPERATIONTIME,10)),'1970-01-01 00:00:00')
--  END AS [Merged Time]
--FROM 
--  MergedTickets
--  CROSS APPLY STRING_SPLIT(MergedIDs, ',')
--WHERE
--  DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(OPERATIONTIME,10)),'1970-01-01 00:00:00') BETWEEN
--	DATEADD(WEEK, -1, GETDATE()) AND GETDATE()
--  AND 
--  (
--  OPERATIONTIME NOT IN (0, -1)
--  )