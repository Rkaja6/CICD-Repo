CREATE TABLE [dbo].[CAD_PERMANENT_ACCESS_ROADS] (
    [OBJECTID]          INT              NOT NULL,
    [LABEL]             NVARCHAR (254)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R143_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g124_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S124_idx]
    ON [dbo].[CAD_PERMANENT_ACCESS_ROADS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10269617.984761, XMIN = -10397331.8423432, YMAX = 3583666.74031815, YMIN = 3516806.34176993),
            CELLS_PER_OBJECT = 16
          );

