﻿CREATE TABLE [dbo].[LNG_STATECLAIMEDWATERBODIES] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (66)    NULL,
    [TITLE_ID]          NVARCHAR (50)    NULL,
    [STATECLAIM]        NVARCHAR (16)    NULL,
    [ENTER_DATE]        DATETIME2 (7)    NULL,
    [IMG_DATE]          SMALLINT         NULL,
    [WEB_STATUS]        NVARCHAR (16)    NULL,
    [EDIT_DATE]         DATETIME2 (7)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R292_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g273_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S273_idx]
    ON [dbo].[LNG_STATECLAIMEDWATERBODIES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9880531.9328, XMIN = -10468807.8955, YMAX = 3897864.129, YMIN = 3357076.295),
            CELLS_PER_OBJECT = 16
          );
