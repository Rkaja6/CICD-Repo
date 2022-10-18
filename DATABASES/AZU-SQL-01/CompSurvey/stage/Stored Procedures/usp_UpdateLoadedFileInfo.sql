
CREATE PROC [stage].[usp_UpdateLoadedFileInfo] @EffDate AS Date
AS
BEGIN
	TRUNCATE TABLE Stage.LoadedFileInfo;
	INSERT INTO Stage.LoadedFileInfo
	SELECT
		FileName, 
		SheetName,
		GETDATE() as LoadedDateTime,
		MIN(RowNumber) as HeaderRow,
		@EffDate as EffDate
	FROM stage.StagingTable
	WHERE F5 IS NOT NULL
		AND F5 <> ''
	GROUP BY
		FileName, 
		SheetName
END