﻿CREATE TABLE [dbo].[DI_COMPLETIONS] (
    [OBJECTID]               INT              NOT NULL,
    [compType]               NVARCHAR (2)     NOT NULL,
    [pKey]                   INT              NOT NULL,
    [latitude]               NUMERIC (38, 8)  NULL,
    [longitude]              NUMERIC (38, 8)  NULL,
    [priorWellType]          NVARCHAR (50)    NULL,
    [currentWellType]        NVARCHAR (255)   NULL,
    [wellId]                 INT              NOT NULL,
    [APIst]                  NVARCHAR (2)     NULL,
    [APIcty]                 NVARCHAR (3)     NULL,
    [API]                    NVARCHAR (16)    NULL,
    [stateid]                INT              NOT NULL,
    [countyid]               INT              NOT NULL,
    [state]                  NVARCHAR (5)     NULL,
    [countyName]             NVARCHAR (63)    NOT NULL,
    [operatorName]           NVARCHAR (255)   NULL,
    [operatorAlias]          NVARCHAR (255)   NULL,
    [leaseName]              NVARCHAR (120)   NULL,
    [totalDepth]             INT              NULL,
    [completion_date]        DATETIME2 (7)    NULL,
    [wellNumber]             NVARCHAR (32)    NULL,
    [fieldName]              NVARCHAR (120)   NULL,
    [priorWellStatus]        NVARCHAR (100)   NULL,
    [currentWellStatus]      NVARCHAR (255)   NULL,
    [elevation]              INT              NULL,
    [elevationRef]           NVARCHAR (8)     NULL,
    [Oil2ndMonthProd]        NUMERIC (38, 8)  NULL,
    [Gas2ndMonthProd]        NUMERIC (38, 8)  NULL,
    [ProdFirstDate]          DATETIME2 (7)    NULL,
    [OilLastMonthProd]       NUMERIC (38, 8)  NULL,
    [GasLastMonthProd]       NUMERIC (38, 8)  NULL,
    [maxMonthlyProdBOD]      INT              NULL,
    [maxMonthlyProdMCFD]     INT              NULL,
    [WaterLastMonthProd]     NUMERIC (38, 8)  NULL,
    [lastProdDate]           DATETIME2 (7)    NULL,
    [rrcLeaseNumber]         NVARCHAR (32)    NULL,
    [cumProdOil]             NUMERIC (38, 8)  NULL,
    [cumProdGas]             NUMERIC (38, 8)  NULL,
    [cumProdWater]           NUMERIC (38, 8)  NULL,
    [PIDepthFrom]            NUMERIC (38, 8)  NULL,
    [PIDepthTo]              NUMERIC (38, 8)  NULL,
    [PICount]                INT              NULL,
    [abstractNumber]         NVARCHAR (16)    NULL,
    [surveyName]             NVARCHAR (64)    NULL,
    [blockSection]           NVARCHAR (44)    NULL,
    [oilProdMaxAmount]       INT              NULL,
    [gasProdMaxAmount]       INT              NULL,
    [spudDate]               DATETIME2 (7)    NULL,
    [gravityOil]             NUMERIC (38, 8)  NULL,
    [gravityGas]             NUMERIC (38, 8)  NULL,
    [directionalSurveyExist] NVARCHAR (3)     NOT NULL,
    [daysPermitToSpud]       INT              NULL,
    [g1Created]              DATETIME2 (7)    NULL,
    [g1Updated]              DATETIME2 (7)    NULL,
    [w2Created]              DATETIME2 (7)    NULL,
    [w2Updated]              DATETIME2 (7)    NULL,
    [permitID]               INT              NULL,
    [AbstractId]             INT              NULL,
    [leaseID]                INT              NULL,
    [compmo]                 INT              NULL,
    [compyr]                 INT              NULL,
    [diLink]                 NVARCHAR (3999)  NULL,
    [Shape]                  [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]      VARBINARY (MAX)  NULL,
    CONSTRAINT [R487_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g450_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE NONCLUSTERED INDEX [pKey_Idx]
    ON [dbo].[DI_COMPLETIONS]([pKey] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [WellID_Idx]
    ON [dbo].[DI_COMPLETIONS]([wellId] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [I1497wellId]
    ON [dbo].[DI_COMPLETIONS]([wellId] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [I1497pKey]
    ON [dbo].[DI_COMPLETIONS]([pKey] ASC) WITH (FILLFACTOR = 75);


GO
CREATE SPATIAL INDEX [S450_idx]
    ON [dbo].[DI_COMPLETIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9830841.87068316, XMIN = -12614256.6326851, YMAX = 6274552.25119104, YMIN = 2990237.83419524),
            CELLS_PER_OBJECT = 16
          );

