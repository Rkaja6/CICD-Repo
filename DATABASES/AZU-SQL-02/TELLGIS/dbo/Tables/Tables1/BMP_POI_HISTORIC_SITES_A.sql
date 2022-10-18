CREATE TABLE [dbo].[BMP_POI_HISTORIC_SITES_A] (
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
    CONSTRAINT [R289_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g270_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S270_idx]
    ON [dbo].[BMP_POI_HISTORIC_SITES_A] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = 19782677.5352, XMIN = -19013635.0941, YMAX = 11207650.1493, YMIN = -1611939.3481),
            CELLS_PER_OBJECT = 16
          );

