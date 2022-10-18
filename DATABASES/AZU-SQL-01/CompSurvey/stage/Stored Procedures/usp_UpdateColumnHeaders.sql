
CREATE PROC stage.usp_UpdateColumnHeaders 
AS
BEGIN

TRUNCATE TABLE stage.ColumnHeaders;

-- This is a modified generic query to unpivot a table, without having to specify the exact columns in the table.
-- This will get the column names from the Header Row for each File & Sheet and the associated column in the Staging Table (i.e. 'F2' is 'Job Title', etc.).
DECLARE 
	@table        NVARCHAR(200) = N'Stage.StagingTable', 
	@name_pattern SYSNAME       = N'F[0-9]%';
-- local variables
DECLARE 
	@sql  NVARCHAR(MAX) = N'',
	@cols NVARCHAR(MAX) = N'';
SELECT	@cols += ', ' + name
FROM	sys.columns
WHERE	[object_id] = OBJECT_ID('Stage.StagingTable')
	AND name LIKE 'F[0-9]%'
ORDER BY CAST(RIGHT(name,LEN(name)-1) as int);
SELECT @sql = 
	N'INSERT INTO stage.ColumnHeaders
    SELECT RowNumber, FileName, SheetName, ColumnNumber, 
    REPLACE(REPLACE(Value, CHAR(13), '' ''), CHAR(10), '' '') as Value
	FROM 
		(
		SELECT A.RowNumber, A.FileName, A.SheetName' + @cols + '
		FROM ' + @table + ' A
		INNER JOIN [stage].[LoadedFileInfo] B
		ON A.RowNumber = B.HeaderRowNumber
		) AS cp
	UNPIVOT
		(
		Value FOR ColumnNumber IN (' + STUFF(@cols, 1, 1, '') + ')
		) AS up;';
--PRINT @sql;
EXEC sp_executesql @sql;
END