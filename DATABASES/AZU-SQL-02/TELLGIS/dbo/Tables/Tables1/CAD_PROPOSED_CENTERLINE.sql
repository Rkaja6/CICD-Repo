﻿CREATE TABLE [dbo].[CAD_PROPOSED_CENTERLINE] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R145_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g126_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S126_idx]
    ON [dbo].[CAD_PROPOSED_CENTERLINE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10269674.1400377, XMIN = -10397552.1221469, YMAX = 3583601.79350091, YMIN = 3516737.89426189),
            CELLS_PER_OBJECT = 16
          );

