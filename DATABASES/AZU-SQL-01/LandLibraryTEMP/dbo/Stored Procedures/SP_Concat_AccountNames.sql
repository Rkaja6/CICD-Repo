


CREATE PROCEDURE [dbo].[SP_Concat_AccountNames]
AS
BEGIN
TRUNCATE TABLE Concat_AccountName;
INSERT INTO Concat_AccountName
SELECT DISTINCT LL2.RecordId, LL2.Title, 
    SUBSTRING(
        (
            SELECT DISTINCT ','+AC1.Title  AS [text()]
            FROM dbo.LandLibrary LL1
			LEFT JOIN AccountName AC1
			ON LL1.AccountId = AC1.Id
            WHERE LL1.RecordId = LL2.RecordId
            FOR XML PATH (''), TYPE
        ).value('text()[1]','nvarchar(max)'), 2, 8000) AccountName
FROM dbo.LandLibrary LL2
LEFT JOIN AccountName AC2
ON LL2.AccountId = AC2.Id
END