﻿CREATE TABLE [dbo].[RXT_WATER_LINEAR] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [TYPE]              NVARCHAR (50)    NULL,
    [COUNTRY]           NVARCHAR (30)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R257_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g238_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S238_idx]
    ON [dbo].[RXT_WATER_LINEAR] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20001345.5015121, XMIN = -19823754.9594797, YMAX = 17907483.1772798, YMIN = -1615764.62429938),
            CELLS_PER_OBJECT = 16
          );

