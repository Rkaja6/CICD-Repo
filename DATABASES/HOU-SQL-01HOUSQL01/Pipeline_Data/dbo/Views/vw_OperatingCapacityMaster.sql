



CREATE VIEW [dbo].[vw_OperatingCapacityMaster] AS 
SELECT * FROM [dbo].[vw_OperatingCapacityCheniere]
UNION ALL
SELECT * FROM [dbo].[vw_OperatingCapacityDominion]
UNION ALL
SELECT * FROM [dbo].[vw_OperatingCapacityKinderMorgan]
UNION ALL
SELECT * FROM [dbo].[vw_OperatingCapacityWilliams]