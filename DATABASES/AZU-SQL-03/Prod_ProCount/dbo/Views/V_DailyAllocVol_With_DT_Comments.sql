




Create view [dbo].[V_DailyAllocVol_With_DT_Comments] as
select 
	dv.MerrickID,
	dv.OperatedStatus,
	dv.CompletionName,
	dv.GatheringSystemName,
	dv.RecordDate,
	dv.AllocEstOilVol,
	dv.AllocEstGasVolMCF,
	dv.FuelGasVolMCF,
	dv.SalesGasVolMCF,
	dv.WaterProduction,
	dv.WaterBSW,
	dv.WaterHaulByTruck,
	dv.CasingPressure,
	dv.InterCasingPressure,
	dv.SurfaceCasingPressure,
	dv.LinerCasingPressure,
	dv.TubingPressure,
	dv.ChokeSize,
	dv.HoursFlowed,
	dv.DailyDownTime,
	dt.DowntimeDescription,
	dt.Comments,
	dv.ProducingStatusDescription,
	dv.ProducingMethodsDescription,
	dv.ApiWellNumber,
	dv.ARIESPropnum,
	dv.StateName,
	dv.CountyName,
	dv.StateFilingID,
	dv.StateWellNumber,
	dv.OperatorName
from V_DailyAllocVol dv
left join V_DownTime dt
on dt.Description = 'Completion'
and dt.MerrickID = dv.MerrickID
and dt.DowntimeDate = dv.ProductionDate