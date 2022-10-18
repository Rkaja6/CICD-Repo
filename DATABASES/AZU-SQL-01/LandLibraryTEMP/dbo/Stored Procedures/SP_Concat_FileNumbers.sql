




CREATE PROCEDURE [dbo].[SP_Concat_FileNumbers]
AS
BEGIN
TRUNCATE TABLE Concat_FileNumber;
INSERT INTO Concat_FileNumber
SELECT DISTINCT LL2.RecordId, LL2.Title, 
    SUBSTRING(
        (
            SELECT DISTINCT ','+FN1.Title  AS [text()]
            FROM dbo.LandLibrary LL1
			LEFT JOIN FileNumber FN1
			ON LL1.FileNumberId = FN1.Id
            WHERE LL1.RecordId = LL2.RecordId
            FOR XML PATH (''), TYPE
        ).value('text()[1]','nvarchar(max)'), 2, 8000) FileNumber
FROM dbo.LandLibrary LL2
LEFT JOIN FileNumber FN2
ON LL2.FileNumberId = FN2.Id
END