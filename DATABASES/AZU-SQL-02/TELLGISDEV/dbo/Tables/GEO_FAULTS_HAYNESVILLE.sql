CREATE TABLE [dbo].[GEO_FAULTS_HAYNESVILLE] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R146_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g118_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S118_idx]
    ON [dbo].[GEO_FAULTS_HAYNESVILLE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10352768.9979, XMIN = -10544985.7788, YMAX = 3826896.4978, YMIN = 3674877.0443),
            CELLS_PER_OBJECT = 16
          );

