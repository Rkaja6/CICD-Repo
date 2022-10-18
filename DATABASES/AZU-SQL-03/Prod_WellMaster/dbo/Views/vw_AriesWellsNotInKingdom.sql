CREATE VIEW vw_AriesWellsNotInKingdom AS
SELECT 
	Aries.*
FROM
	Aries.AC_PROPERTY aries
LEFT JOIN
	Kingdom.T_Well kingdom
ON
	Aries.LEASE = Kingdom.Name 
WHERE
	Kingdom.ID IS NULL