﻿CREATE TABLE [dbo].[LND_OPERATORS] (
    [OBJECTID]          INT              NOT NULL,
    [UIOpName]          NVARCHAR (80)    NULL,
    [Ticker]            NVARCHAR (80)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R654_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g617_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S617_idx]
    ON [dbo].[LND_OPERATORS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8643287.33162439, XMIN = -12043362.3108413, YMAX = 5178845.37536096, YMIN = 3220468.24341081),
            CELLS_PER_OBJECT = 16
          );

