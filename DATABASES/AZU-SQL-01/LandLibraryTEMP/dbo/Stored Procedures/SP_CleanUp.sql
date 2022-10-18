




CREATE PROCEDURE [dbo].[SP_CleanUp]
AS
BEGIN

DELETE FROM [dbo].AccountName WHERE Title IS NULL
DELETE FROM [dbo].Dividers WHERE Title IS NULL
DELETE FROM [dbo].SubDividers WHERE Title IS NULL
DELETE FROM [dbo].DocTypes WHERE Title IS NULL
DELETE FROM [dbo].FileNumber WHERE Title IS NULL
DELETE FROM [dbo].Lessees WHERE Title IS NULL
DELETE FROM [dbo].Operators WHERE Title IS NULL
DELETE FROM [dbo].OwnerNumbers WHERE Title IS NULL
DELETE FROM [dbo].Parish WHERE Title IS NULL
DELETE FROM [dbo].State WHERE Title IS NULL
DELETE FROM [dbo].STRs WHERE Title IS NULL

UPDATE [dbo].[DocTypes] SET ShortName = 'DATA' WHERE Title = 'Data'
UPDATE [dbo].State SET Title = 'Louisiana' WHERE Title = 'LOUISIANA'
UPDATE dbo.DocTypes SET title = 'RIGHT OF WAY' WHERE title = 'RIGHT-OF-WAY'

TRUNCATE TABLE dbo.LandLibrary
INSERT INTO dbo.LandLibrary SELECT * FROM Stage_LandLibrary

EXEC [dbo].[SP_Concat_AccountNames]
EXEC [dbo].[SP_Concat_FileNumbers]
EXEC [dbo].[SP_Concat_OwnerNumbers]
EXEC [dbo].[SP_Concat_Parishes]
EXEC [dbo].[SP_Concat_STRs]
EXEC [dbo].[SP_Update_DocumentAgg]

END