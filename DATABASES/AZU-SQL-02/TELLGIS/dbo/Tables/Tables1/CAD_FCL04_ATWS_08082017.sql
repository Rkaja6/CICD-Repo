CREATE TABLE [dbo].[CAD_FCL04_ATWS_08082017] (
    [OBJECTID]          INT              NOT NULL,
    [LABEL]             NVARCHAR (50)    NULL,
    [Notes]             NVARCHAR (50)    NULL,
    [Acreage]           NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R136_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g117_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S117_idx]
    ON [dbo].[CAD_FCL04_ATWS_08082017] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10269713.490601, XMIN = -10397593.489848, YMAX = 3583683.07554585, YMIN = 3516573.28029691),
            CELLS_PER_OBJECT = 16
          );

