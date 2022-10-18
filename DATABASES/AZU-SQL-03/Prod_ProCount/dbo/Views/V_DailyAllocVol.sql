



create view [dbo].[V_DailyAllocVol]
as
select
	cd.MerrickID, 
	case 
		when cd.OutsideOperatedFlag in (0,2,6) then 'Operated'
		else 'Non-Operated'
	end as OperatedStatus,
	c.WellPlusCompletionName as CompletionName,
	gs.GatheringSystemName,
	cd.RecordDate,
	cd.ProductionDate,
	cd.AllocEstOilVol,
	cd.AllocEstGasVolMCF,
	disp.FuelGasVolMCF,
	disp.SalesGasVolMCF,
	cd.WaterProduction,
	disp.WaterBSW,
	disp.WaterHaulByTruck,
	cd.CasingPressure,
	cd.InterCasingPressure,
	cd.SurfaceCasingPressure,
	cd.LinerCasingPressure,
	cd.TubingPressure,
	case 
		when cd.ChokeSize = 0 then '0'
		else lcs.Description 
	end as ChokeSize,
	cd.HoursFlowed,
	cd.DailyDownTime,
	ps.ProducingDescription as ProducingStatusDescription,
	pm.ProducingMethodsDescription,
	c.ApiWellNumber,
	c.EngineeringID as ARIESPropnum,
	sn.StateName,
	scn.CountyName,
	c.StateFilingID,
	c.StateWellNumber,
	be.CompanyName as OperatorName
from CompletionDailyTb cd
left join CompletionTb c
on c.MerrickID = cd.MerrickID
left join ProducingStatusTb ps
on ps.ProducingStatusMerrickID = cd.ProducingStatus
left join ProducingMethodsTb pm
on pm.ProducingMethodsMerrickID = cd.ProducingMethod
left join StateNamesTb sn
on sn.StateCode = c.StateID
left join StateCountyNamesTb scn
on scn.CountyCode = c.CountyID
and scn.StateCode = c.StateID
left join BusinessEntityTb be
on be.MerrickID = c.OperatorEntityID
left join ListChokeSizeTb lcs
on lcs.value = cd.ChokeSize
left join GatheringSystemTb gs
on gs.GatheringSystemMerrickID = c.GatheringSystemID
left join 
(select 
	cdd.MerrickID,
	cdd.RecordDate,
	SUM(CASE WHEN dc.DispositionCodeDescription = 'Fuel - Compressor' THEN cdd.AllocEstGasVolMCF ELSE 0 END) as FuelGasVolMCF,
	SUM(CASE WHEN dc.DispositionCodeDescription = 'Gas Sales' THEN cdd.AllocEstGasVolMCF ELSE 0 END) as SalesGasVolMCF,
	SUM(CASE WHEN dc.DispositionCodeDescription = 'Water Haul by Truck' THEN cdd.AllocEstWaterVol ELSE 0 END) as WaterHaulByTruck,
	SUM(CASE WHEN dc.DispositionCodeDescription = 'BS&W - Water' THEN cdd.AllocEstWaterVol ELSE 0 END) as WaterBSW
from CompletionDailyDispTb cdd
left join ProductCodeTb pc
on cdd.ProductCode = pc.MerrickID
left join ProductTypeTb pt
on cdd.ProductType = pt.MerrickID
left join DispositionCodeTb dc
on cdd.DispositionCode = dc.MerrickID
GROUP BY 
	cdd.MerrickID,
	cdd.RecordDate) disp
on disp.MerrickID = cd.MerrickID
and disp.RecordDate = cd.RecordDate