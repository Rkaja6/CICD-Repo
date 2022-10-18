



Create PROCEDURE [ARIES].[Proc_UpdTellDWMonthlyProd] AS 
BEGIN

  MERGE TELL_DW.dbo.AC_PRODUCT AS destination
  USING [PEAK_DW].ARIES.Monthly_Prod_STG as source
  ON source.PROPNUM = destination.PROPNUM
  AND source.Month_StartDate = destination.P_DATE
  WHEN MATCHED THEN
  UPDATE SET
	Destination.OIL = Source.OIL,
	Destination.GAS = Source.GAS,
	Destination.WATER = Source.WATER,
	Destination.IHS_OIL = Source.IHS_OIL,
	Destination.IHS_GAS = Source.IHS_GAS,
	Destination.IHS_WATER = Source.IHS_WATER,
	Destination.DI_OIL = Source.DI_OIL,
	Destination.DI_GAS = Source.DI_GAS,
	Destination.DI_WATER = Source.DI_WATER,
	Destination.Blend_Source_Gas = Source.Gas_Source,
	Destination.Blend_Source_Oil = Source.Oil_Source,
	Destination.Blend_Source_Water = Source.Water_Source
  WHEN NOT MATCHED THEN
  INSERT
	(
	PROPNUM,
	P_DATE,
	OIL,
	GAS,
	WATER,
	IHS_OIL,
	IHS_GAS,
	IHS_WATER,
	DI_OIL,
	DI_GAS,
	DI_WATER,
	BLEND_SOURCE_GAS,
	BLEND_SOURCE_OIL,
	BLEND_SOURCE_WATER
	)
  VALUES 
	(
	Source.PROPNUM,
	Source.Month_StartDate,
	Source.OIL,
	Source.GAS,
	Source.WATER,
	Source.IHS_OIL,
	Source.IHS_GAS,
	Source.IHS_WATER,
	Source.DI_OIL,
	Source.DI_GAS,
	Source.DI_WATER,
	Source.Gas_Source,
	Source.Oil_Source,
	Source.Water_Source
	);


Update P
SET 
GAS = DEAL_GAS,
BLEND_SOURCE_GAS = 'DEAL'
FROM [TELL_DW].[dbo].[AC_PRODUCT]  P
WHERE DEAL_GAS IS NOT NULL

Update P
SET 
OIL = DEAL_OIL,
BLEND_SOURCE_OIL = 'DEAL'
FROM [TELL_DW].[dbo].[AC_PRODUCT]  P
WHERE DEAL_OIL IS NOT NULL

Update P
SET 
WATER = DEAL_WATER,
BLEND_SOURCE_WATER = 'DEAL'
FROM [TELL_DW].[dbo].[AC_PRODUCT]  P
WHERE DEAL_WATER IS NOT NULL


END