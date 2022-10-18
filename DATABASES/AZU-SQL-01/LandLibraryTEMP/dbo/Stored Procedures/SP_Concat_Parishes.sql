


CREATE PROCEDURE [dbo].[SP_Concat_Parishes]
AS
BEGIN
TRUNCATE TABLE Concat_Parish;
INSERT INTO Concat_Parish
SELECT DISTINCT LL2.RecordId, LL2.Title, 
    SUBSTRING(
        (
            SELECT DISTINCT ','+P1.Title  AS [text()]
            FROM dbo.LandLibrary LL1
			LEFT JOIN Parish P1
			ON LL1.ParishId = P1.Id
            WHERE LL1.RecordId = LL2.RecordId
            FOR XML PATH (''), TYPE
        ).value('text()[1]','nvarchar(max)'), 2, 8000) Parish
FROM dbo.LandLibrary LL2
LEFT JOIN Parish P2
ON LL2.ParishId = P2.Id
END