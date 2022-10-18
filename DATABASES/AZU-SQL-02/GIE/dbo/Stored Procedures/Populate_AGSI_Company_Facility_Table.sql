CREATE PROCEDURE Populate_AGSI_Company_Facility_Table
AS
BEGIN
DROP TABLE 	AGSI_Company_Facility
SELECT 
	Company.Column2 AS Company_Name,
	Company.Column4 AS Company_Short_Name,
	Company.Column6 AS Company_Type,
	Company.Column8 AS Company_EIC,
	Company.Column10 AS Company_Country,
	Company.Column12 AS Company_URL,
	Facility.Column2 AS Facility_Name,
	Facility.Column4 AS Facility_Type,
	Facility.Column6 AS Facility_EIC,
	Facility.Column8 AS Facility_Country,
	Facility.Column10 AS Facility_Company,
	Facility.Column12 AS Facility_URL
INTO
	AGSI_Company_Facility
  FROM [GIE].[dbo].[StagingTable] Company
  INNER JOIN
  [GIE].[dbo].[StagingTable] Facility
  ON
  Company.RowNumber+1 = Facility.RowNumber
  WHERE
  Company.Column11 = 'url' AND
  Company.Column9 = 'country' AND
  Company.Column7 = 'eic' AND
  Company.Column5 = 'type' AND
  Company.Column3 = 'short_name' AND
  Company.Column1 = 'name' AND
  Facility.Column11 = 'url' AND
  Facility.Column9 = 'company' AND
  Facility.Column7 = 'country' AND
  Facility.Column5 = 'eic' AND
  Facility.Column3 = 'type' AND
  Facility.Column1 = 'name'
END