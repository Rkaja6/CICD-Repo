CREATE TABLE [dbo].[GEO_INJECTIONWELLS_SONRIS] (
    [OBJECTID]             INT              NOT NULL,
    [WELL_SERIAL_NUM]      INT              NOT NULL,
    [ORGANIZATION_ID]      NVARCHAR (6)     NULL,
    [WELL_NAME]            NVARCHAR (60)    NULL,
    [WELL_NUM]             NVARCHAR (7)     NULL,
    [TOWNSHIP]             NVARCHAR (3)     NULL,
    [API_NUM]              NVARCHAR (14)    NULL,
    [WELL_STATUS_CODE]     NVARCHAR (5)     NULL,
    [SECTN]                NVARCHAR (3)     NULL,
    [WELL_RANGE]           NVARCHAR (3)     NULL,
    [SURFACE_LAT_DEC_DEG]  NUMERIC (38, 8)  NULL,
    [SURFACE_LONG_DEC_DEG] NUMERIC (38, 8)  NULL,
    [LEGEND]               NVARCHAR (12)    NULL,
    [FIELD_NAME]           NVARCHAR (60)    NULL,
    [HYPERLINK]            NVARCHAR (200)   NULL,
    [LEGEND_DESC]          NVARCHAR (100)   NULL,
    [DOC_ACCESS]           NVARCHAR (500)   NULL,
    [UPPER_PERFS]          NVARCHAR (255)   NULL,
    [LOWER_PERFS]          NVARCHAR (255)   NULL,
    [MEASURED_DEPTH]       INT              NULL,
    [Shape]                [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]    VARBINARY (MAX)  NULL,
    CONSTRAINT [R212_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g193_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S193_idx]
    ON [dbo].[GEO_INJECTIONWELLS_SONRIS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9912822.2195, XMIN = -10808573.9012, YMAX = 3897866.7389, YMIN = 3364867.4461),
            CELLS_PER_OBJECT = 16
          );

