﻿CREATE TABLE [dbo].[BMP_WORLDCONTOURS] (
    [OBJECTID]          INT              NOT NULL,
    [METERS]            SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R188_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g169_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S169_idx]
    ON [dbo].[BMP_WORLDCONTOURS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037507.0672, XMIN = -20037507.0672, YMAX = 18413979.0271, YMIN = -8279431.2387),
            CELLS_PER_OBJECT = 16
          );

