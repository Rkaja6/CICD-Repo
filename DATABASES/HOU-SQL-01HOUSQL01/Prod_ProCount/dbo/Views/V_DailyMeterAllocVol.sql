






create view [dbo].[V_DailyMeterAllocVol]
as
select
	md.MerrickID, 
	m.MeterName,
	gs.GatheringSystemName,
	md.RecordDate,
	md.EstGasVolMCF,
	md.HoursFlowed,
	md.DownTimeHours
from MeterDailyTb md
left join MeterTb m
on m.MerrickID = md.MerrickID
left join MeterAllocationTypeTb mat
on mat.AllocationType = m.AllocationTypeFlag
left join GatheringSystemTb gs
on gs.GatheringSystemMerrickID = m.GatheringSystemID
WHERE 
-- exclude non-sales/sales check meters
mat.AllocationName not in ('G02b-Gas Alloc Mtr to 1 Compl (sum D)','G04a-No Allocation (sum D)')