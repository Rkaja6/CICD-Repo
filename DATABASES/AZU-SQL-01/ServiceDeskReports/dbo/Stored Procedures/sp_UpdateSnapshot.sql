


CREATE PROCEDURE [dbo].[sp_UpdateSnapshot]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Add new snapshots to tables
	INSERT INTO [dbo].[TicketsClosedInPastWeek]
	SELECT
		[Request ID]
		,[Requester]
		,[Technician]
		,[Subject]
		,[Request Status]
		,[Created Time]
		,[Time Elapsed - Days]
		,[Last Update Time]
		,[Due By Time]
		,[Group]
		,[Completed Time]
		,[Resolved Time]
		,GETDATE() AS [SnapshotDate]
	FROM [dbo].[vw_TicketsClosedInPastWeek];

	INSERT INTO [dbo].[TicketsNotClosed]
	SELECT
		[Request ID]
		,[Requester]
		,[Technician]
		,[Subject]
		,[Request Status]
		,[Created Time]
		,[Time Elapsed - Days]
		,[Last Update Time]
		,[Due By Time]
		,[Group]
		,GETDATE() AS [SnapshotDate]
	FROM [dbo].[vw_TicketsNotClosed];

	INSERT INTO [dbo].[TicketsOpenedInPastWeek]
	SELECT
		[Request ID]
		,[Requester]
		,[Technician]
		,[Subject]
		,[Request Status]
		,[Created Time]
		,[Time Elapsed - Days]
		,[Last Update Time]
		,[Due By Time]
		,[Group]
		,GETDATE() AS [SnapshotDate]
	FROM [dbo].[vw_TicketsOpenedInPastWeek];

	-- No longer used:
	--INSERT INTO [dbo].[TicketsMergedInPastWeek]
	--SELECT
 --       [Original Request ID]
 --       ,[Merged Request ID]
 --       ,[Merged Time]
 --       ,GETDATE() AS [SnapshotDate]
	--FROM [dbo].[vw_TicketsMergedInPastWeek]

END