CREATE TABLE [dbo].[LND_LEASEPROSPECTSX] (
    [OBJECTID]          INT              NOT NULL,
    [Id]                INT              NULL,
    [Name]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R651_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g614_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S614_idx]
    ON [dbo].[LND_LEASEPROSPECTSX] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10358162.8390847, XMIN = -10401844.260189, YMAX = 3823065.39208639, YMIN = 3727787.17242686),
            CELLS_PER_OBJECT = 16
          );

