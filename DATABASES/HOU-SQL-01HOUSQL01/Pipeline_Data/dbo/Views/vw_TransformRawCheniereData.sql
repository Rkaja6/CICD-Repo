

CREATE VIEW [dbo].[vw_TransformRawCheniereData] AS
SELECT
	LTRIM(RTRIM(SUBSTRING(Column1, CHARINDEX('tsp:', Column1) + 4, LEN(Column1) - CHARINDEX('tsp:', Column1) + 4))) AS TSP,
	LTRIM(RTRIM(SUBSTRING(Column2, CHARINDEX('tsP_NAME:', Column2) + 9, LEN(Column2) - CHARINDEX('tsP_NAME:', Column2) + 9))) AS [TSP Name],	
	LTRIM(RTRIM(SUBSTRING(Column4, CHARINDEX('postinG_DT_TIME:', Column4) + 16, LEN(Column4) - CHARINDEX('tsP_NAME:', Column4) + 16))) AS [Posting Date Time],
	LTRIM(RTRIM(SUBSTRING(Column5, CHARINDEX('avaiL_CAP_EFF_DT_TIME:', Column5) + 22, LEN(Column5) - CHARINDEX('avaiL_CAP_EFF_DT_TIME:', Column5) + 22))) AS [Eff Gas Day Time],
	LTRIM(RTRIM(SUBSTRING(Column8, CHARINDEX('loc:', Column8) + 4, LEN(Column8) - CHARINDEX('loc:', Column8) + 4))) AS [Loc],
	LTRIM(RTRIM(SUBSTRING(Column9, CHARINDEX('loC_NAME:', Column9) + 9, LEN(Column9) - CHARINDEX('loC_NAME:', Column9) + 9))) AS [Loc Name],
	LTRIM(RTRIM(SUBSTRING(Column10, CHARINDEX('loC_PURP_DESC:', Column10) + 14, LEN(Column9) - CHARINDEX('loC_PURP_DESC:', Column10) + 14))) AS [Loc Purp Desc],
	LTRIM(RTRIM(SUBSTRING(Column11, CHARINDEX('loC_QTI:', Column11) + 8, LEN(Column9) - CHARINDEX('loC_QTI:', Column11) + 8))) AS [Loc QTI ],
	LTRIM(RTRIM(SUBSTRING(Column14, CHARINDEX('alL_QTY_AVAIL:', Column14) + 14, LEN(Column14) - CHARINDEX('alL_QTY_AVAIL:', Column14) + 14))) AS [All Qty Avail],
	LTRIM(RTRIM(SUBSTRING(Column13, CHARINDEX('it:', Column13) + 3, LEN(Column13) - CHARINDEX('it:', Column13) + 3))) AS [IT],
	LTRIM(RTRIM(SUBSTRING(Column15, CHARINDEX('desigN_OPER_CAP:', Column15) + 16, LEN(Column15) - CHARINDEX('desigN_OPER_CAP:', Column15) + 16))) AS [Design Capacity],
	LTRIM(RTRIM(SUBSTRING(Column16, CHARINDEX('opeR_CAP:', Column16) + 9, LEN(Column16) - CHARINDEX('opeR_CAP:', Column16) + 9))) AS [Operating Capacity],
	LTRIM(RTRIM(SUBSTRING(Column17, CHARINDEX('scheD_QTY:', Column17) + 10, LEN(Column17) - CHARINDEX('scheD_QTY:', Column17) + 10))) AS [Total Sched Quantity],
	LTRIM(RTRIM(SUBSTRING(Column18, CHARINDEX('qtY_AVAIL:', Column18) + 10, LEN(Column18) - CHARINDEX('qtY_AVAIL:', Column18) + 10))) AS [Operationally Available Capacity],
	LTRIM(RTRIM(SUBSTRING(Column19, CHARINDEX('floW_IND:', Column19) + 9, LEN(Column19) - CHARINDEX('floW_IND:', Column19) + 9))) AS [Flow Ind]
FROM
	Pipeline_Data.dbo.RawStagingTable
WHERE Column1 LIKE '%tsp:%'