





Create view 
[dbo].[vw_TicketDetail]
as

/***
Other tables that might come in handy, not used in this view:

1. Shows the Work Logs:
select * 
from servicedesk.dbo.WorkOrder wo 
left join servicedesk.dboWorkOrderToCharge wotc wo,WORKORDERID = wotc.WORKORDERID
left join servicedesk.dbo.ChargesTable ct on ct.CHARGESID = wotc.CHARGEID

***/

SELECT 
  wo.WORKORDERID AS [Request ID], 
  aau.FIRST_NAME AS [Requester], 
  ti.FIRST_NAME AS [Technician], 
  wo.TITLE AS [Subject], 
  wod.FULLDESCRIPTION as [Description_HTML],
  CASE
	WHEN wo.ISPARENT = 0
	THEN 'Deleted'
	ELSE std.STATUSNAME 
  END AS [Request Status],
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
  CASE 
	WHEN wo.RESPONDEDTIME = 0 
	THEN NULL 
	ELSE DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(wo.RESPONDEDTIME,10)),'1970-01-01 00:00:00')
  END AS [Responded Time],
  CASE 
	WHEN wo.RESOLVEDTIME = 0 
	THEN NULL 
	ELSE DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(wo.RESOLVEDTIME,10)),'1970-01-01 00:00:00')
  END AS [Resolved Time],
  CASE 
	WHEN wo.COMPLETEDTIME = 0 
	THEN NULL 
	ELSE DATEADD(s,CONVERT(INT,(select dd from servicedesk.dbo.sdp_DateDiff) + LEFT(wo.COMPLETEDTIME,10)),'1970-01-01 00:00:00')
  END AS [Completed Time],
  qd.QUEUENAME as [Group],
  c.CATEGORYNAME as [Category],
  sc.NAME as [Subcategory],
  rtd.NAME as [Request or Incident],
  rr.RESOLUTION as [Resolution]
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
  LEFT JOIN servicedesk.dbo.WorkOrderToDescription wod ON wod.WORKORDERID = wo.WORKORDERID
  LEFT JOIN servicedesk.dbo.CategoryDefinition c on wos.CATEGORYID = c.CATEGORYID
  LEFT JOIN servicedesk.dbo.SubCategoryDefinition sc on wos.SUBCATEGORYID = sc.SUBCATEGORYID
  LEFT JOIN servicedesk.dbo.RequestTypeDefinition rtd on wos.REQUESTTYPEID = rtd.REQUESTTYPEID
  LEFT JOIN servicedesk.dbo.RequestResolution rr on wo.WORKORDERID = rr.REQUESTID