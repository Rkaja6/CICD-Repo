/******************************
** Name:  vw_WellHeader_LateralLengthComparisonView
** Desc:
** Auth:  Aaron Vogt
** Date:  10/17/2019
**************************
** Change History
**************************
** PR   Date         Author    Description 
** --   ----------   -------   ------------------------------------
** 1    10/17/2019   Aaron V   Object creation
*******************************/
CREATE VIEW [Upstream].[vw_WellHeader_LateralLengthComparison]
	AS 
SELECT
	hub.API14,
	ihs_wt.TotalLateralLengths AS IHS_SumOfGrossLateralLengthsForAllTests,
	ihs_wt.TotalOffsetsMinTopDepthMaxBaseDepth AS IHS_SumOfBaseDepthMinusTopDepthForAllPerforationTests,
	ihs_wt.AverageLateralLengthHorizontalDisplacement AS IHS_AverageLateralLengthHorizontalDisplacement,
	ihs_wt.TotalLateralLengthHorizontalDisplacement AS IHS_TotalLateralLengthHorizontalDisplacement,
	ihs_wt.TotalGrossPerforationInterval AS IHS_TotalLateralLengthGrossPerforationInterval,
	ihs_wt.MinTopDepth AS IHS_MinimumDepthTopPerforationTest,
	ihs_wt.MaxBaseDepth AS IHS_MaximumDepthBasePerforationTest,
	ihs_wt.OffsetSurfaceCoordBHCoordFeet AS IHS_FeetBetweenSurfaceBHCoordinates,
	di_wt.TotalOffsetsMinTopDepthMaxBaseDepth AS DI_SumOfBaseDepthMinusTopDepthForAllPerforationTests,
	di_wt.TotalLateralLengths AS DI_WellRollupLateralLength,
	di_wt.TotalLateralLengthHorizontalDisplacement AS DI_WellRollupHorizontalLength,
	di_wt.TotalLateralLengthHorizontalDisplacement AS DI_WellRollupHorizontalWellboreLength,
	di_wt.MinTopDepth AS DI_MinTopDepthPerforationTest,
	di_wt.MaxBaseDepth AS DI_MaxBaseDepthPerformationTest,
	di_wt.OffsetSurfaceCoordBHCoordFeet AS DI_FeetBetweenSurfaceBHCoordinates
FROM
	[DW].[HubWell] hub WITH (NOLOCK)
INNER JOIN
	[DW].[SatWellHeader] wh WITH (NOLOCK)
ON
	hub.WellHashKey = wh.WellHashKey
LEFT JOIN
	[DW].[SatWellTreatment] ihs_wt WITH (NOLOCK)
ON
	wh.WellHashKey = ihs_wt.WellHashKey AND
	ihs_wt.RecordSource = 'IHS Well Treatment Summary'
LEFT JOIN
	[DW].[SatWellTreatment] di_wt WITH (NOLOCK)
ON
	wh.WellHashKey = di_wt.WellHashKey AND
	di_wt.RecordSource = 'DI Treatment Jobs'
WHERE
	--We may want to use a hub instead of this check.  If we had a wide satellite structure, we could use inner join, but using that with 
	--the architecture we are using would risk losing records for one or both data sources.
	ihs_wt.TotalLateralLengths IS NOT NULL OR
	ihs_wt.TotalOffsetsMinTopDepthMaxBaseDepth IS NOT NULL OR
	ihs_wt.AverageLateralLengthHorizontalDisplacement IS NOT NULL OR
	ihs_wt.TotalLateralLengthHorizontalDisplacement IS NOT NULL OR
	ihs_wt.TotalGrossPerforationInterval IS NOT NULL OR
	ihs_wt.MinTopDepth IS NOT NULL OR
	ihs_wt.MaxBaseDepth IS NOT NULL OR
	ihs_wt.OffsetSurfaceCoordBHCoordFeet IS NOT NULL OR
	di_wt.TotalOffsetsMinTopDepthMaxBaseDepth IS NOT NULL OR
	di_wt.TotalLateralLengths IS NOT NULL OR
	di_wt.TotalLateralLengthHorizontalDisplacement IS NOT NULL OR
	di_wt.TotalLateralLengthHorizontalDisplacement IS NOT NULL OR
	ihs_wt.MinTopDepth IS NOT NULL OR
	ihs_wt.MaxBaseDepth IS NOT NULL OR
	di_wt.OffsetSurfaceCoordBHCoordFeet IS NOT NULL