/******************************
** Name:  [sp_TransformInsertStagedWellTreatmentData]
** Desc:
** Auth:  Aaron Vogt
** Date:  10/14/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    10/14/2019   Aaron     Object creation
** 2    10/25/2019   Aaron V   Changed join to exclude records that are end-dated when identifying those that should be updated
*******************************/
CREATE PROCEDURE [DW].[sp_TransformInsertStagedWellTreatmentData]
AS
BEGIN	
	
UPDATE
	swt
SET
	LoadEndDate = swt.LoadDate
FROM
	DW.SatWellTreatment swt
INNER JOIN
	DW.vw_DIWellTreatmentSatStageData stg
ON
	swt.WellHashKey = stg.WellHashKey AND
	swt.RecordSource = stg.RecordSource AND
	swt.LoadDate < stg.LoadDate AND
	swt.LoadEndDate IS NULL

INSERT INTO
	DW.SatWellTreatment
(
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[NUM_FRAC_STAGES],
	[NUM_TREATMENT_RECORDS],
	[PROPPANT_SAND_LBS],
	[PROPPANT_RESIN_COATED_SAND_LBS],
	[PROPPANT_CERAMIC_LBS],
	[PROPPANT_RESIN_COATED_CERAMIC_LBS],
	[PROPPAND_SAND_CERAMIC_LBS],
	[PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS],
	[PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS],
	[PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS],
	[PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS],
	[PROPPANT_BAUXITE_LBS],
	[PROPPANT_WALNUT_LBS],
	[PROPPANT_MARBLE_LBS],
	[PROPPANT_GRAVEL_LBS],
	[PROPPANT_SAND_BAUXITE_CERAMIC_LBS],
	[PROPPANT_OTHER_LBS],
	[TOTAL_PROPPANT_LBS],
	[FLUID_WATER_GALS],
	[FLUID_SLICK_WATER_GALS],
	[FLUID_SALT_WATER_GALS],
	[FLUID_FOAM_GALS],
	[FLUID_OIL_GALS],
	[FLUID_POTASSIUM_CHLORIDE_GALS],
	[FLUID_SURFACTANT_GALS],
	[FLUID_EMULSION_GALS],
	[N2_CO2_GAS_GALS],
	[ACID_GALS],
	[GEL_X_LINK_GALS],
	[FLUID_EXPLOSIVE_GALS],
	[FLUID_OTHER_GALS],
	[TOTAL_FLUID_GALS],
	[TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL],
	[TotalLateralLengths],
	[TotalOffsetsMinTopDepthMaxBaseDepth],
	[AverageLateralLengthHorizontalDisplacement],
	[TotalLateralLengthHorizontalDisplacement],
	[TotalGrossPerforationInterval],
	[MinTopDepth],
	[MaxBaseDepth],
	[OffsetSurfaceCoordBHCoordFeet]
)
SELECT
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[NUM_FRAC_STAGES],
	stg.[NUM_TREATMENT_RECORDS],
	stg.[PROPPANT_SAND_LBS],
	stg.[PROPPANT_RESIN_COATED_SAND_LBS],
	stg.[PROPPANT_CERAMIC_LBS],
	stg.[PROPPANT_RESIN_COATED_CERAMIC_LBS],
	stg.[PROPPAND_SAND_CERAMIC_LBS],
	stg.[PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS],
	stg.[PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS],
	stg.[PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS],
	stg.[PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS],
	stg.[PROPPANT_BAUXITE_LBS],
	stg.[PROPPANT_WALNUT_LBS],
	stg.[PROPPANT_MARBLE_LBS],
	stg.[PROPPANT_GRAVEL_LBS],
	stg.[PROPPANT_SAND_BAUXITE_CERAMIC_LBS],
	stg.[PROPPANT_OTHER_LBS],
	stg.[TOTAL_PROPPANT_LBS],
	stg.[FLUID_WATER_GALS],
	stg.[FLUID_SLICK_WATER_GALS],
	stg.[FLUID_SALT_WATER_GALS],
	stg.[FLUID_FOAM_GALS],
	stg.[FLUID_OIL_GALS],
	stg.[FLUID_POTASSIUM_CHLORIDE_GALS],
	stg.[FLUID_SURFACTANT_GALS],
	stg.[FLUID_EMULSION_GALS],
	stg.[N2_CO2_GAS_GALS],
	stg.[ACID_GALS],
	stg.[GEL_X_LINK_GALS],
	stg.[FLUID_EXPLOSIVE_GALS],
	stg.[FLUID_OTHER_GALS],
	stg.[TOTAL_FLUID_GALS],
	stg.[TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL],
	stg.[TotalLateralLengths],
	stg.[TotalOffsetsMinTopDepthMaxBaseDepth],
	stg.[AverageLateralLengthHorizontalDisplacement],
	stg.[TotalLateralLengthHorizontalDisplacement],
	stg.[TotalGrossPerforationInterval],
	stg.[MinTopDepth],
	stg.[MaxBaseDepth],
	CASE 
		WHEN stg.SurfaceHoleLatitude IS NULL OR 
			stg.SurfaceHoleLongitude IS NULL OR 
			stg.BottomHoleLatitude IS NULL OR 
			stg.BottomHoleLongitude IS NULL THEN NULL
		ELSE
			geography::Point(stg.SurfaceHoleLatitude, stg.SurfaceHoleLongitude, 4326).STDistance(
				geography::Point(stg.BottomHoleLatitude, stg.BottomHoleLongitude, 4326)) * 3.2808 
	END AS [OffsetSurfaceCoordBHCoordFeet]
FROM
	DW.vw_DIWellTreatmentSatStageData stg
LEFT JOIN
	DW.SatWellTreatment swt WITH (NOLOCK)
ON
	stg.WellHashKey = swt.WellHashKey AND
	stg.RecordSource = swt.RecordSource
WHERE
	swt.WellHashKey IS NULL AND
	swt.LoadEndDate IS NULL

UPDATE
	swt
SET
	LoadEndDate = swt.LoadDate
FROM
	DW.SatWellTreatment swt
INNER JOIN
	DW.vw_IHSWellTreatmentSatStageData stg
ON
	swt.WellHashKey = stg.WellHashKey AND
	swt.RecordSource = stg.RecordSource AND
	swt.LoadDate < stg.LoadDate AND
	swt.LoadEndDate IS NULL


INSERT INTO
	DW.SatWellTreatment
(
	[WellHashKey],
	[RecordSource],
	[LoadDate],
	[LoadEndDate],
	[NUM_FRAC_STAGES],
	[NUM_TREATMENT_RECORDS],
	[PROPPANT_SAND_LBS],
	[PROPPANT_RESIN_COATED_SAND_LBS],
	[PROPPANT_CERAMIC_LBS],
	[PROPPANT_RESIN_COATED_CERAMIC_LBS],
	[PROPPAND_SAND_CERAMIC_LBS],
	[PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS],
	[PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS],
	[PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS],
	[PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS],
	[PROPPANT_BAUXITE_LBS],
	[PROPPANT_WALNUT_LBS],
	[PROPPANT_MARBLE_LBS],
	[PROPPANT_GRAVEL_LBS],
	[PROPPANT_SAND_BAUXITE_CERAMIC_LBS],
	[PROPPANT_OTHER_LBS],
	[TOTAL_PROPPANT_LBS],
	[FLUID_WATER_GALS],
	[FLUID_SLICK_WATER_GALS],
	[FLUID_SALT_WATER_GALS],
	[FLUID_FOAM_GALS],
	[FLUID_OIL_GALS],
	[FLUID_POTASSIUM_CHLORIDE_GALS],
	[FLUID_SURFACTANT_GALS],
	[FLUID_EMULSION_GALS],
	[N2_CO2_GAS_GALS],
	[ACID_GALS],
	[GEL_X_LINK_GALS],
	[FLUID_EXPLOSIVE_GALS],
	[FLUID_OTHER_GALS],
	[TOTAL_FLUID_GALS],
	[TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL],
	[TotalLateralLengths],
	[TotalOffsetsMinTopDepthMaxBaseDepth],
	[AverageLateralLengthHorizontalDisplacement],
	[TotalLateralLengthHorizontalDisplacement],
	[TotalGrossPerforationInterval],
	[MinTopDepth],
	[MaxBaseDepth],
	[OffsetSurfaceCoordBHCoordFeet]
)
SELECT
	stg.[WellHashKey],
	stg.[RecordSource],
	stg.[LoadDate],
	stg.[LoadEndDate],
	stg.[NUM_FRAC_STAGES],
	stg.[NUM_TREATMENT_RECORDS],
	stg.[PROPPANT_SAND_LBS],
	stg.[PROPPANT_RESIN_COATED_SAND_LBS],
	stg.[PROPPANT_CERAMIC_LBS],
	stg.[PROPPANT_RESIN_COATED_CERAMIC_LBS],
	stg.[PROPPAND_SAND_CERAMIC_LBS],
	stg.[PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS],
	stg.[PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS],
	stg.[PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS],
	stg.[PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS],
	stg.[PROPPANT_BAUXITE_LBS],
	stg.[PROPPANT_WALNUT_LBS],
	stg.[PROPPANT_MARBLE_LBS],
	stg.[PROPPANT_GRAVEL_LBS],
	stg.[PROPPANT_SAND_BAUXITE_CERAMIC_LBS],
	stg.[PROPPANT_OTHER_LBS],
	stg.[TOTAL_PROPPANT_LBS],
	stg.[FLUID_WATER_GALS],
	stg.[FLUID_SLICK_WATER_GALS],
	stg.[FLUID_SALT_WATER_GALS],
	stg.[FLUID_FOAM_GALS],
	stg.[FLUID_OIL_GALS],
	stg.[FLUID_POTASSIUM_CHLORIDE_GALS],
	stg.[FLUID_SURFACTANT_GALS],
	stg.[FLUID_EMULSION_GALS],
	stg.[N2_CO2_GAS_GALS],
	stg.[ACID_GALS],
	stg.[GEL_X_LINK_GALS],
	stg.[FLUID_EXPLOSIVE_GALS],
	stg.[FLUID_OTHER_GALS],
	stg.[TOTAL_FLUID_GALS],
	stg.[TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL],
	stg.[TotalLateralLengths],
	stg.[TotalOffsetsMinTopDepthMaxBaseDepth],
	stg.[AverageLateralLengthHorizontalDisplacement],
	stg.[TotalLateralLengthHorizontalDisplacement],
	stg.[TotalGrossPerforationInterval],
	stg.[MinTopDepth],
	stg.[MaxBaseDepth],
	CASE 
		WHEN stg.SurfaceHoleLatitude IS NULL OR 
			stg.SurfaceHoleLongitude IS NULL OR 
			stg.BottomHoleLatitude IS NULL OR 
			stg.BottomHoleLongitude IS NULL THEN NULL
		ELSE
			geography::Point(SurfaceHoleLatitude, SurfaceHoleLongitude, 4326).STDistance(
				geography::Point(BottomHoleLatitude, BottomHoleLongitude, 4326)) * 3.2808 
	END AS [OffsetSurfaceCoordBHCoordFeet]
FROM
	DW.vw_IHSWellTreatmentSatStageData stg
LEFT JOIN
	DW.SatWellTreatment swt WITH (NOLOCK)
ON
	stg.WellHashKey = swt.WellHashKey AND
	stg.RecordSource = swt.RecordSource
WHERE
	swt.WellHashKey IS NULL AND
	swt.LoadEndDate IS NULL
	
END