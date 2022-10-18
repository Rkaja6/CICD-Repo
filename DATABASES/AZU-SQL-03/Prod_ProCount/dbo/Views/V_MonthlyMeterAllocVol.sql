

create view [dbo].[V_MonthlyMeterAllocVol]
as
select
	mm.MerrickID,
	m.MeterName,
	gs.GatheringSystemName,
	mm.RecordDate,
	mm.EstGasVolMCF,
	mm.DaysOn,
	mm.TotalHoursFlowed
from MeterMonthlyTb mm
left join MeterTb m
on m.MerrickID = mm.MerrickID
left join MeterAllocationTypeTb mat
on mat.AllocationType = m.AllocationTypeFlag
left join GatheringSystemTb gs
on gs.GatheringSystemMerrickID = m.GatheringSystemID
WHERE 
-- exclude non-sales/sales check meters
mat.AllocationName not in ('G02b-Gas Alloc Mtr to 1 Compl (sum D)','G04a-No Allocation (sum D)')