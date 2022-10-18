CREATE TABLE [dbo].[DI_WELLBHL] (
    [OBJECTID]                 INT              NOT NULL,
    [wellLocationBottomHoleId] INT              NOT NULL,
    [wellId]                   INT              NOT NULL,
    [countyId]                 INT              NULL,
    [state]                    NVARCHAR (5)     NOT NULL,
    [countyName]               NVARCHAR (63)    NOT NULL,
    [APIst]                    NVARCHAR (2)     NULL,
    [APIcty]                   NVARCHAR (3)     NULL,
    [API]                      NVARCHAR (16)    NULL,
    [abstractId]               INT              NULL,
    [permitId]                 INT              NULL,
    [g1Id]                     INT              NULL,
    [w2Id]                     INT              NULL,
    [surfaceLatitude]          NUMERIC (38, 8)  NULL,
    [surfaceLongitude]         NUMERIC (38, 8)  NULL,
    [bottomHoleLatitude]       NUMERIC (38, 8)  NULL,
    [bottomHoleLongitude]      NUMERIC (38, 8)  NULL,
    [priorWellType]            NVARCHAR (50)    NULL,
    [currentWellType]          NVARCHAR (255)   NULL,
    [priorWellStatusId]        INT              NULL,
    [priorWellStatus]          NVARCHAR (100)   NULL,
    [currentWellStatus]        NVARCHAR (255)   NULL,
    [DEFlag]                   NVARCHAR (32)    NULL,
    [removed]                  SMALLINT         NULL,
    [lineItem]                 INT              NULL,
    [end_loc]                  NVARCHAR (25)    NULL,
    [loc_quality]              INT              NULL,
    [created]                  DATETIME2 (7)    NOT NULL,
    [updated]                  DATETIME2 (7)    NOT NULL,
    [Shape]                    [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]        VARBINARY (MAX)  NULL,
    CONSTRAINT [R34_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g24_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE NONCLUSTERED INDEX [wellLocBHLId_Idx]
    ON [dbo].[DI_WELLBHL]([wellLocationBottomHoleId] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [wellid_Idx]
    ON [dbo].[DI_WELLBHL]([wellId] ASC) WITH (FILLFACTOR = 75);


GO
CREATE SPATIAL INDEX [S24_idx]
    ON [dbo].[DI_WELLBHL] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8213908.2905, XMIN = -18465213.9583, YMAX = 11513118.3416, YMIN = 2984445.1884),
            CELLS_PER_OBJECT = 16
          );

