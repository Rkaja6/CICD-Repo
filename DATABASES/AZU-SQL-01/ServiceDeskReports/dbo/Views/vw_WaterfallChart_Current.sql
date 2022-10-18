



Create View [dbo].[vw_WaterfallChart_Current] AS

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
	NC.[Request Status],
	CAST(CAST(NC.[SnapshotDate] AS DATE) AS varchar(10)) AS [Column Name],
	1 AS [Column Order],
	COUNT(*) AS [Number Of Tickets]
FROM TicketsNotClosed NC
INNER JOIN LastTwoSnapshotDates D
	ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
GROUP BY
	NC.[Request Status],
	CAST(NC.[SnapshotDate] AS DATE)

UNION ALL

-- Get ending counts
SELECT
	NC.[Request Status],
	CAST(CAST(GETDATE() AS DATE) AS varchar(10)) AS [Column Name],
	4 AS [Column Order],
	COUNT(*) AS [Number Of Tickets]
FROM [dbo].[vw_TicketsNotClosed] NC
GROUP BY
	NC.[Request Status]

UNION ALL

-- Get counts of new tickets
SELECT 
	O.[Request Status],
	'New Tickets' AS [Column Name],
	2 AS [Column Order],
	COUNT(*) AS [Number Of Tickets]
FROM [dbo].[vw_TicketsOpenedInPastWeek] O
WHERE 
	O.[Created Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates)
GROUP BY
	O.[Request Status]

UNION ALL

-- Get counts of closed tickets
SELECT 
	C.[Request Status],
	'Closed Tickets' AS [Column Name],
	3 AS [Column Order],
	COUNT(*) AS [Number Of Tickets]
FROM [dbo].[vw_TicketsClosedInPastWeek] C
WHERE 
	C.[Resolved Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates)
GROUP BY
	C.[Request Status]

-- Get counts of merged tickets (decreases the count)
UNION ALL
SELECT
	'Merged' AS [Request Status],
	'Closed Tickets' AS [Column Name],
	3 AS [Column Order],
	COUNT(*) AS [Number Of Tickets]
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
UNION ALL
-- Add whitespace based on Starting and Ending columns

SELECT
	' ' AS [Request Status],
	'New Tickets' AS [Column Name],
	2 AS [Column Order],
	COUNT(*) AS [Number Of Tickets]
FROM TicketsNotClosed NC
INNER JOIN LastTwoSnapshotDates D
	ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)

UNION ALL

SELECT
	' ' AS [Request Status],
	'Closed Tickets' AS [Column Name],
	3 AS [Column Order],
	COUNT(*) AS [Number Of Tickets]
FROM vw_TicketsNotClosed NC

-- *** Next are plugs for reopened tickets (increases the count)
UNION ALL

-- Tickets reopened then closed
SELECT
	'Reopened' AS [Request Status],
	'New Tickets' AS [Column Name],
	2 AS [Column Order],
	SUM([Number Of Tickets]) AS [Number Of Tickets]
FROM
(
	SELECT 
		COUNT(*) AS [Number Of Tickets]
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
		COUNT(*) AS [Number Of Tickets]
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
) A