CREATE TABLE [dbo].[LND_LEASEPROSPECTS] (
    [OBJECTID]          INT              NOT NULL,
    [Id]                INT              NULL,
    [Name]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R779_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g742_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S742_idx]
    ON [dbo].[LND_LEASEPROSPECTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10358162.8390847, XMIN = -10405564.1624955, YMAX = 3823065.3920864, YMIN = 3719848.01637073)
          );

