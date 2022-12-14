/******************************
** Name:  Upstream_WellHeader_TreatmentView
** Desc:
** Auth:  Aaron Vogt
** Date:  10/21/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    10/21/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [DW].[vw_Upstream_WellHeader_Treatment]
	AS 
SELECT
	API14,
	[IHS_LoadDate], 
	[IHS_LoadEndDate], 
	[IHS_NUM_FRAC_STAGES], 
	[IHS_NUM_TREATMENT_RECORDS], 
	[IHS_PROPPANT_SAND_LBS], 
	[IHS_PROPPANT_RESIN_COATED_SAND_LBS], 
	[IHS_PROPPANT_CERAMIC_LBS], 
	[IHS_PROPPANT_RESIN_COATED_CERAMIC_LBS], 
	[IHS_PROPPAND_SAND_CERAMIC_LBS], 
	[IHS_PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS], 
	[IHS_PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS], 
	[IHS_PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS], 
	[IHS_PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS], 
	[IHS_PROPPANT_BAUXITE_LBS], 
	[IHS_PROPPANT_WALNUT_LBS], 
	[IHS_PROPPANT_MARBLE_LBS], 
	[IHS_PROPPANT_GRAVEL_LBS], 
	[IHS_PROPPANT_SAND_BAUXITE_CERAMIC_LBS], 
	[IHS_PROPPANT_OTHER_LBS], 
	[IHS_TOTAL_PROPPANT_LBS], 
	[IHS_FLUID_WATER_GALS], 
	[IHS_FLUID_SLICK_WATER_GALS], 
	[IHS_FLUID_SALT_WATER_GALS], 
	[IHS_FLUID_FOAM_GALS], 
	[IHS_FLUID_OIL_GALS], 
	[IHS_FLUID_POTASSIUM_CHLORIDE_GALS], 
	[IHS_FLUID_SURFACTANT_GALS], 
	[IHS_FLUID_EMULSION_GALS], 
	[IHS_N2_CO2_GAS_GALS], 
	[IHS_ACID_GALS], 
	[IHS_GEL_X_LINK_GALS], 
	[IHS_FLUID_EXPLOSIVE_GALS], 
	[IHS_FLUID_OTHER_GALS], 
	[IHS_TOTAL_FLUID_GALS], 
	[IHS_TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL], 
	[IHS_TotalLateralLengths], 
	[IHS_TotalOffsetsMinTopDepthMaxBaseDepth], 
	[IHS_AverageLateralLengthHorizontalDisplacement], 
	[IHS_TotalLateralLengthHorizontalDisplacement], 
	[IHS_TotalGrossPerforationInterval], 
	[IHS_MinTopDepth], 
	[IHS_MaxBaseDepth], 
	[IHS_OffsetSurfaceCoordBHCoordFeet], 
	[DI_LoadDate], 
	[DI_LoadEndDate], 
	[DI_NUM_FRAC_STAGES], 
	[DI_NUM_TREATMENT_RECORDS], 
	[DI_PROPPANT_SAND_LBS], 
	[DI_PROPPANT_RESIN_COATED_SAND_LBS], 
	[DI_PROPPANT_CERAMIC_LBS], 
	[DI_PROPPANT_RESIN_COATED_CERAMIC_LBS], 
	[DI_PROPPAND_SAND_CERAMIC_LBS], 
	[DI_PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS], 
	[DI_PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS], 
	[DI_PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS], 
	[DI_PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS], 
	[DI_PROPPANT_BAUXITE_LBS], 
	[DI_PROPPANT_WALNUT_LBS], 
	[DI_PROPPANT_MARBLE_LBS], 
	[DI_PROPPANT_GRAVEL_LBS], 
	[DI_PROPPANT_SAND_BAUXITE_CERAMIC_LBS], 
	[DI_PROPPANT_OTHER_LBS], 
	[DI_TOTAL_PROPPANT_LBS], 
	[DI_FLUID_WATER_GALS], 
	[DI_FLUID_SLICK_WATER_GALS], 
	[DI_FLUID_SALT_WATER_GALS], 
	[DI_FLUID_FOAM_GALS], 
	[DI_FLUID_OIL_GALS], 
	[DI_FLUID_POTASSIUM_CHLORIDE_GALS], 
	[DI_FLUID_SURFACTANT_GALS], 
	[DI_FLUID_EMULSION_GALS], 
	[DI_N2_CO2_GAS_GALS], 
	[DI_ACID_GALS], 
	[DI_GEL_X_LINK_GALS], 
	[DI_FLUID_EXPLOSIVE_GALS], 
	[DI_FLUID_OTHER_GALS], 
	[DI_TOTAL_FLUID_GALS], 
	[DI_TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL], 
	[DI_TotalLateralLengths], 
	[DI_TotalOffsetsMinTopDepthMaxBaseDepth], 
	[DI_AverageLateralLengthHorizontalDisplacement], 
	[DI_TotalLateralLengthHorizontalDisplacement], 
	[DI_TotalGrossPerforationInterval], 
	[DI_MinTopDepth], 
	[DI_MaxBaseDepth], 
	[DI_OffsetSurfaceCoordBHCoordFeet]
FROM
(
SELECT
	hub.API14,
	COALESCE([ihs].[LoadDate], GETDATE()) AS [IHS_LoadDate], 
	[ihs].[LoadEndDate] AS [IHS_LoadEndDate], 
	[ihs].[NUM_FRAC_STAGES] AS [IHS_NUM_FRAC_STAGES], 
	[ihs].[NUM_TREATMENT_RECORDS] AS [IHS_NUM_TREATMENT_RECORDS], 
	[ihs].[PROPPANT_SAND_LBS] AS [IHS_PROPPANT_SAND_LBS], 
	[ihs].[PROPPANT_RESIN_COATED_SAND_LBS] AS [IHS_PROPPANT_RESIN_COATED_SAND_LBS], 
	[ihs].[PROPPANT_CERAMIC_LBS] AS [IHS_PROPPANT_CERAMIC_LBS], 
	[ihs].[PROPPANT_RESIN_COATED_CERAMIC_LBS] AS [IHS_PROPPANT_RESIN_COATED_CERAMIC_LBS], 
	[ihs].[PROPPAND_SAND_CERAMIC_LBS] AS [IHS_PROPPAND_SAND_CERAMIC_LBS], 
	[ihs].[PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS] AS [IHS_PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS], 
	[ihs].[PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS] AS [IHS_PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS], 
	[ihs].[PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS] AS [IHS_PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS], 
	[ihs].[PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS] AS [IHS_PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS], 
	[ihs].[PROPPANT_BAUXITE_LBS] AS [IHS_PROPPANT_BAUXITE_LBS], 
	[ihs].[PROPPANT_WALNUT_LBS] AS [IHS_PROPPANT_WALNUT_LBS], 
	[ihs].[PROPPANT_MARBLE_LBS] AS [IHS_PROPPANT_MARBLE_LBS], 
	[ihs].[PROPPANT_GRAVEL_LBS] AS [IHS_PROPPANT_GRAVEL_LBS], 
	[ihs].[PROPPANT_SAND_BAUXITE_CERAMIC_LBS] AS [IHS_PROPPANT_SAND_BAUXITE_CERAMIC_LBS], 
	[ihs].[PROPPANT_OTHER_LBS] AS [IHS_PROPPANT_OTHER_LBS], 
	[ihs].[TOTAL_PROPPANT_LBS] AS [IHS_TOTAL_PROPPANT_LBS], 
	[ihs].[FLUID_WATER_GALS] AS [IHS_FLUID_WATER_GALS], 
	[ihs].[FLUID_SLICK_WATER_GALS] AS [IHS_FLUID_SLICK_WATER_GALS], 
	[ihs].[FLUID_SALT_WATER_GALS] AS [IHS_FLUID_SALT_WATER_GALS], 
	[ihs].[FLUID_FOAM_GALS] AS [IHS_FLUID_FOAM_GALS], 
	[ihs].[FLUID_OIL_GALS] AS [IHS_FLUID_OIL_GALS], 
	[ihs].[FLUID_POTASSIUM_CHLORIDE_GALS] AS [IHS_FLUID_POTASSIUM_CHLORIDE_GALS], 
	[ihs].[FLUID_SURFACTANT_GALS] AS [IHS_FLUID_SURFACTANT_GALS], 
	[ihs].[FLUID_EMULSION_GALS] AS [IHS_FLUID_EMULSION_GALS], 
	[ihs].[N2_CO2_GAS_GALS] AS [IHS_N2_CO2_GAS_GALS], 
	[ihs].[ACID_GALS] AS [IHS_ACID_GALS], 
	[ihs].[GEL_X_LINK_GALS] AS [IHS_GEL_X_LINK_GALS], 
	[ihs].[FLUID_EXPLOSIVE_GALS] AS [IHS_FLUID_EXPLOSIVE_GALS], 
	[ihs].[FLUID_OTHER_GALS] AS [IHS_FLUID_OTHER_GALS], 
	[ihs].[TOTAL_FLUID_GALS] AS [IHS_TOTAL_FLUID_GALS], 
	[ihs].[TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL] AS [IHS_TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL], 
	[ihs].[TotalLateralLengths] AS [IHS_TotalLateralLengths], 
	[ihs].[TotalOffsetsMinTopDepthMaxBaseDepth] AS [IHS_TotalOffsetsMinTopDepthMaxBaseDepth], 
	[ihs].[AverageLateralLengthHorizontalDisplacement] AS [IHS_AverageLateralLengthHorizontalDisplacement], 
	[ihs].[TotalLateralLengthHorizontalDisplacement] AS [IHS_TotalLateralLengthHorizontalDisplacement], 
	[ihs].[TotalGrossPerforationInterval] AS [IHS_TotalGrossPerforationInterval], 
	[ihs].[MinTopDepth] AS [IHS_MinTopDepth], 
	[ihs].[MaxBaseDepth] AS [IHS_MaxBaseDepth], 
	[ihs].[OffsetSurfaceCoordBHCoordFeet] AS [IHS_OffsetSurfaceCoordBHCoordFeet], 
	COALESCE([di].[LoadDate], GETDATE()) AS [DI_LoadDate], 
	[di].[LoadEndDate] AS [DI_LoadEndDate], 
	[di].[NUM_FRAC_STAGES] AS [DI_NUM_FRAC_STAGES], 
	[di].[NUM_TREATMENT_RECORDS] AS [DI_NUM_TREATMENT_RECORDS], 
	[di].[PROPPANT_SAND_LBS] AS [DI_PROPPANT_SAND_LBS], 
	[di].[PROPPANT_RESIN_COATED_SAND_LBS] AS [DI_PROPPANT_RESIN_COATED_SAND_LBS], 
	[di].[PROPPANT_CERAMIC_LBS] AS [DI_PROPPANT_CERAMIC_LBS], 
	[di].[PROPPANT_RESIN_COATED_CERAMIC_LBS] AS [DI_PROPPANT_RESIN_COATED_CERAMIC_LBS], 
	[di].[PROPPAND_SAND_CERAMIC_LBS] AS [DI_PROPPAND_SAND_CERAMIC_LBS], 
	[di].[PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS] AS [DI_PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS], 
	[di].[PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS] AS [DI_PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS], 
	[di].[PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS] AS [DI_PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS], 
	[di].[PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS] AS [DI_PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS], 
	[di].[PROPPANT_BAUXITE_LBS] AS [DI_PROPPANT_BAUXITE_LBS], 
	[di].[PROPPANT_WALNUT_LBS] AS [DI_PROPPANT_WALNUT_LBS], 
	[di].[PROPPANT_MARBLE_LBS] AS [DI_PROPPANT_MARBLE_LBS], 
	[di].[PROPPANT_GRAVEL_LBS] AS [DI_PROPPANT_GRAVEL_LBS], 
	[di].[PROPPANT_SAND_BAUXITE_CERAMIC_LBS] AS [DI_PROPPANT_SAND_BAUXITE_CERAMIC_LBS], 
	[di].[PROPPANT_OTHER_LBS] AS [DI_PROPPANT_OTHER_LBS], 
	[di].[TOTAL_PROPPANT_LBS] AS [DI_TOTAL_PROPPANT_LBS], 
	[di].[FLUID_WATER_GALS] AS [DI_FLUID_WATER_GALS], 
	[di].[FLUID_SLICK_WATER_GALS] AS [DI_FLUID_SLICK_WATER_GALS], 
	[di].[FLUID_SALT_WATER_GALS] AS [DI_FLUID_SALT_WATER_GALS], 
	[di].[FLUID_FOAM_GALS] AS [DI_FLUID_FOAM_GALS], 
	[di].[FLUID_OIL_GALS] AS [DI_FLUID_OIL_GALS], 
	[di].[FLUID_POTASSIUM_CHLORIDE_GALS] AS [DI_FLUID_POTASSIUM_CHLORIDE_GALS], 
	[di].[FLUID_SURFACTANT_GALS] AS [DI_FLUID_SURFACTANT_GALS], 
	[di].[FLUID_EMULSION_GALS] AS [DI_FLUID_EMULSION_GALS], 
	[di].[N2_CO2_GAS_GALS] AS [DI_N2_CO2_GAS_GALS], 
	[di].[ACID_GALS] AS [DI_ACID_GALS], 
	[di].[GEL_X_LINK_GALS] AS [DI_GEL_X_LINK_GALS], 
	[di].[FLUID_EXPLOSIVE_GALS] AS [DI_FLUID_EXPLOSIVE_GALS], 
	[di].[FLUID_OTHER_GALS] AS [DI_FLUID_OTHER_GALS], 
	[di].[TOTAL_FLUID_GALS] AS [DI_TOTAL_FLUID_GALS], 
	[di].[TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL] AS [DI_TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL], 
	[di].[TotalLateralLengths] AS [DI_TotalLateralLengths], 
	[di].[TotalOffsetsMinTopDepthMaxBaseDepth] AS [DI_TotalOffsetsMinTopDepthMaxBaseDepth], 
	[di].[AverageLateralLengthHorizontalDisplacement] AS [DI_AverageLateralLengthHorizontalDisplacement], 
	[di].[TotalLateralLengthHorizontalDisplacement] AS [DI_TotalLateralLengthHorizontalDisplacement], 
	[di].[TotalGrossPerforationInterval] AS [DI_TotalGrossPerforationInterval], 
	[di].[MinTopDepth] AS [DI_MinTopDepth], 
	[di].[MaxBaseDepth] AS [DI_MaxBaseDepth], 
	[di].[OffsetSurfaceCoordBHCoordFeet] AS [DI_OffsetSurfaceCoordBHCoordFeet],
	ROW_NUMBER() OVER (PARTITION BY hub.API14, [ihs].[LoadDate], [di].[LoadDate] ORDER BY [ihs].[LoadDate] DESC, [di].[LoadDate] DESC) AS APILoadDateSequence
FROM
	[DW].[HubWell] hub WITH (NOLOCK)
INNER JOIN
	[DW].[SatWellHeader] wh WITH (NOLOCK)
ON
	hub.WellHashKey = wh.WellHashKey
LEFT JOIN
	[DW].[SatWellTreatment] ihs WITH (NOLOCK)
ON
	wh.WellHashKey = ihs.WellHashKey AND
	ihs.LoadEndDate IS NULL AND
	ihs.RecordSource = 'IHS Well Treatment Summary'
LEFT JOIN
	[DW].[SatWellTreatment] di WITH (NOLOCK)
ON
	wh.WellHashKey = di.WellHashKey AND
	di.LoadEndDate IS NULL AND
	di.RecordSource = 'DI Treatment Jobs'
WHERE
	ihs.LoadEndDate IS NULL AND
	di.LoadEndDate IS NULL AND
	(ihs.NUM_TREATMENT_RECORDS IS NOT NULL OR ihs.NUM_FRAC_STAGES IS NOT NULL OR di.NUM_FRAC_STAGES IS NOT NULL OR di.NUM_TREATMENT_RECORDS IS NOT NULL)
) wt
WHERE
	 APILoadDateSequence = 1