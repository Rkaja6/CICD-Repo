



create view [dbo].[V_MonthlyAllocVol]
as
select
	cm.MerrickID,
	case 
		when cm.OutsideOperatedFlag in (0,2,6) then 'Operated'
		else 'Non-Operated'
	end as OperatedStatus,
	c.WellPlusCompletionName as CompletionName,
	gs.GatheringSystemName,
	cm.RecordDate as ProductionDate,
	cm.AllocActOilVol,
	cm.AllocActGasVolMCF,
	disp.FuelGasVolMCF,
	disp.SalesGasVolMCF,
	cm.WaterProduction,
	disp.WaterBSW,
	disp.WaterHaulByTruck,
	cm.EstOilVol,
	cm.EstGasVolMCF,
	cm.EstWaterProduction,
	cm.TotalDownTime,
	cm.DaysOn,
	cm.TotalHoursFlowed,
	ps.ProducingDescription as ProducingStatusDescription,
	pm.ProducingMethodsDescription,
	c.ApiWellNumber,
	c.EngineeringID as ARIESPropnum,
	sn.StateName,
	scn.CountyName,
	c.StateFilingID,
	c.StateWellNumber,
	be.CompanyName as OperatorName
from CompletionMonthlyTb cm
left join CompletionTb c
on c.MerrickID = cm.MerrickID
left join ProducingStatusTb ps
on ps.ProducingStatusMerrickID = cm.ProducingStatus
left join ProducingMethodsTb pm
on pm.ProducingMethodsMerrickID = cm.ProducingMethod
left join StateNamesTb sn
on sn.StateCode = c.StateID
left join StateCountyNamesTb scn
on scn.CountyCode = c.CountyID
and scn.StateCode = c.StateID
left join BusinessEntityTb be
on be.MerrickID = c.OperatorEntityID
left join GatheringSystemTb gs
on gs.GatheringSystemMerrickID = c.GatheringSystemID
left join 
(select 
	cmd.MerrickID,
	cmd.RecordDate,
	SUM(CASE WHEN dc.DispositionCodeDescription = 'Fuel - Compressor' THEN cmd.AllocActGasVolMCF ELSE 0 END) as FuelGasVolMCF,
	SUM(CASE WHEN dc.DispositionCodeDescription = 'Gas Sales' THEN cmd.AllocActGasVolMCF ELSE 0 END) as SalesGasVolMCF,
	SUM(CASE WHEN dc.DispositionCodeDescription = 'Water Haul by Truck' THEN cmd.AllocActWaterVol ELSE 0 END) as WaterHaulByTruck,
	SUM(CASE WHEN dc.DispositionCodeDescription = 'BS&W - Water' THEN cmd.AllocActWaterVol ELSE 0 END) as WaterBSW
from CompletionMonthlyDispTb cmd
left join ProductCodeTb pc
on cmd.ProductCode = pc.MerrickID
left join ProductTypeTb pt
on cmd.ProductType = pt.MerrickID
left join DispositionCodeTb dc
on cmd.DispositionCode = dc.MerrickID
GROUP BY 
	cmd.MerrickID,
	cmd.RecordDate) disp
on disp.MerrickID = cm.MerrickID
and disp.RecordDate = cm.RecordDate