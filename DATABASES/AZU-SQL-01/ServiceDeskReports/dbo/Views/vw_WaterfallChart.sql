








Create View [dbo].[vw_WaterfallChart] AS

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
	NC.[Request Status],
	CAST(CAST(NC.[SnapshotDate] AS DATE) AS varchar(10)) AS [Column Name],
	CASE D.[Index]
		WHEN 1 THEN 4
		WHEN 2 THEN 1
	END AS [Column Order],
	COUNT(*) AS [Number of Tickets]
FROM TicketsNotClosed NC
INNER JOIN LastTwoSnapshotDates D
	ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
GROUP BY
	NC.[Request Status],
	NC.[SnapshotDate],
	D.[Index]

UNION ALL

-- Get counts of new tickets
SELECT 
	O.[Request Status],
	'New Tickets' AS [Column Name],
	2 AS [Column Order],
	COUNT(*) AS [Number of Tickets]
FROM [dbo].[TicketsOpenedInPastWeek] O
INNER JOIN LastTwoSnapshotDates D
	ON CAST(O.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
	AND D.[Index] = 1
WHERE 
	O.[Created Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 2)
	AND O.[Created Time] <= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 1)
GROUP BY 
	O.[Request Status]

UNION ALL

-- Get counts of closed tickets
SELECT 
	C.[Request Status],
	'Closed Tickets' AS [Column Name],
	3 AS [Column Order],
	COUNT(*) AS [Number of Tickets]
FROM [dbo].[TicketsClosedInPastWeek] C
INNER JOIN LastTwoSnapshotDates D
	ON CAST(C.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
	AND D.[Index] = 1
WHERE 
	C.[Resolved Time] >= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 2)
	AND C.[Resolved Time] <= (SELECT SnapshotDate FROM LastTwoSnapshotDates WHERE [Index] = 1)
GROUP BY 
	C.[Request Status]

-- Get counts of merged tickets (decreases the count)
UNION ALL
SELECT
	'Merged' AS [Request Status],
	'Closed Tickets' AS [Column Name],
	3 AS [Column Order],
	COUNT(*) AS [Number of Tickets]
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

UNION ALL
-- Add whitespace based on Starting and Ending columns

SELECT
	' ' AS [Request Status],
	CASE D.[Index]
		WHEN 1 THEN 'Closed Tickets'
		WHEN 2 THEN 'New Tickets'
	END AS [Column Name],
	CASE D.[Index]
		WHEN 1 THEN 3
		WHEN 2 THEN 2
	END AS [Column Order],
	COUNT(*) AS [Number Of Tickets]
FROM TicketsNotClosed NC
INNER JOIN LastTwoSnapshotDates D
	ON CAST(NC.[SnapshotDate] AS DATE) = CAST(D.SnapshotDate AS DATE)
GROUP BY
	NC.[SnapshotDate],
	D.[Index]

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
		COUNT(*) AS [Number of Tickets]
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
		COUNT(*) AS [Number of Tickets]
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
) A