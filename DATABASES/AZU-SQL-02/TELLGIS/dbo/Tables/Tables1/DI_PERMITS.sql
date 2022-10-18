CREATE TABLE [dbo].[DI_PERMITS] (
    [OBJECTID]                INT              NOT NULL,
    [permitId]                INT              NOT NULL,
    [longitude]               NUMERIC (38, 8)  NULL,
    [latitude]                NUMERIC (38, 8)  NULL,
    [state]                   NVARCHAR (5)     NOT NULL,
    [countyName]              NVARCHAR (63)    NOT NULL,
    [APIst]                   NVARCHAR (2)     NULL,
    [APIcty]                  NVARCHAR (3)     NULL,
    [API]                     NVARCHAR (16)    NULL,
    [stateId]                 INT              NOT NULL,
    [countyId]                INT              NOT NULL,
    [leaseName]               NVARCHAR (64)    NULL,
    [ocompany]                NVARCHAR (255)   NULL,
    [operatorAlias]           NVARCHAR (255)   NULL,
    [dateReceived]            DATETIME2 (7)    NULL,
    [dateIssued]              DATETIME2 (7)    NULL,
    [wellnumber]              NVARCHAR (32)    NULL,
    [permitTD]                INT              NULL,
    [wellTotalDepth]          INT              NULL,
    [priorWellStatus]         NVARCHAR (100)   NULL,
    [currentWellStatus]       NVARCHAR (255)   NULL,
    [totalDepthType]          NVARCHAR (128)   NULL,
    [elevation]               INT              NULL,
    [elevationRef]            NVARCHAR (8)     NULL,
    [statePermitSerialNumber] NVARCHAR (30)    NOT NULL,
    [section]                 NUMERIC (38, 8)  NULL,
    [township]                NUMERIC (38, 8)  NULL,
    [townshipDirection]       NVARCHAR (10)    NULL,
    [range]                   NUMERIC (38, 8)  NULL,
    [rangeDirection]          NVARCHAR (10)    NULL,
    [abstractNumber]          NVARCHAR (16)    NULL,
    [surveyName]              NVARCHAR (100)   NULL,
    [blockSection]            NVARCHAR (100)   NULL,
    [Target_Formation]        NVARCHAR (256)   NULL,
    [isVertical]              NVARCHAR (1)     NOT NULL,
    [completeContact]         NVARCHAR (1000)  NOT NULL,
    [daysPermitToSpud]        INT              NULL,
    [created]                 DATETIME2 (7)    NULL,
    [updated]                 DATETIME2 (7)    NOT NULL,
    [wellId]                  INT              NOT NULL,
    [abstractId]              INT              NULL,
    [PermitYR]                INT              NULL,
    [PermitMO]                INT              NULL,
    [diLink]                  NVARCHAR (3999)  NULL,
    [Shape]                   [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]       VARBINARY (MAX)  NULL,
    CONSTRAINT [R506_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g469_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE NONCLUSTERED INDEX [wellTotDepth_Idx]
    ON [dbo].[DI_PERMITS]([wellTotalDepth] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [permitTD_Idx]
    ON [dbo].[DI_PERMITS]([permitTD] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [permitid_Idx]
    ON [dbo].[DI_PERMITS]([permitId] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [I1516permitId]
    ON [dbo].[DI_PERMITS]([permitId] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [I1516permitTD]
    ON [dbo].[DI_PERMITS]([permitTD] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [I1516wellTotalDe]
    ON [dbo].[DI_PERMITS]([wellTotalDepth] ASC) WITH (FILLFACTOR = 75);


GO
CREATE SPATIAL INDEX [S469_idx]
    ON [dbo].[DI_PERMITS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8195528.62588942, XMIN = -18465214.3276043, YMAX = 11485806.0800161, YMIN = 2828186.60723627),
            CELLS_PER_OBJECT = 16
          );

