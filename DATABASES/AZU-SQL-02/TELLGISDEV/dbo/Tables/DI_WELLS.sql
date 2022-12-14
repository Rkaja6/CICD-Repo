CREATE TABLE [dbo].[DI_WELLS] (
    [OBJECTID]          INT              NOT NULL,
    [wellId]            INT              NOT NULL,
    [stateId]           INT              NOT NULL,
    [countyId]          INT              NOT NULL,
    [APIst]             NVARCHAR (2)     NULL,
    [APIcty]            NVARCHAR (3)     NULL,
    [API]               NVARCHAR (16)    NULL,
    [state]             NVARCHAR (2)     NULL,
    [countyName]        NVARCHAR (255)   NULL,
    [latitude]          NUMERIC (38, 8)  NULL,
    [longitude]         NUMERIC (38, 8)  NULL,
    [abstractId]        INT              NULL,
    [priorWellTypeCode] NVARCHAR (2)     NULL,
    [priorWellType]     NVARCHAR (50)    NULL,
    [currentWellType]   NVARCHAR (255)   NULL,
    [operId]            INT              NULL,
    [operator]          NVARCHAR (100)   NULL,
    [operatorAlias]     NVARCHAR (255)   NULL,
    [TD]                INT              NULL,
    [wellNo]            NVARCHAR (32)    NULL,
    [leaseNm]           NVARCHAR (128)   NULL,
    [spudDate]          DATETIME2 (7)    NULL,
    [elev]              INT              NULL,
    [elev_ref]          NVARCHAR (8)     NULL,
    [priorWellStatusId] INT              NULL,
    [priorWellStatus]   NVARCHAR (100)   NULL,
    [currentWellStatus] NVARCHAR (255)   NULL,
    [created]           DATETIME2 (7)    NULL,
    [updated]           DATETIME2 (7)    NULL,
    [diLink]            NVARCHAR (4000)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R35_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g25_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE NONCLUSTERED INDEX [operid_Idx]
    ON [dbo].[DI_WELLS]([operId] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [TD_Idx]
    ON [dbo].[DI_WELLS]([TD] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [wellid_Idx]
    ON [dbo].[DI_WELLS]([wellId] ASC) WITH (FILLFACTOR = 75);


GO
CREATE SPATIAL INDEX [S25_idx]
    ON [dbo].[DI_WELLS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8169373.6416, XMIN = -19847112.1983, YMAX = 11700992.8019, YMIN = 2762292.2267),
            CELLS_PER_OBJECT = 16
          );

