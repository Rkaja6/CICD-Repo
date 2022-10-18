CREATE TABLE [dbo].[BMP_WORLDTIMEZONE] (
    [OBJECTID]          INT              NOT NULL,
    [ZONE]              NUMERIC (38, 8)  NULL,
    [SQMI]              NUMERIC (38, 8)  NULL,
    [SQKM]              NUMERIC (38, 8)  NULL,
    [Colormap]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R201_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g182_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S182_idx]
    ON [dbo].[BMP_WORLDTIMEZONE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037507.0672, XMIN = -20037507.0672, YMAX = 30240971.9584, YMIN = -30240971.9584),
            CELLS_PER_OBJECT = 16
          );

