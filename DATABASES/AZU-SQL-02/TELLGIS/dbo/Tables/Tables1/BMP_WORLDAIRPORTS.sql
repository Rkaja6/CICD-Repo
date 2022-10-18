﻿CREATE TABLE [dbo].[BMP_WORLDAIRPORTS] (
    [OBJECTID]          INT              NOT NULL,
    [ISO_CC]            NVARCHAR (4)     NULL,
    [NAME]              NVARCHAR (50)    NULL,
    [ICAO]              NVARCHAR (32)    NULL,
    [IATA]              NVARCHAR (32)    NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R184_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g165_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S165_idx]
    ON [dbo].[BMP_WORLDAIRPORTS] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = 19877122.7286424, XMIN = -19745922.4684184, YMAX = 14501806.7363361, YMIN = -7331508.94293018),
            CELLS_PER_OBJECT = 16
          );

