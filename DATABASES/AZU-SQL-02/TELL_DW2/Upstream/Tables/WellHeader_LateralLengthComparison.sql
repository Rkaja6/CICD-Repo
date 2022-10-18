CREATE TABLE [Upstream].[WellHeader_LateralLengthComparison] (
    [API14]                                                 VARCHAR (20)     NULL,
    [IHS_SumOfGrossLateralLengthsForAllTests]               DECIMAL (38, 5)  NULL,
    [IHS_SumOfBaseDepthMinusTopDepthForAllPerforationTests] DECIMAL (38, 5)  NULL,
    [IHS_AverageLateralLengthHorizontalDisplacement]        INT              NULL,
    [IHS_TotalLateralLengthHorizontalDisplacement]          INT              NULL,
    [IHS_TotalLateralLengthGrossPerforationInterval]        DECIMAL (38, 5)  NULL,
    [IHS_MinimumDepthTopPerforationTest]                    DECIMAL (10, 5)  NULL,
    [IHS_MaximumDepthBasePerforationTest]                   DECIMAL (10, 5)  NULL,
    [IHS_FeetBetweenSurfaceBHCoordinates]                   NUMERIC (38, 14) NULL,
    [DI_SumOfBaseDepthMinusTopDepthForAllPerforationTests]  FLOAT (53)       NULL,
    [DI_WellRollupLateralLength]                            REAL             NULL,
    [DI_WellRollupDILateralLength]                          REAL             NULL,
    [DI_WellRollupHorizontalLength]                         REAL             NULL,
    [DI_WellRollupHorizontalWellboreLength]                 REAL             NULL,
    [DI_MinTopDepthPerforationTest]                         REAL             NULL,
    [DI_MaxBaseDepthPerformationTest]                       REAL             NULL,
    [DI_FeetBetweenSurfaceBHCoordinates]                    NUMERIC (38, 14) NULL
);

