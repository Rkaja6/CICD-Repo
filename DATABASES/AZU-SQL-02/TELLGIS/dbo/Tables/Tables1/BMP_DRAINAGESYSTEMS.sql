CREATE TABLE [dbo].[BMP_DRAINAGESYSTEMS] (
    [OBJECTID]          INT              NOT NULL,
    [SYSTEM]            NVARCHAR (22)    NULL,
    [MILES]             NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R78_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g68_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S68_idx]
    ON [dbo].[BMP_DRAINAGESYSTEMS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

