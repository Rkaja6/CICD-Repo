




Create View [dbo].[vw_WaterfallChartDetail] AS

-- This is missing counts of re-opened tickets (increases the count), but there is no good way to query these situations
-- For reopened tickets, I'm assuming they got reopened based on not fitting into any other category... (This is a plug.)

-- Get last two dates
WITH LastTwoSnapshotDates AS
	(
	SELECT DISTINCT TOP 2
		 SnapshotDate,
		 DENSE_RANK() OVER (ORDER BY SnapshotDate DESC) AS [Index]
	FROM TicketsNotClosed
	ORDER BY SnapshotDate DESC
	)

-- Get starting and ending counts
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
	CASE D.[Index]
		WHEN 1 THEN 4
		WHEN 2 THEN 1
	END AS [Column Order]
FROM TicketsNotClosed NC
INNER JOIN LastTwoSnapshotDates D
	ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)

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
FROM [dbo].[TicketsOpenedInPastWeek] O
INNER JOIN LastTwoSnapshotDates D
	ON CAST(O.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
	AND D.[Index] = 1
WHERE 
	O.[Created Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 2)
	AND O.[Created Time] <= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 1)

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
FROM [dbo].[TicketsClosedInPastWeek] C
INNER JOIN LastTwoSnapshotDates D
	ON CAST(C.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
	AND D.[Index] = 1
WHERE 
	C.[Resolved Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 2)
	AND C.[Resolved Time] <= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 1)

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
	-- Only show merged tickets that were in the initial starting column...
	M.[Original Request ID] in 
		(
		SELECT [Request ID] 
		FROM TicketsNotClosed NC
		INNER JOIN LastTwoSnapshotDates D
			ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
			AND D.[Index] = 2
		)
	-- And not in the ending cloumn
	AND M.[Original Request ID] not in 
		(
		SELECT [Request ID] 
		FROM TicketsNotClosed NC
		INNER JOIN LastTwoSnapshotDates D
			ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
			AND D.[Index] = 1
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
FROM [dbo].[TicketsClosedInPastWeek] C
INNER JOIN LastTwoSnapshotDates D
	ON CAST(C.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
	AND D.[Index] = 1
WHERE 
	C.[Resolved Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 2)
	AND C.[Resolved Time] <= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 1)
	AND 
	-- Only show reopened tickets that were NOT in the initial starting column...
		(
		C.[Request ID] NOT IN
			(
			SELECT [Request ID] 
			FROM TicketsNotClosed NC
			INNER JOIN LastTwoSnapshotDates D
				ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
				AND D.[Index] = 2
			)
		-- And not in the new column.
		AND C.[Request ID] not in 
			(
			SELECT [Request ID] 
			FROM [TicketsOpenedInPastWeek] O
			INNER JOIN LastTwoSnapshotDates D
				ON CAST(O.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
				AND D.[Index] = 1
			WHERE 
				O.[Created Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 2)
				AND O.[Created Time] <= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 1)
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
FROM TicketsNotClosed NC
INNER JOIN LastTwoSnapshotDates D
	ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
	AND D.[Index] = 1
WHERE 
	-- Only show reopened tickets that were NOT in the initial starting column...
		NC.[Request ID] NOT IN
			(
			SELECT [Request ID] 
			FROM TicketsNotClosed NC1
			INNER JOIN LastTwoSnapshotDates D
				ON CAST(NC1.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
				AND D.[Index] = 2
			)
		-- And not in the new column.
		AND NC.[Request ID] not in 
			(
			SELECT [Request ID] 
			FROM [TicketsOpenedInPastWeek] O
			INNER JOIN LastTwoSnapshotDates D
				ON CAST(O.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
				AND D.[Index] = 1
			WHERE 
				O.[Created Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 2)
				AND O.[Created Time] <= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 1)
			)