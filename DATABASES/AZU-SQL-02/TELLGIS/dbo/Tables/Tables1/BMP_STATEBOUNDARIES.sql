CREATE TABLE [dbo].[BMP_STATEBOUNDARIES] (
    [OBJECTID]          INT              NOT NULL,
    [Type]              INT              NULL,
    [Type_Desc]         NVARCHAR (16)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R96_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g86_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S86_idx]
    ON [dbo].[BMP_STATEBOUNDARIES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

