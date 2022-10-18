CREATE TABLE [dbo].[GEO_FAULTS_BOSSIER] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R145_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g117_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S117_idx]
    ON [dbo].[GEO_FAULTS_BOSSIER] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10352762.9894, XMIN = -10544450.934, YMAX = 3827194.7448, YMIN = 3674971.8136),
            CELLS_PER_OBJECT = 16
          );

