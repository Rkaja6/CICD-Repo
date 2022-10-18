﻿CREATE TABLE [dbo].[GEO_SWD_DRILLINGINFO_TX_03282019] (
    [OBJECTID]          INT              NOT NULL,
    [API10]             NVARCHAR (254)   NULL,
    [API12]             NVARCHAR (254)   NULL,
    [API14]             NVARCHAR (254)   NULL,
    [WellName]          NVARCHAR (254)   NULL,
    [WellNo]            NVARCHAR (254)   NULL,
    [LeaseNam]          NVARCHAR (254)   NULL,
    [OpAlias]           NVARCHAR (254)   NULL,
    [OpCompany]         NVARCHAR (254)   NULL,
    [OpReported]        NVARCHAR (254)   NULL,
    [OpTicker]          NVARCHAR (254)   NULL,
    [Field]             NVARCHAR (254)   NULL,
    [County]            NVARCHAR (254)   NULL,
    [DIBasin]           NVARCHAR (254)   NULL,
    [DIPlay]            NVARCHAR (254)   NULL,
    [DISubplay]         NVARCHAR (254)   NULL,
    [DILandZone]        NVARCHAR (254)   NULL,
    [TargetFm]          NVARCHAR (254)   NULL,
    [ProdReserv]        NVARCHAR (254)   NULL,
    [Elevation]         NUMERIC (38, 8)  NULL,
    [ElevType]          NVARCHAR (254)   NULL,
    [GL]                NUMERIC (38, 8)  NULL,
    [TD]                NUMERIC (38, 8)  NULL,
    [TVD]               NUMERIC (38, 8)  NULL,
    [ProdType]          NVARCHAR (254)   NULL,
    [WellStat]          NVARCHAR (254)   NULL,
    [EntityCnt]         INT              NULL,
    [EntityId]          NVARCHAR (254)   NULL,
    [EntityType]        NVARCHAR (254)   NULL,
    [LeaseNo]           NVARCHAR (254)   NULL,
    [SpudDate]          DATETIME2 (7)    NULL,
    [CompDate]          DATETIME2 (7)    NULL,
    [DrlType]           NVARCHAR (254)   NULL,
    [TopPerf]           NUMERIC (38, 8)  NULL,
    [BtmPerf]           NUMERIC (38, 8)  NULL,
    [PerfLen]           NUMERIC (38, 8)  NULL,
    [HzLen]             NUMERIC (38, 8)  NULL,
    [LatLength]         NUMERIC (38, 8)  NULL,
    [BoreCnt]           INT              NULL,
    [CompCnt]           INT              NULL,
    [NumTreat]          INT              NULL,
    [ProdDate]          DATETIME2 (7)    NULL,
    [LstPrdDate]        DATETIME2 (7)    NULL,
    [MonthsProd]        INT              NULL,
    [JobStart]          DATETIME2 (7)    NULL,
    [JobEnd]            DATETIME2 (7)    NULL,
    [JobType]           NVARCHAR (254)   NULL,
    [TreatType]         NVARCHAR (254)   NULL,
    [FracVendor]        NVARCHAR (254)   NULL,
    [StageCnt]          INT              NULL,
    [MaxRate]           NUMERIC (38, 8)  NULL,
    [MaxPress]          NUMERIC (38, 8)  NULL,
    [TotProp]           NUMERIC (38, 8)  NULL,
    [TotFluid]          NUMERIC (38, 8)  NULL,
    [TotAddtv]          NUMERIC (38, 8)  NULL,
    [PropHzFt]          NUMERIC (38, 8)  NULL,
    [PropPfFt]          NUMERIC (38, 8)  NULL,
    [FluidPfFt]         NUMERIC (38, 8)  NULL,
    [PropConc]          NUMERIC (38, 8)  NULL,
    [TestGas]           NUMERIC (38, 8)  NULL,
    [TestOil]           NUMERIC (38, 8)  NULL,
    [TestWat]           NUMERIC (38, 8)  NULL,
    [TestHrs]           NUMERIC (38, 8)  NULL,
    [ProdMeth]          NVARCHAR (254)   NULL,
    [TestDate]          DATETIME2 (7)    NULL,
    [TestType]          NVARCHAR (254)   NULL,
    [LstTstDate]        DATETIME2 (7)    NULL,
    [LstTstType]        NVARCHAR (254)   NULL,
    [TestGsGrav]        NUMERIC (38, 8)  NULL,
    [TestLqGrav]        NUMERIC (38, 8)  NULL,
    [TestGOR]           NUMERIC (38, 8)  NULL,
    [CasPress]          NUMERIC (38, 8)  NULL,
    [ChokeSz]           NVARCHAR (254)   NULL,
    [TubPress]          NUMERIC (38, 8)  NULL,
    [PracIP_BOE]        NUMERIC (38, 8)  NULL,
    [PracIP_Gas]        NUMERIC (38, 8)  NULL,
    [PracIP_Liq]        NUMERIC (38, 8)  NULL,
    [PrcIPCFGED]        NUMERIC (38, 8)  NULL,
    [PeakBOE]           NUMERIC (38, 8)  NULL,
    [PkBOEMoNo]         INT              NULL,
    [PeakGas]           NUMERIC (38, 8)  NULL,
    [PkGasMoNo]         INT              NULL,
    [PeakLiq]           NUMERIC (38, 8)  NULL,
    [PkLiqMoNo]         INT              NULL,
    [PkMMCFGE]          NUMERIC (38, 8)  NULL,
    [PkMMCFGMoN]        INT              NULL,
    [PkBOEPerFt]        NUMERIC (38, 8)  NULL,
    [PkGasPerFt]        NUMERIC (38, 8)  NULL,
    [PkLiqPerFt]        NUMERIC (38, 8)  NULL,
    [PkBOEPerPt]        NUMERIC (38, 8)  NULL,
    [PkGasPerPt]        NUMERIC (38, 8)  NULL,
    [PkLiqPerPt]        NUMERIC (38, 8)  NULL,
    [PkBOEPerFl]        NUMERIC (38, 8)  NULL,
    [PkGasPerFl]        NUMERIC (38, 8)  NULL,
    [PkLiqPerFl]        NUMERIC (38, 8)  NULL,
    [BOECum]            NUMERIC (38, 8)  NULL,
    [GasCum]            NUMERIC (38, 8)  NULL,
    [LiqCum]            NUMERIC (38, 8)  NULL,
    [WtrCum]            NUMERIC (38, 8)  NULL,
    [CumGOR]            NUMERIC (38, 8)  NULL,
    [CumBCFGE]          NUMERIC (38, 8)  NULL,
    [CumMMCFGE]         NUMERIC (38, 8)  NULL,
    [DailyGas]          NUMERIC (38, 8)  NULL,
    [DailyOil]          NUMERIC (38, 8)  NULL,
    [LatestGas]         NUMERIC (38, 8)  NULL,
    [LatestLiq]         NUMERIC (38, 8)  NULL,
    [LatestWtr]         NUMERIC (38, 8)  NULL,
    [LatestYld]         NUMERIC (38, 8)  NULL,
    [LatstWHSIP]        NUMERIC (38, 8)  NULL,
    [LatestGOR]         NUMERIC (38, 8)  NULL,
    [F1moGas]           NUMERIC (38, 8)  NULL,
    [F1moLiq]           NUMERIC (38, 8)  NULL,
    [F1moWater]         NUMERIC (38, 8)  NULL,
    [F2moGOR]           NUMERIC (38, 8)  NULL,
    [F2moYield]         NUMERIC (38, 8)  NULL,
    [F6moBOE]           NUMERIC (38, 8)  NULL,
    [F6moGas]           NUMERIC (38, 8)  NULL,
    [F6moLiq]           NUMERIC (38, 8)  NULL,
    [F6moWtr]           NUMERIC (38, 8)  NULL,
    [F6BOEPerFt]        NUMERIC (38, 8)  NULL,
    [F6GasPerFt]        NUMERIC (38, 8)  NULL,
    [F6LiqPerFt]        NUMERIC (38, 8)  NULL,
    [F6BOEPerPt]        NUMERIC (38, 8)  NULL,
    [F6GasPerPt]        NUMERIC (38, 8)  NULL,
    [F6OilPerPt]        NUMERIC (38, 8)  NULL,
    [F6BOEPerFl]        NUMERIC (38, 8)  NULL,
    [F6GasPerFl]        NUMERIC (38, 8)  NULL,
    [F6LiqPerFl]        NUMERIC (38, 8)  NULL,
    [F12moBOE]          NUMERIC (38, 8)  NULL,
    [F12moGas]          NUMERIC (38, 8)  NULL,
    [F12moLiq]          NUMERIC (38, 8)  NULL,
    [F12moWtr]          NUMERIC (38, 8)  NULL,
    [F12moMMCFGE]       NUMERIC (38, 8)  NULL,
    [F12BOEPerFt]       NUMERIC (38, 8)  NULL,
    [F12GasPerFt]       NUMERIC (38, 8)  NULL,
    [F12LiqPerFt]       NUMERIC (38, 8)  NULL,
    [F12BOEPerPt]       NUMERIC (38, 8)  NULL,
    [F12GasPerPt]       NUMERIC (38, 8)  NULL,
    [F12LiqPerPt]       NUMERIC (38, 8)  NULL,
    [F12BOEPerFl]       NUMERIC (38, 8)  NULL,
    [F12GasPerFl]       NUMERIC (38, 8)  NULL,
    [F12LiqPerFl]       NUMERIC (38, 8)  NULL,
    [Last12Gas]         NUMERIC (38, 8)  NULL,
    [Last12Liq]         NUMERIC (38, 8)  NULL,
    [Last12Wtr]         NUMERIC (38, 8)  NULL,
    [Lst12Yield]        NUMERIC (38, 8)  NULL,
    [Prior12Gas]        NUMERIC (38, 8)  NULL,
    [Prior12Liq]        NUMERIC (38, 8)  NULL,
    [Prior12Wtr]        NUMERIC (38, 8)  NULL,
    [F24moBOE]          NUMERIC (38, 8)  NULL,
    [F24moGas]          NUMERIC (38, 8)  NULL,
    [F24moLiq]          NUMERIC (38, 8)  NULL,
    [F24moWtr]          NUMERIC (38, 8)  NULL,
    [F24moMMCFGE]       NUMERIC (38, 8)  NULL,
    [F60moBOE]          NUMERIC (38, 8)  NULL,
    [F60moGas]          NUMERIC (38, 8)  NULL,
    [F60moLiq]          NUMERIC (38, 8)  NULL,
    [F60moWtr]          NUMERIC (38, 8)  NULL,
    [F60moMMCFGE]       NUMERIC (38, 8)  NULL,
    [EURProduct]        NVARCHAR (254)   NULL,
    [EURDate]           DATETIME2 (7)    NULL,
    [BE_LiqEUR]         NUMERIC (38, 8)  NULL,
    [BELiqEUR_D]        NUMERIC (38, 8)  NULL,
    [BELqEUR_DP]        NUMERIC (38, 8)  NULL,
    [BE_GasEUR]         NUMERIC (38, 8)  NULL,
    [BEGasEUR_D]        NUMERIC (38, 8)  NULL,
    [BEGsEUR_DP]        NUMERIC (38, 8)  NULL,
    [BE_BFactor]        NUMERIC (38, 8)  NULL,
    [BE_InRate]         NUMERIC (38, 8)  NULL,
    [BE_FnlRate]        NUMERIC (38, 8)  NULL,
    [BE_EndDate]        DATETIME2 (7)    NULL,
    [BE_InDecl]         NUMERIC (38, 8)  NULL,
    [BE_LiqRRR]         NUMERIC (38, 8)  NULL,
    [BE_GasRRR]         NUMERIC (38, 8)  NULL,
    [EUROil]            NUMERIC (38, 8)  NULL,
    [EURGas]            NUMERIC (38, 8)  NULL,
    [Full_BFac]         NUMERIC (38, 8)  NULL,
    [Full_FnlRt]        NUMERIC (38, 8)  NULL,
    [Full_EndDt]        DATETIME2 (7)    NULL,
    [Full_InDcl]        NUMERIC (38, 8)  NULL,
    [FullLiqRRR]        NUMERIC (38, 8)  NULL,
    [FullGasRRR]        NUMERIC (38, 8)  NULL,
    [EURLqPerFt]        NUMERIC (38, 8)  NULL,
    [EURGsPerFt]        NUMERIC (38, 8)  NULL,
    [EURLqPerPt]        NUMERIC (38, 8)  NULL,
    [EURGsPerPt]        NUMERIC (38, 8)  NULL,
    [EURLqPerFl]        NUMERIC (38, 8)  NULL,
    [EURGsPerFl]        NUMERIC (38, 8)  NULL,
    [PAHzLen]           NUMERIC (38, 8)  NULL,
    [HzTVDSS]           NUMERIC (38, 8)  NULL,
    [PercZone]          NUMERIC (38, 8)  NULL,
    [ToeInZon]          NVARCHAR (254)   NULL,
    [FtinZone]          NUMERIC (38, 8)  NULL,
    [TopZone]           NUMERIC (38, 8)  NULL,
    [BaseZone]          NUMERIC (38, 8)  NULL,
    [HZIso]             NUMERIC (38, 8)  NULL,
    [HasTraj]           NVARCHAR (3)     NULL,
    [HasLAS]            NVARCHAR (3)     NULL,
    [HasRast]           NVARCHAR (3)     NULL,
    [LASMnem]           NVARCHAR (254)   NULL,
    [Country]           NVARCHAR (254)   NULL,
    [GeoProvin]         NVARCHAR (254)   NULL,
    [PABasin]           NVARCHAR (254)   NULL,
    [State]             NVARCHAR (254)   NULL,
    [Section]           NVARCHAR (254)   NULL,
    [Township]          NVARCHAR (254)   NULL,
    [Range]             NVARCHAR (254)   NULL,
    [QrtQrt]            NVARCHAR (254)   NULL,
    [District]          NVARCHAR (254)   NULL,
    [Abstract]          NVARCHAR (254)   NULL,
    [Block]             NVARCHAR (254)   NULL,
    [Survey]            NVARCHAR (254)   NULL,
    [OCS_Area]          NVARCHAR (254)   NULL,
    [PGC_Area]          NVARCHAR (254)   NULL,
    [ShallowPrf]        NUMERIC (38, 8)  NULL,
    [DeepestPrf]        NUMERIC (38, 8)  NULL,
    [GrosPrfInt]        NUMERIC (38, 8)  NULL,
    [LiqGather]         NVARCHAR (254)   NULL,
    [GasGather]         NVARCHAR (254)   NULL,
    [LiqGrav]           NUMERIC (38, 8)  NULL,
    [GasGrav]           NUMERIC (38, 8)  NULL,
    [UWI]               NVARCHAR (254)   NULL,
    [Latitude]          NUMERIC (38, 8)  NULL,
    [Longitud]          NUMERIC (38, 8)  NULL,
    [BtmLat]            NUMERIC (38, 8)  NULL,
    [BtmLon]            NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R409_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g372_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S372_idx]
    ON [dbo].[GEO_SWD_DRILLINGINFO_TX_03282019] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10462934.7024997, XMIN = -10710000.965229, YMAX = 3876644.05680274, YMIN = 3695431.05900274),
            CELLS_PER_OBJECT = 16
          );

