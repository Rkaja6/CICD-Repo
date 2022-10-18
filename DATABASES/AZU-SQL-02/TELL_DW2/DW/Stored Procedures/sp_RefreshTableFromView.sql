/******************************
** Name:  [sp_TransformInsertStagedWellHeaderData]
** Desc:  Refreshes a table from a view providing the view includes all fields that are contained in the table
**	      in its output.  This differs from a MATERIALIZED view in that we can control when the view is updated
**        so that resources are not wasted keeping the data fresh when the underlying tables are truncated and
**        rebuild or changed significantly.
** Auth:  Aaron Vogt
** Date:  11/18/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    11/18/2019   Aaron     Object creation
*******************************/
CREATE PROCEDURE [DW].[sp_RefreshTableFromView]
	@viewSchema VARCHAR(100),
	@viewName VARCHAR(100),
	@tableSchema VARCHAR(100),
	@tableName VARCHAR(100)
AS
BEGIN
	DECLARE @collist VARCHAR(8000)
	DECLARE @sqlCmd VARCHAR(8000)
	SELECT DISTINCT 
	@collist =
	    SUBSTRING(
			(
	            SELECT ','+col.COLUMN_NAME  AS [text()]
				FROM INFORMATION_SCHEMA.COLUMNS col
				WHERE TABLE_NAME = @tableName AND TABLE_SCHEMA = @tableSchema
				ORDER BY col.ORDINAL_POSITION
				FOR XML PATH ('')
			), 2, 8000)
	FROM INFORMATION_SCHEMA.COLUMNS
	
	SET @sqlCmd = 'TRUNCATE TABLE [' + @tableSchema + '].[' + @tableName + ']'
	EXEC sp_sqlexec @sqlCmd
	SET @sqlCmd = 'INSERT INTO [' + @tableSchema + '].[' + @tableName + '] (' + 
		@collist + ') SELECT ' + @collist + 
		' FROM [' + @viewSchema + '].[' + @viewName + ']'
	EXEC sp_sqlexec @sqlCmd
END