CREATE TABLE [dbo].[BMP_WORLDLATLONG] (
    [OBJECTID]          INT              NOT NULL,
    [VALUE]             NVARCHAR (4)     NULL,
    [DEGREE5]           NVARCHAR (1)     NULL,
    [DEGREE10]          NVARCHAR (1)     NULL,
    [DEGREE15]          NVARCHAR (1)     NULL,
    [DEGREE20]          NVARCHAR (1)     NULL,
    [DEGREE30]          NVARCHAR (1)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R196_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g177_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S177_idx]
    ON [dbo].[BMP_WORLDLATLONG] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037507.0672, XMIN = -20037507.0672, YMAX = 30240972.3939194, YMIN = -30240971.9584),
            CELLS_PER_OBJECT = 16
          );

