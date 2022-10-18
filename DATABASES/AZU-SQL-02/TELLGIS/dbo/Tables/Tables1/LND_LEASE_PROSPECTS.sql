CREATE TABLE [dbo].[LND_LEASE_PROSPECTS] (
    [OBJECTID]          INT              NOT NULL,
    [Id]                INT              NULL,
    [Name]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R610_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g573_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S573_idx]
    ON [dbo].[LND_LEASE_PROSPECTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10358162.8391, XMIN = -10401844.2602, YMAX = 3823065.3921, YMIN = 3727787.1724),
            CELLS_PER_OBJECT = 16
          );

