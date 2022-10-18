


CREATE VIEW [ARIES].[V_AC_DAILY]
AS

select 
	--UnitName,
	ARIESPropnum AS PROPNUM,
	RecordDate AS D_DATE,
	MAX([AllocEstOilVol]) as OIL,
	MAX([AllocEstGasVolMCF]) as GAS,
	MAX([WaterProduction]) as WATER,
	MAX(TubingPressure) AS FTP,
	MAX(CasingPressure) AS CP
  from [Prod_ProCount].[dbo].[V_DailyAllocVol]
  where ARIESPropnum is not null 
  and ARIESPropnum <> ''
  group by 
	ARIESPropnum,
	RecordDate