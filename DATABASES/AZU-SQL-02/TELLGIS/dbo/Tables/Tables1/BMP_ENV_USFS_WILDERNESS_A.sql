﻿CREATE TABLE [dbo].[BMP_ENV_USFS_WILDERNESS_A] (
    [OBJECTID]          INT              NOT NULL,
    [WILDERNESSID]      NVARCHAR (40)    NULL,
    [WILDERNESSNAME]    NVARCHAR (80)    NULL,
    [AREAID]            NVARCHAR (6)     NULL,
    [BOUNDARYSTATUS]    NVARCHAR (40)    NULL,
    [GIS_ACRES]         NUMERIC (38, 8)  NULL,
    [WID]               INT              NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R284_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g265_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S265_idx]
    ON [dbo].[BMP_ENV_USFS_WILDERNESS_A] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = -7321572.917, XMIN = -15544235.0954, YMAX = 8399672.598, YMIN = 2066644.9152),
            CELLS_PER_OBJECT = 16
          );

