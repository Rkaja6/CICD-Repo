





CREATE PROCEDURE [dbo].[ProcessImportData]
	@InputFilename VARCHAR(100)
AS
BEGIN
	IF (SELECT COUNT(*) FROM dbo.RawStagingTable WHERE Column2 = '007933021') > 0 BEGIN EXEC ProcessWilliamsData END
	IF (SELECT COUNT(*) FROM dbo.RawStagingTable WHERE Column1 IN ('809611911','6931794')) > 0 BEGIN EXEC ProcessKinderMorganData END
	IF (SELECT COUNT(*) FROM dbo.RawStagingTable WHERE Column3 = '876833500') > 0 BEGIN EXEC ProcessDominionData END
	IF (SELECT COUNT(*) FROM dbo.RawStagingTable WHERE Column1 = 'tsp:800742780') > 0 BEGIN EXEC ProcessCheniereData END
END