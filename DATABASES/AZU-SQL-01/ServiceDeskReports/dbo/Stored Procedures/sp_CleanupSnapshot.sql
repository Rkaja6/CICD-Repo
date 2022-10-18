


CREATE PROCEDURE [dbo].[sp_CleanupSnapshot]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete year old snapshots from tables
	DELETE FROM [dbo].[TicketsClosedInPastWeek]
	WHERE [SnapshotDate] < DATEADD(year,-1, GETDATE())

	DELETE FROM [dbo].[TicketsNotClosed]
	WHERE [SnapshotDate] < DATEADD(year,-1, GETDATE());

	DELETE FROM [dbo].[TicketsOpenedInPastWeek]
	WHERE [SnapshotDate] < DATEADD(year,-1, GETDATE());

	-- No longer used:
	--DELETE FROM [dbo].[TicketsMergedInPastWeek]
	--WHERE [SnapshotDate] < DATEADD(year,-1, GETDATE());

END