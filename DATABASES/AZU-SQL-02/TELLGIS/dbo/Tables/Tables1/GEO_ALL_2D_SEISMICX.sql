﻿CREATE TABLE [dbo].[GEO_ALL_2D_SEISMICX] (
    [OBJECTID_12]       INT              NOT NULL,
    [OBJECTID_1]        INT              NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Shot_ID]           NVARCHAR (100)   NULL,
    [OBJECTID]          INT              NULL,
    [REFNO]             NVARCHAR (40)    NULL,
    [CURLICBSP]         NUMERIC (38, 8)  NULL,
    [CURLICESP]         NUMERIC (38, 8)  NULL,
    [CURLICMILE]        NUMERIC (38, 8)  NULL,
    [LINENAME]          NVARCHAR (16)    NULL,
    [LINE_UID]          INT              NULL,
    [SURVEY]            NVARCHAR (40)    NULL,
    [GI]                NUMERIC (38, 8)  NULL,
    [SI]                NUMERIC (38, 8)  NULL,
    [CHANNEL]           NUMERIC (38, 8)  NULL,
    [FOLD]              NUMERIC (38, 8)  NULL,
    [ENERGY]            NVARCHAR (20)    NULL,
    [SHOTBY]            NVARCHAR (40)    NULL,
    [YRSHOT]            NVARCHAR (4)     NULL,
    [YRREPRO]           NVARCHAR (4)     NULL,
    [ORIGDO]            NVARCHAR (40)    NULL,
    [REPROCESSU]        NVARCHAR (1)     NULL,
    [LICENSEID]         INT              NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape_Le_1]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R608_pk] PRIMARY KEY CLUSTERED ([OBJECTID_12] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g571_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S571_idx]
    ON [dbo].[GEO_ALL_2D_SEISMICX] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10353372.6155, XMIN = -10410744.5672, YMAX = 3798477.8464, YMIN = 3719364.5967),
            CELLS_PER_OBJECT = 16
          );

