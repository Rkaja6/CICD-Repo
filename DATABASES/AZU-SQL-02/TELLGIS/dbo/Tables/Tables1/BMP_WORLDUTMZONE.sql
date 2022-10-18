CREATE TABLE [dbo].[BMP_WORLDUTMZONE] (
    [OBJECTID]          INT              NOT NULL,
    [ZONE]              NUMERIC (38, 8)  NULL,
    [ROW_]              NVARCHAR (1)     NULL,
    [WEST_VALUE]        NVARCHAR (4)     NULL,
    [CM_VALUE]          NVARCHAR (5)     NULL,
    [EAST_VALUE]        NVARCHAR (4)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R202_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g183_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S183_idx]
    ON [dbo].[BMP_WORLDUTMZONE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037507.0672, XMIN = -20037507.0672, YMAX = 30240971.9584, YMIN = -30240971.9584),
            CELLS_PER_OBJECT = 16
          );

