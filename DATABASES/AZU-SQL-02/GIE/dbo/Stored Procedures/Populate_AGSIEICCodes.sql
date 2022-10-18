CREATE PROCEDURE Populate_AGSIEICCodes AS
BEGIN
INSERT INTO [dbo].[AGSIEICCodes]
(
	Country,
	Type,
	EICCode,
	ShortName,
	Name,
	URL
)
SELECT 
	LEFT(src.Facility_Country, 2) AS Country,
	LEFT(src.Facility_Type, 16) AS Type,
	LEFT(src.Facility_EIC, 16) AS EICCode,
	'' AS ShortName,
	LEFT(src.Facility_Name, 114) AS Name,
	LEFT(src.Facility_URL, 65) AS URL
FROM
[dbo].[AGSI_Company_Facility] src
LEFT JOIN
[dbo].[AGSIEICCodes] dest
ON
dest.[EICCode] = src.Facility_EIC
WHERE
dest.EICCode IS NULL


INSERT INTO [dbo].[AGSIEICCodes]
(
	Country,
	Type,
	EICCode,
	ShortName,
	Name,
	URL
)
SELECT 
	LEFT(src.Company_Country, 2) AS Country,
	LEFT(src.Company_Type, 16) AS Type,
	LEFT(src.Company_EIC, 16) AS EICCode,
	LEFT(src.Company_Short_Name, 27) AS ShortName,
	LEFT(src.Company_Name, 114) AS Name,
	LEFT(src.Company_URL, 65) AS URL
FROM
[dbo].[AGSI_Company_Facility] src
LEFT JOIN
[dbo].[AGSIEICCodes] dest
ON
dest.[EICCode] = src.Company_EIC
WHERE
dest.EICCode IS NULL
END