/******************************
** Name:  [vw_DIWellTreatmentSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  10/11/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    10/11/2019   Aaron V   Object creation
** 2    10/15/2019   Aaron V   Found a pattern for identifying specific IHS-type proppant and fluids and added it
*******************************/
CREATE VIEW [DW].[vw_DIWellTreatmentSatStageData]
	AS
WITH
PerfDepths AS
(
SELECT
	GovernmentID AS API14, 
	BaseDepth - TopDepth AS PerforationLegDepth, 
	TopDepth, 
	BaseDepth,
	UpdatedDate,
	CASE 
		WHEN RTRIM(LTRIM(PerforationDensity)) = '' THEN NULL
		ELSE PerforationDensity
	END AS PerforationDensity
FROM [StageDI].[Perforations] WITH (NOLOCK)
),
AggPerfDepths AS
(
SELECT 
	API14,
	AVG(PerforationLegDepth) AS DI_AvgOfBaseDepthMinusTopDepthForAllPerforationTests,
	SUM(PerforationLegDepth) AS DI_SumOfBaseDepthMinusTopDepthForAllPerforationTests,
	MIN(TopDepth) As DI_MinTopDepthPerforationTest,
	MAX(BaseDepth) AS DI_MaxBaseDepthPerformationTest,
	MAX(UpdatedDate) AS MaxUpdatedDate,
	AVG(CONVERT(NUMERIC(38, 16), PerforationDensity)) AS AveragePerforationDensity
FROM
PerfDepths p1
GROUP BY
	API14
),
llmetrics AS
(
SELECT
	wr.API14,
	CONVERT(DATETIME2(7), COALESCE(wr.UpdatedDate, p.MaxUpdatedDate)) AS LoadDate,
	wr.LateralLength AS TotalLateralLengths,
	wr.HorizontalLength AS TotalHorizontalLengths,
	wr.HorizontalWellboreLength AS TotalHorizontalWellboreLengths,
	p.DI_SumOfBaseDepthMinusTopDepthForAllPerforationTests AS TotalOffsetsMinTopDepthMaxBaseDepth,
	p.DI_AvgOfBaseDepthMinusTopDepthForAllPerforationTests AS AverageLateralLengthHorizontalDisplacement,
	p.DI_SumOfBaseDepthMinusTopDepthForAllPerforationTests AS TotalLateralLengthHorizontalDisplacement,
	p.AveragePerforationDensity AS TotalGrossPerforationInterval,
	p.DI_MinTopDepthPerforationTest AS MinTopDepth,
	p.DI_MaxBaseDepthPerformationTest AS MaxBaseDepth,
	wr.SurfaceHoleLongitudeWGS84,
	wr.SurfaceHoleLatitudeWGS84, 
	wr.BottomHoleLongitudeWGS84,
	wr.BottomHoleLatitudeWGS84
FROM
	[StageDI].[WellRollups] wr WITH (NOLOCK)
LEFT JOIN
AggPerfDepths p
ON
	p.API14 = wr.API14
),
DeaggDIData AS
(
SELECT
	tj1.GovernmentID AS API14,
	CONVERT(DATETIME2(7), tj1.UpdatedDate) AS LoadDate,
	CONVERT(BIGINT, tj1.StageCount) AS NUM_FRAC_STAGES,
	CASE
		WHEN tm1.ProppantSandClassification = 'SAND' AND tm1.MaterialUOM = 'LBS'  THEN CONVERT(NUMERIC(32, 16), tm1.MaterialAmount)
		ELSE NULL
	END AS PROPPANT_SAND_LBS,
	CASE
		WHEN tm1.ProppantSandClassification = 'RESIN COATED' AND tm1.MaterialUOM = 'LBS' THEN CONVERT(NUMERIC(32, 16), tm1.MaterialAmount)
		ELSE NULL
	END AS PROPPANT_RESIN_COATED_SAND_LBS,
	CASE
		WHEN tm1.ProppantSandClassification = 'CERAMIC' AND tm1.MaterialUOM = 'LBS' THEN CONVERT(NUMERIC(32, 16), tm1.MaterialAmount)
		ELSE NULL
	END AS PROPPANT_CERAMIC_LBS,
	CONVERT(BIGINT, TotalProppantlbs) AS TOTAL_PROPPANT_LBS,
	CASE
		WHEN tm1.MaterialType = 'WATER' AND tm1.MaterialUOM = 'GALS' THEN CONVERT(NUMERIC(32, 16), tm1.MaterialAmount)
		ELSE NULL
	END AS FLUID_WATER_GALS,
	CASE
		WHEN tm1.MaterialType = 'SLICKWATER' AND tm1.MaterialUOM = 'GALS' THEN CONVERT(NUMERIC(32, 16), tm1.MaterialAmount)
		ELSE NULL
	END AS FLUID_SLICK_WATER_GALS,
	CASE
		WHEN tm1.MaterialType = 'SALTWATER' AND tm1.MaterialUOM = 'GALS' THEN CONVERT(NUMERIC(32, 16), tm1.MaterialAmount)
		ELSE NULL
	END AS FLUID_SALT_WATER_GALS,
	CASE
		WHEN tm1.MaterialType = 'FOAM' AND tm1.MaterialUOM = 'GALS' THEN CONVERT(NUMERIC(32, 16), tm1.MaterialAmount)
		ELSE NULL
	END AS FLUID_FOAM_GALS,
	CASE
		WHEN tm1.MaterialType = 'OIL' AND tm1.MaterialUOM = 'GALS' THEN CONVERT(NUMERIC(32, 16), tm1.MaterialAmount)
		ELSE NULL
	END AS FLUID_OIL_GALS,
	CASE
		WHEN tm1.MaterialType = 'ACID' AND tm1.MaterialUOM = 'GALS' THEN CONVERT(NUMERIC(32, 16), tm1.MaterialAmount)
		ELSE NULL
	END AS ACID_GALS,
	CASE
		WHEN tm1.MaterialType = 'GEL' AND tm1.MaterialUOM = 'GALS' THEN CONVERT(NUMERIC(32, 16), tm1.MaterialAmount)
		ELSE NULL
	END AS GEL_X_LINK_GALS,
	CASE 
		WHEN ISNUMERIC(TotalFluidGal) = 1 THEN CONVERT(NUMERIC(32, 16), TotalFluidGal)
		ELSE NULL
	END AS TOTAL_FLUID_GALS
FROM
	StageDI.TreatmentJobs tj1 WITH (NOLOCK)
INNER JOIN
	StageDI.TreatmentMaterials tm1 WITH (NOLOCK)
ON
	tm1.TreatmentJobID = tj1.TreatmentJobID
WHERE
	tj1.DeletedDate IS NULL
),
AggDIData AS
(
SELECT
	API14,
	'DI Treatment Jobs' AS RecordSource,
	MAX([LoadDate]) AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	SUM([NUM_FRAC_STAGES]) AS NUM_FRAC_STAGES,
	COUNT(*) AS NUM_TREATMENT_RECORDS,
	SUM([PROPPANT_SAND_LBS]) AS PROPPANT_SAND_LBS,
	SUM([PROPPANT_RESIN_COATED_SAND_LBS]) AS PROPPANT_RESIN_COATED_SAND_LBS,
	SUM([PROPPANT_CERAMIC_LBS]) AS PROPPANT_CERAMIC_LBS,
	NULL AS PROPPANT_RESIN_COATED_CERAMIC_LBS,
	NULL AS PROPPAND_SAND_CERAMIC_LBS,
	NULL AS PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS,
	NULL AS PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS,
	NULL AS PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS,
	NULL AS PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS,
	NULL AS PROPPANT_BAUXITE_LBS,
	NULL AS PROPPANT_WALNUT_LBS,
	NULL AS PROPPANT_MARBLE_LBS,
	NULL AS PROPPANT_GRAVEL_LBS,
	NULL AS PROPPANT_SAND_BAUXITE_CERAMIC_LBS,
	NULL AS PROPPANT_OTHER_LBS,
	SUM([TOTAL_PROPPANT_LBS]) AS [TOTAL_PROPPANT_LBS],
	SUM([FLUID_WATER_GALS]) AS [FLUID_WATER_GALS],
	SUM([FLUID_SLICK_WATER_GALS]) AS [FLUID_SLICK_WATER_GALS],
	SUM([FLUID_SALT_WATER_GALS]) AS [FLUID_SALT_WATER_GALS],
	SUM([FLUID_FOAM_GALS]) AS [FLUID_FOAM_GALS],
	SUM([FLUID_OIL_GALS]) AS [FLUID_OIL_GALS],
	NULL AS FLUID_POTASSIUM_CHLORIDE_GALS,
	NULL AS FLUID_SURFACTANT_GALS,
	NULL AS FLUID_EMULSION_GALS,
	NULL AS N2_CO2_GAS_GALS,
	SUM([ACID_GALS]) AS [ACID_GALS],
	SUM([GEL_X_LINK_GALS]) AS [GEL_X_LINK_GALS],
	NULL AS FLUID_EXPLOSIVE_GALS,
	NULL AS FLUID_OTHER_GALS,
	SUM([TOTAL_FLUID_GALS]) AS [TOTAL_FLUID_GALS],
	COALESCE(SUM(TOTAL_PROPPANT_LBS), SUM(TOTAL_FLUID_GALS)) AS TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL
FROM
	DeaggDIData deagg
GROUP BY
	API14
)
SELECT
	HASHBYTES('SHA2_256', CONVERT(VARCHAR(20), RIGHT('000000000000000' + CONVERT(VARCHAR(14), agg.API14), 14))) AS WellHashKey,
	RecordSource,
	COALESCE(CASE
		WHEN agg.LoadDate > llmetrics.LoadDate THEN agg.LoadDate
		ELSE llmetrics.LoadDate
	END, GETDATE()) AS LoadDate,
	LoadEndDate,
	NUM_FRAC_STAGES,
	NUM_TREATMENT_RECORDS,
	PROPPANT_SAND_LBS,
	PROPPANT_RESIN_COATED_SAND_LBS,
	PROPPANT_CERAMIC_LBS,
	PROPPANT_RESIN_COATED_CERAMIC_LBS,
	PROPPAND_SAND_CERAMIC_LBS,
	PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS,
	PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS,
	PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS,
	PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS,
	PROPPANT_BAUXITE_LBS,
	PROPPANT_WALNUT_LBS,
	PROPPANT_MARBLE_LBS,
	PROPPANT_GRAVEL_LBS,
	PROPPANT_SAND_BAUXITE_CERAMIC_LBS,
	PROPPANT_OTHER_LBS,
	TOTAL_PROPPANT_LBS,
	FLUID_WATER_GALS,
	FLUID_SLICK_WATER_GALS,
	FLUID_SALT_WATER_GALS,
	FLUID_FOAM_GALS,
	FLUID_OIL_GALS,
	FLUID_POTASSIUM_CHLORIDE_GALS,
	FLUID_SURFACTANT_GALS,
	FLUID_EMULSION_GALS,
	N2_CO2_GAS_GALS,
	ACID_GALS,
	GEL_X_LINK_GALS,
	FLUID_EXPLOSIVE_GALS,
	FLUID_OTHER_GALS,
	TOTAL_FLUID_GALS,
	TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL,
	TotalLateralLengths,
	TotalOffsetsMinTopDepthMaxBaseDepth,
	AverageLateralLengthHorizontalDisplacement,
	TotalLateralLengthHorizontalDisplacement,
	TotalGrossPerforationInterval,
	MinTopDepth,
	MaxBaseDepth,
	SurfaceHoleLatitudeWGS84 AS SurfaceHoleLatitude,
	SurfaceHoleLongitudeWGS84 AS SurfaceHoleLongitude,
	BottomHoleLatitudeWGS84 AS BottomHoleLatitude, 
	BottomHoleLongitudeWGS84 AS BottomHoleLongitude
FROM
	AggDIData agg
LEFT JOIN
	llmetrics
ON
	agg.API14 = llmetrics.API14