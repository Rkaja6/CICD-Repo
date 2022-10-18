﻿CREATE TABLE [dbo].[CAD_SURFACE_SITES] (
    [OBJECTID]          INT              NOT NULL,
    [LABEL]             NVARCHAR (254)   NULL,
    [ALT_NAME]          NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R147_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g128_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S128_idx]
    ON [dbo].[CAD_SURFACE_SITES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10269600.2838422, XMIN = -10397043.0768185, YMAX = 3583676.66241257, YMIN = 3516582.26615125),
            CELLS_PER_OBJECT = 16
          );

