CREATE TABLE [dbo].[BMP_POI_HISTORIC_STRUCTURES_A] (
    [OBJECTID]          INT              NOT NULL,
    [CR_ID]             NVARCHAR (50)    NULL,
    [SURVEY_ID]         NVARCHAR (50)    NULL,
    [GEOM_ID]           NVARCHAR (50)    NULL,
    [RESNAME]           NVARCHAR (250)   NULL,
    [BND_TYPE]          NVARCHAR (50)    NULL,
    [BND_OTHER]         NVARCHAR (250)   NULL,
    [IS_EXTANT]         NVARCHAR (50)    NULL,
    [EXTANT_OTH]        NVARCHAR (250)   NULL,
    [CONTRIBRES]        NVARCHAR (50)    NULL,
    [RESTRICT_]         NVARCHAR (50)    NULL,
    [SOURCE]            NVARCHAR (250)   NULL,
    [SRC_DATE]          DATETIME2 (7)    NULL,
    [SRC_SCALE]         NVARCHAR (50)    NULL,
    [SRC_ACCU]          NVARCHAR (250)   NULL,
    [VERT_ERROR]        NVARCHAR (50)    NULL,
    [SRC_COORD]         NVARCHAR (250)   NULL,
    [MAP_METHOD]        NVARCHAR (50)    NULL,
    [MAP_MTH_OT]        NVARCHAR (250)   NULL,
    [CREATEDATE]        DATETIME2 (7)    NULL,
    [EDIT_DATE]         DATETIME2 (7)    NULL,
    [EDIT_BY]           NVARCHAR (50)    NULL,
    [ORIGINATOR]        NVARCHAR (250)   NULL,
    [CONSTRANT]         NVARCHAR (250)   NULL,
    [CR_NOTES]          NVARCHAR (250)   NULL,
    [ALPHA_CODE]        NVARCHAR (50)    NULL,
    [UNIT_CODEO]        NVARCHAR (50)    NULL,
    [UNIT]              NVARCHAR (250)   NULL,
    [UNIT_OTHER]        NVARCHAR (250)   NULL,
    [UNIT_TYPE]         NVARCHAR (50)    NULL,
    [GROUP_CODE]        NVARCHAR (50)    NULL,
    [REG_CODE]          NVARCHAR (50)    NULL,
    [META_MIDF]         NVARCHAR (50)    NULL,
    [NRIS_Refnum]       NVARCHAR (11)    NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R290_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g271_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S271_idx]
    ON [dbo].[BMP_POI_HISTORIC_STRUCTURES_A] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = 16102139.4254, XMIN = -17774018.0278, YMAX = 9285614.8081, YMIN = 1508277.1851),
            CELLS_PER_OBJECT = 16
          );

