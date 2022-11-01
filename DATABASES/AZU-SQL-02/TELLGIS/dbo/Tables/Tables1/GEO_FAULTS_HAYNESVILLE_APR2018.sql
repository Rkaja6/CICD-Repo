﻿CREATE TABLE [dbo].[GEO_FAULTS_HAYNESVILLE_APR2018] (
    [OBJECTID]          INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R262_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g243_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S243_idx]
    ON [dbo].[GEO_FAULTS_HAYNESVILLE_APR2018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10362933.2319, XMIN = -10458542.7854, YMAX = 3822438.3587, YMIN = 3722698.8628),
            CELLS_PER_OBJECT = 16
          );
