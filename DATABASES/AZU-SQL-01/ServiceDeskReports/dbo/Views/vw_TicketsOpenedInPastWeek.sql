CREATE VIEW vw_TicketsOpenedInPastWeek 
AS

SELECT 
  wo.WORKORDERID AS [Request ID], 
  aau.FIRST_NAME AS [Requester], 
  ti.FIRST_NAME AS [Technician], 
  wo.TITLE AS [Subject], 
  std.STATUSNAME AS [Request Status],
  CASE 
	WHEN wo.CREATEDTIME = 0 
	THEN NULL 
	ELSE DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(wo.CREATEDTIME,10)),'1970-01-01 00:00:00')
  END AS [Created Time], 
  DATEDIFF(d,DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(wo.CREATEDTIME,10)),'1970-01-01 00:00:00'), GETDATE())   
	AS [Time Elapsed - Days], 
  CASE 
	WHEN wos.Last_Tech_Update = 0 
	THEN NULL 
	ELSE DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(wos.Last_Tech_Update,10)),'1970-01-01 00:00:00')
  END AS [Last Update Time],
  CASE 
	WHEN wo.DUEBYTIME = 0 
	THEN NULL 
	ELSE DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(wo.DUEBYTIME,10)),'1970-01-01 00:00:00')
  END AS [Due By Time],
  qd.QUEUENAME as [Group]
FROM 
  servicedesk.dbo.WorkOrder wo 
  LEFT JOIN servicedesk.dbo.SDUser sdu ON wo.REQUESTERID = sdu.USERID 
  LEFT JOIN servicedesk.dbo.AaaUser aau ON sdu.USERID = aau.USER_ID 
  LEFT JOIN servicedesk.dbo.WorkOrderStates wos ON wo.WORKORDERID = wos.WORKORDERID 
  LEFT JOIN servicedesk.dbo.SDUser td ON wos.OWNERID = td.USERID 
  LEFT JOIN servicedesk.dbo.AaaUser ti ON td.USERID = ti.USER_ID 
  LEFT JOIN servicedesk.dbo.StatusDefinition std ON wos.STATUSID = std.STATUSID 
  LEFT JOIN servicedesk.dbo.WorkOrder_Queue woq ON wo.WORKORDERID = woq.WORKORDERID
  LEFT JOIN servicedesk.dbo.QueueDefinition qd ON woq.QUEUEID = qd.QUEUEID
WHERE 
  (
	wo.CREATEDTIME NOT IN (0, -1) AND 
	DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(wo.CREATEDTIME,10)),'1970-01-01 00:00:00') BETWEEN 
		DATEADD(WEEK, -1, GETDATE()) AND getdate ()
  ) 
  AND wo.ISPARENT = '1'