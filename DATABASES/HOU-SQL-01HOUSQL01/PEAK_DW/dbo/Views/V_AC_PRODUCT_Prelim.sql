CREATE VIEW [dbo].[V_AC_PRODUCT_Prelim]
	AS 

select 
	--UnitName,
	ARIES_Propnum AS PROPNUM,
	Month_End_Date AS P_DATE,
	MAX(VolProdAllocOil) as OIL,
	MAX(VolProdAllocGas) as GAS,
	MAX(VolProdAllocWater) as WATER,
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
  from pel.V_Monthly_Alloc_Prod
  where ARIES_Propnum is not null
  group by 
	ARIES_Propnum,
	Month_End_Date