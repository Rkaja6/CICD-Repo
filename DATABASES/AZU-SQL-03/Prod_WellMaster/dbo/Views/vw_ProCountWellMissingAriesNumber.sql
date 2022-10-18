CREATE VIEW vw_ProCountWellMissingAriesNumber AS
SELECT
	aries.*
FROM
	ProCount.PropertyWellInfoTb procount
INNER JOIN
	Aries.AC_PROPERTY aries
ON
	aries.API = procount.ApiWellNumber
WHERE
	procount.EngineeringID IS NULL OR
	procount.EngineeringID = ''