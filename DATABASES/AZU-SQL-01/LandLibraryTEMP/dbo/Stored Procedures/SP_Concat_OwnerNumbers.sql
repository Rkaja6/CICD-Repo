





CREATE PROCEDURE [dbo].[SP_Concat_OwnerNumbers]
AS
BEGIN
TRUNCATE TABLE Concat_OwnerNumber;
INSERT INTO Concat_OwnerNumber
SELECT DISTINCT LL2.RecordId, LL2.Title, 
    SUBSTRING(
        (
            SELECT DISTINCT ','+ON1.Title  AS [text()]
            FROM dbo.LandLibrary LL1
			LEFT JOIN OwnerNumbers ON1
			ON LL1.BOLOOwnerNoId = ON1.Id
            WHERE LL1.RecordId = LL2.RecordId
            FOR XML PATH (''), TYPE
        ).value('text()[1]','nvarchar(max)'), 2, 8000) OwnerNumber
FROM dbo.LandLibrary LL2
LEFT JOIN OwnerNumbers ON2
ON LL2.BOLOOwnerNoId = ON2.Id
END