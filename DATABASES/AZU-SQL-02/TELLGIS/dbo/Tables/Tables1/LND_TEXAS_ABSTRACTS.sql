CREATE TABLE [dbo].[LND_TEXAS_ABSTRACTS] (
    [OBJECTID]          INT              NOT NULL,
    [ID]                INT              NULL,
    [COUNTY]            NVARCHAR (60)    NULL,
    [CTY_API]           NVARCHAR (3)     NULL,
    [DISTRICT]          NVARCHAR (2)     NULL,
    [BLOCKNA]           NVARCHAR (60)    NULL,
    [BLOCKNO]           NVARCHAR (60)    NULL,
    [BLOOVNA]           NVARCHAR (60)    NULL,
    [BLOOVNO]           NVARCHAR (60)    NULL,
    [SURVNA]            NVARCHAR (60)    NULL,
    [SURVNO]            NVARCHAR (60)    NULL,
    [SUROVNA]           NVARCHAR (60)    NULL,
    [SUROVNO]           NVARCHAR (60)    NULL,
    [ABSNA]             NVARCHAR (60)    NULL,
    [ABSNO]             NVARCHAR (60)    NULL,
    [ABSOVNA]           NVARCHAR (60)    NULL,
    [ABSOVNO]           NVARCHAR (60)    NULL,
    [SUBDNA]            NVARCHAR (60)    NULL,
    [SUBDNO]            NVARCHAR (60)    NULL,
    [LOTNA]             NVARCHAR (60)    NULL,
    [LOTNO]             NVARCHAR (60)    NULL,
    [TRACTNA]           NVARCHAR (60)    NULL,
    [TRACTNO]           NVARCHAR (60)    NULL,
    [DATUM]             NVARCHAR (5)     NULL,
    [SOURCE]            NVARCHAR (10)    NULL,
    [AMODDATE]          DATETIME2 (7)    NULL,
    [GMODDATE]          DATETIME2 (7)    NULL,
    [HIDDEN]            NVARCHAR (10)    NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R217_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g198_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S198_idx]
    ON [dbo].[LND_TEXAS_ABSTRACTS] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = -10409214.8992, XMIN = -10879143.3859, YMAX = 3968745.7887, YMIN = 3435421.3159),
            CELLS_PER_OBJECT = 16
          );

