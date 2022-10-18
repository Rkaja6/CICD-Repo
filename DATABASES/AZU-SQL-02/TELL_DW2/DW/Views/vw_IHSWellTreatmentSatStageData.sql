/******************************
** Name:  [vw_IHSWellTreatmentSatStageData]
** Desc:
** Auth:  Aaron Vogt
** Date:  10/14/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    10/14/2019   Aaron     Object creation
** 2    12/6/2019    Aaron V   Modified to start wtih API14's from HUB to ensure that all treatnmebt, summary data is represented
*******************************/
CREATE VIEW [DW].[vw_IHSWellTreatmentSatStageData]
	AS
SELECT
	hub.WellHashKey,
	'IHS Well Treatment Summary' AS RecordSource,
	CONVERT(DATETIME2(7), COALESCE(wts.[CADIS_SYSTEM_UPDATED], lldim.[CADIS_SYSTEM_UPDATED], wh.[CADIS_SYSTEM_UPDATED], GETDATE())) AS LoadDate,
	CONVERT(DATETIME2(7), NULL) AS LoadEndDate,
	wts.NUM_FRAC_STAGES,
	wts.NUM_TREATMENT_RECORDS,
	wts.PROPPANT_SAND_LBS,
	wts.PROPPANT_RESIN_COATED_SAND_LBS,
	wts.PROPPANT_CERAMIC_LBS,
	wts.PROPPANT_RESIN_COATED_CERAMIC_LBS,
	wts.PROPPAND_SAND_CERAMIC_LBS,
	wts.PROPPANT_SAND_RESIN_COATED_CERAMIC_LBS,
	wts.PROPPANT_SAND_CERAMIC_RESIN_COATED_SAND_LBS,
	wts.PROPPANT_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS,
	wts.PROPPANT_SAND_RESIN_COATED_SAND_CERAMIC_RESIN_COATED_CERAMIC_LBS,
	wts.PROPPANT_BAUXITE_LBS,
	wts.PROPPANT_WALNUT_LBS,
	wts.PROPPANT_MARBLE_LBS,
	wts.PROPPANT_GRAVEL_LBS,
	wts.PROPPANT_SAND_BAUXITE_CERAMIC_LBS,
	wts.PROPPANT_OTHER_LBS,
	wts.TOTAL_PROPPANT_LBS,
	wts.FLUID_WATER_GALS,
	wts.FLUID_SLICK_WATER_GALS,
	wts.FLUID_SALT_WATER_GALS,
	wts.FLUID_FOAM_GALS,
	wts.FLUID_OIL_GALS,
	wts.FLUID_POTASSIUM_CHLORIDE_GALS,
	wts.FLUID_SURFACTANT_GALS,
	wts.FLUID_EMULSION_GALS,
	wts.N2_CO2_GAS_GALS,
	wts.ACID_GALS,
	wts.GEL_X_LINK_GALS,
	wts.FLUID_EXPLOSIVE_GALS,
	wts.FLUID_OTHER_GALS,
	wts.TOTAL_FLUID_GALS,
	wts.TOTAL_PROPPANT_LBS_OR_TOTAL_FLUID_GAL,
	lldim.TotalLateralLengths,
	lldim.TotalOffsetsMinTopDepthMaxBaseDepth,
	lldim.AverageLateralLengthHorizontalDisplacement,
	lldim.TotalLateralLengthHorizontalDisplacement,
	lldim.TotalGrossPerforationInterval,
	lldim.MinTopDepth,
	lldim.MaxBaseDepth,
	wh.SURFACE_LONGITUDE AS SurfaceHoleLongitude, 
	wh.SURFACE_LATITUDE AS SurfaceHoleLatitude,
	wh.BH_LONGITUDE AS BottomHoleLongitude,
	wh.BH_LATITUDE AS BottomHoleLatitude
FROM 
	DW.HubWell hub
LEFT JOIN
	StageIHS.T_WELL_TREATMENT_SUMMARY wts WITH (NOLOCK)
ON
	hub.API14 = wts.UWI
LEFT JOIN
(
SELECT
	UWI,
	SUM(LAT_LEN_GROSS_PERF_INTVL) AS TotalLateralLengths,
	SUM(COALESCE(DEPTH_BASE, DEPTH_TOP, 0) - COALESCE(DEPTH_TOP, DEPTH_BASE, 0)) AS TotalOffsetsMinTopDepthMaxBaseDepth,
	AVG(LAT_LEN_HORIZ_DISPLACEMENT_FT) AS AverageLateralLengthHorizontalDisplacement,
	SUM(LAT_LEN_HORIZ_DISPLACEMENT_FT) AS TotalLateralLengthHorizontalDisplacement,
	SUM(LAT_LEN_GROSS_PERF_INTVL) AS TotalGrossPerforationInterval,
	MIN(DEPTH_TOP) AS MinTopDepth,
	MAX(DEPTH_BASE) AS MaxBaseDepth,
	MAX(CADIS_SYSTEM_UPDATED) AS [CADIS_SYSTEM_UPDATED]
FROM
	StageIHS.T_WELL_TEST_PERFORATION wtp1 WITH (NOLOCK)
GROUP BY
	UWI
) lldim
ON
	hub.API14 = lldim.UWI
LEFT JOIN
	StageIHS.T_WELL_HEADER wh
ON
	hub.API14 = wh.UWI
WHERE
	hub.WellHashKey IS NOT NULL AND
	(wts.UWI IS NOT NULL OR lldim.UWI IS NOT NULL OR wh.UWI IS NOT NULL)