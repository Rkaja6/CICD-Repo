CREATE VIEW vw_WellsWithNameMismatchProCountAries AS
SELECT procount.WellName, aries.ENERSIGHT_NAME, procount.ApiWellNumber, aries.API
  FROM [ProCount].[PropertyWellInfoTb] procount
INNER JOIN
ARIES.AC_PROPERTY aries
ON
	procount.ApiWellNumber = aries.API
WHERE
	procount.WellName <> aries.ENERSIGHT_NAME