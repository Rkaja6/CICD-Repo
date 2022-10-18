CREATE TABLE [dbo].[BMP_WORLDGEOGRID] (
    [OBJECTID]          INT              NOT NULL,
    [LENGTH]            NUMERIC (38, 8)  NULL,
    [NAME]              NVARCHAR (23)    NULL,
    [VALUE]             NVARCHAR (6)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R192_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g173_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S173_idx]
    ON [dbo].[BMP_WORLDGEOGRID] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037507.0672, XMIN = -20037507.0672, YMAX = 30240971.795, YMIN = -30240971.9584),
            CELLS_PER_OBJECT = 16
          );

