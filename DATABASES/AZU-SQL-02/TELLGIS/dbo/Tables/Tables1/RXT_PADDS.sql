CREATE TABLE [dbo].[RXT_PADDS] (
    [OBJECTID]          INT              NOT NULL,
    [PADD]              NVARCHAR (3)     NULL,
    [CNTRY_NAME]        NVARCHAR (30)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R367_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g330_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S330_idx]
    ON [dbo].[RXT_PADDS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7453285.3992, XMIN = -13887752.8114, YMAX = 6340549.5631, YMIN = 2816696.8023),
            CELLS_PER_OBJECT = 16
          );

