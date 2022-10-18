




CREATE VIEW ARIES.[V_AC_PRODUCT]
	AS 

select 
	--UnitName,
	ARIESPropnum AS PROPNUM,
	EOMONTH(ProductionDate,0) AS P_DATE,
	COALESCE(MAX(AllocActOilVol),0) as OIL,
	COALESCE(MAX(AllocActGasVolMCF),0) as GAS,
	COALESCE(MAX(WaterProduction),0) as WATER,
	0 AS DAYS_ON,
	1 AS WELLS,
	0 AS NGL,
	0 AS CON, 
	0 AS ETHANE, 
	0 AS PROPANE,
	0 AS BUTANE,
	0 AS SULFUR, 
	0 AS USR1, 
	0 AS USR2, 
	0 AS USR3, 
	0 AS USR4
  from Prod_ProCount.[dbo].[V_MonthlyAllocVol]
  where ARIESPropnum is not null
  and ARIESPropnum <> ''
  group by 
	ARIESPropnum,
	ProductionDate