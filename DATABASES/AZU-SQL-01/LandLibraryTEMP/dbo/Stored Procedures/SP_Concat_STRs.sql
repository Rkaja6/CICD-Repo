


CREATE PROCEDURE [dbo].[SP_Concat_STRs]
AS
BEGIN
TRUNCATE TABLE Concat_STR;
INSERT INTO Concat_STR
SELECT DISTINCT LL2.RecordId, LL2.Title, 
    SUBSTRING(
        (
            SELECT DISTINCT ','+S1.Title  AS [text()]
            FROM dbo.LandLibrary LL1
			LEFT JOIN STRs S1
			ON LL1.STRId = S1.Id
            WHERE LL1.RecordId = LL2.RecordId
            FOR XML PATH (''), TYPE
        ).value('text()[1]','nvarchar(max)'), 2, 8000) STR
FROM dbo.LandLibrary LL2
LEFT JOIN STRs S2
ON LL2.STRId = S2.Id
END