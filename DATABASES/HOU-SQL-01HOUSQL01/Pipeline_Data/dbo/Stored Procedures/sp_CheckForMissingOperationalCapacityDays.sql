CREATE PROCEDURE sp_CheckForMissingOperationalCapacityDays
AS
BEGIN
DECLARE @missingTSPs INT
;with GetEffectiveDates As  
(  
select DATEADD(day,1,'08/01/2018') as EffectiveDate
UNION ALL  
select DATEADD(day,1, EffectiveDate) from GetEffectiveDates  
where EffectiveDate < DATEADD(DAY, -1, CONVERT(DATE, GETDATE()))
),
TSPNames AS
(
	SELECT DISTINCT TSPName FROM Pipeline_Data.[dbo].[vw_OperatingCapacityMaster]
),
MasterTable AS
(
	SELECT TSPName, EffectiveDate
	FROM 
		TSPNames tsp
	CROSS JOIN
		GetEffectiveDates effdt
)
SELECT 
@missingTSPs = COUNT(*)
--	msttbl.TSPName,
--	CONVERT(VARCHAR(20), msttbl.EffectiveDate, 101) MMDDYYYYDate,
--	msttbl.EffectiveDate
FROM
	MasterTable msttbl
LEFT JOIN
	Pipeline_Data.[dbo].[vw_OperatingCapacityMaster] oc
ON
	msttbl.EffectiveDate = oc.EffectiveDate AND
	msttbl.TSPName = oc.TSPName
WHERE
	oc.EffectiveDate IS NULL AND
	--msttbl.TSPName LIKE '%CHENIERE%'
	--msttbl.TSPName LIKE '%TRANS%'
	--msttbl.TSPName  LIKE '%DOMINION%' 
	--msttbl.TSPName NOT LIKE '%KM LOU%' AND
	(
	(msttbl.TSPName LIKE '%GAS PIPELINE CO%' AND msttbl.EffectiveDate >= '05/16/2019') OR
	(msttbl.TSPName LIKE '%TRANS%' AND msttbl.EffectiveDate >= '05/16/2019') OR
	(msttbl.TSPName LIKE '%CHENIERE%' AND msttbl.EffectiveDate >= '05/16/2019') OR
	(msttbl.TSPName LIKE '%DOMINION%' AND msttbl.EffectiveDate >= '05/16/2019') OR
	(msttbl.TSPName LIKE '%KM LOU%' AND msttbl.EffectiveDate >= '05/16/2019')
	)
	--AND msttbl.TSPName LIKE '%KM LOU%'
	--AND msttbl.TSPName LIKE '%GAS PIPELINE CO%'
	
--ORDER BY
--	EffectiveDate, TSPName
OPTION (MAXRECURSION 32767)



IF @missingTSPs > 0 
BEGIN
	EXEC msdb.dbo.sp_send_dbmail @profile_name = 'tellurianinc-com.mail.protection.outlook.com', @recipients = 'avogt@tellurianinc.com', @subject = 'Operational Capacity Scrape Failed', @body='Operational Capacity Scrape Failed.'
END
END