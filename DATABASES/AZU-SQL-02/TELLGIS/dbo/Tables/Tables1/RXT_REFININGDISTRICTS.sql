﻿CREATE TABLE [dbo].[RXT_REFININGDISTRICTS] (
    [OBJECTID]          INT              NOT NULL,
    [DISTRICTS]         NVARCHAR (38)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R530_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g493_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S493_idx]
    ON [dbo].[RXT_REFININGDISTRICTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20013930.0549, XMIN = -19941039.7307, YMAX = 11539767.1993, YMIN = 2144989.4933),
            CELLS_PER_OBJECT = 16
          );
