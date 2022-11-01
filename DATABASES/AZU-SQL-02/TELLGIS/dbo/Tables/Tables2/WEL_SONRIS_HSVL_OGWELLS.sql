﻿CREATE TABLE [dbo].[WEL_SONRIS_HSVL_OGWELLS] (
    [OBJECTID]          INT              NOT NULL,
    [WELL_SERIAL_NUM]   INT              NOT NULL,
    [ORGANIZATION_ID]   NVARCHAR (6)     NULL,
    [WELL_NAME]         NVARCHAR (60)    NULL,
    [WELL_NUM]          NVARCHAR (7)     NULL,
    [TOWNSHIP]          NVARCHAR (3)     NULL,
    [API_NUM]           NVARCHAR (14)    NULL,
    [WELL_STATUS_CODE]  NVARCHAR (5)     NULL,
    [SECTN]             NVARCHAR (3)     NULL,
    [WELL_RANGE]        NVARCHAR (3)     NULL,
    [LEGEND]            NVARCHAR (12)    NULL,
    [HYPERLINK]         NVARCHAR (200)   NULL,
    [LEGEND_DESC]       NVARCHAR (100)   NULL,
    [DOC_ACCESS]        NVARCHAR (500)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R623_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g586_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S586_idx]
    ON [dbo].[WEL_SONRIS_HSVL_OGWELLS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10321313.0730501, XMIN = -10468653.0430226, YMAX = 3858082.9272467, YMIN = 3515860.69074572),
            CELLS_PER_OBJECT = 16
          );
