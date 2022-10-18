﻿CREATE TABLE [dbo].[WEL_SONRIS_WELLPITS_07102019] (
    [OBJECTID]          INT              NOT NULL,
    [PIT_TYPE]          NVARCHAR (50)    NULL,
    [WELL_SERIAL_NUM]   INT              NULL,
    [PIT_ID]            NVARCHAR (10)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R413_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g376_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S376_idx]
    ON [dbo].[WEL_SONRIS_WELLPITS_07102019] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9883404.14617874, XMIN = -10922449.3312173, YMAX = 3897866.7395393, YMIN = 3358251.47164924),
            CELLS_PER_OBJECT = 16
          );

