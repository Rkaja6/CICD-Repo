Create View [dbo].[vw_WaterfallChartDetail_Current] AS

-- This is missing counts of re-opened tickets (increases the count), but there is no good way to query these situations
-- For reopened tickets, I'm assuming they got reopened based on not fitting into any other category... (This is a plug.)

-- Get last two dates
WITH LastTwoSnapshotDates AS
	(
	SELECT 
		 MAX(SnapshotDate) AS SnapshotDate
	FROM TicketsNotClosed
	)

-- Get starting counts
SELECT
	NC.[Request ID],
	NC.[Requester],
	NC.[Technician],
	NC.[Subject],
	NC.[Request Status],
	NC.[Created Time],
	NC.[Time Elapsed - Days],
	NC.[Last Update Time],
	NC.[Due By Time],
	NC.[Group],
	CAST(NULL AS DATETIME) AS [Completed Time],
	CAST(NULL AS DATETIME) AS [Resolved Time],
	CAST(NULL AS bigint) AS [Merged Request ID],
	CAST(CAST(NC.[SnapshotDate] AS DATE) AS varchar(10)) AS [Column Name],
	1 AS [Column Order]
FROM TicketsNotClosed NC
INNER JOIN LastTwoSnapshotDates D
	ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)

UNION ALL

-- Get ending counts
SELECT
	NC.[Request ID],
	NC.[Requester],
	NC.[Technician],
	NC.[Subject],
	NC.[Request Status],
	NC.[Created Time],
	NC.[Time Elapsed - Days],
	NC.[Last Update Time],
	NC.[Due By Time],
	NC.[Group],
	CAST(NULL AS DATETIME) AS [Completed Time],
	CAST(NULL AS DATETIME) AS [Resolved Time],
	CAST(NULL AS bigint) AS [Merged Request ID],
	CAST(CAST(GETDATE() AS DATE) AS varchar(10)) AS [Column Name],
	4 AS [Column Order]
FROM [dbo].[vw_TicketsNotClosed] NC

UNION ALL

-- Get counts of new tickets
SELECT 
	O.[Request ID],
	O.[Requester],
	O.[Technician],
	O.[Subject],
	O.[Request Status],
	O.[Created Time],
	O.[Time Elapsed - Days],
	O.[Last Update Time],
	O.[Due By Time],
	O.[Group],
	CAST(NULL AS DATETIME) AS [Completed Time],
	CAST(NULL AS DATETIME) AS [Resolved Time],
	CAST(NULL AS bigint) AS [Merged Request ID],
	'New Tickets' AS [Column Name],
	2 AS [Column Order]
FROM [dbo].[vw_TicketsOpenedInPastWeek] O
WHERE 
	O.[Created Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates)

UNION ALL

-- Get counts of closed tickets
SELECT 
	C.[Request ID],
	C.[Requester],
	C.[Technician],
	C.[Subject],
	C.[Request Status],
	C.[Created Time],
	C.[Time Elapsed - Days],
	C.[Last Update Time],
	C.[Due By Time],
	C.[Group],
	C.[Completed Time],
	C.[Resolved Time],
	CAST(NULL AS bigint) AS [Merged Request ID],
	'Closed Tickets' AS [Column Name],
	3 AS [Column Order]
FROM [dbo].[vw_TicketsClosedInPastWeek] C
WHERE 
	C.[Resolved Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates)

-- Get counts of merged tickets (decreases the count)
UNION ALL
SELECT
	M.[Original Request ID] AS [Request ID],
	NULL AS [Requester],
	NULL AS [Technician],
	Title AS [Subject],
	'Merged' AS [Request Status],
	[Created Time],
	NULL AS [Time Elapsed - Days],
	NULL AS [Last Update Time],
	NULL AS [Due By Time],
	NULL AS [Group],
	CAST(NULL AS DATETIME) AS [Completed Time],
	CAST(NULL AS DATETIME) AS [Resolved Time],
	M.[Merged Request ID],
	'Closed Tickets' AS [Column Name],
	3 AS [Column Order]
FROM [dbo].[vw_TicketsMerged] M
WHERE 
	-- Only show merged tickets that were in the initial starting column or new columns...
	M.[Original Request ID] in 
		(
		SELECT [Request ID] 
		FROM TicketsNotClosed NC
		INNER JOIN LastTwoSnapshotDates D
			ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
		)
	-- And not in the ending cloumn.
	AND M.[Original Request ID] not in 
		(
		SELECT [Request ID] 
		FROM vw_TicketsNotClosed NC
		)

-- *** Next are plugs for reopened tickets (increases the count)
UNION ALL

-- Tickets reopened then closed
SELECT 
	C.[Request ID],
	C.[Requester],
	C.[Technician],
	C.[Subject],
	'Reopened' AS [Request Status],
	C.[Created Time],
	C.[Time Elapsed - Days],
	C.[Last Update Time],
	C.[Due By Time],
	C.[Group],
	C.[Completed Time],
	C.[Resolved Time],
	CAST(NULL AS bigint) AS [Merged Request ID],
	'New Tickets' AS [Column Name],
	2 AS [Column Order]
FROM [dbo].[vw_TicketsClosedInPastWeek] C
WHERE 
	C.[Resolved Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates)
	AND 
	-- Only show reopened tickets that were NOT in the initial starting column...
		(
		C.[Request ID] NOT IN
			(
			SELECT [Request ID] 
			FROM TicketsNotClosed NC
			INNER JOIN LastTwoSnapshotDates D
				ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
			)
		-- And not in the new column.
		AND C.[Request ID] not in 
			(
			SELECT [Request ID] 
			FROM [vw_TicketsOpenedInPastWeek] O
			WHERE 
				O.[Created Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates)
			)
		)

UNION ALL

-- Tickets reopened and still open
SELECT
	NC.[Request ID],
	NC.[Requester],
	NC.[Technician],
	NC.[Subject],
	'Reopened' AS [Request Status],
	NC.[Created Time],
	NC.[Time Elapsed - Days],
	NC.[Last Update Time],
	NC.[Due By Time],
	NC.[Group],
	CAST(NULL AS DATETIME) AS [Completed Time],
	CAST(NULL AS DATETIME) AS [Resolved Time],
	CAST(NULL AS bigint) AS [Merged Request ID],
	'New Tickets' AS [Column Name],
	2 AS [Column Order]
FROM vw_TicketsNotClosed NC
WHERE 
	-- Only show reopened tickets that were NOT in the initial starting column...
		NC.[Request ID] NOT IN
			(
			SELECT [Request ID] 
			FROM TicketsNotClosed NC1
			INNER JOIN LastTwoSnapshotDates D
				ON CAST(NC1.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
			)
		-- And not in the new column.
		AND NC.[Request ID] not in 
			(
			SELECT [Request ID] 
			FROM [vw_TicketsOpenedInPastWeek] O
			WHERE 
				O.[Created Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates)
			)