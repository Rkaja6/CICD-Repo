CREATE TABLE [dbo].[RXT_OFFSHOREPLATFORMS] (
    [OBJECTID]          INT              NOT NULL,
    [AREA]              NUMERIC (38, 8)  NULL,
    [PERIMETER]         NUMERIC (38, 8)  NULL,
    [PLATFORM_]         INT              NULL,
    [PLATFORM_I]        INT              NULL,
    [COMPLEX_ID]        INT              NULL,
    [STR_NUMBER]        SMALLINT         NULL,
    [STR_NAME]          NVARCHAR (15)    NULL,
    [INSTALL_DA]        DATETIME2 (7)    NULL,
    [REMOVAL_DA]        DATETIME2 (7)    NULL,
    [INSTALL]           NVARCHAR (12)    NULL,
    [REMOVAL]           NVARCHAR (12)    NULL,
    [POLYGONID]         INT              NULL,
    [SCALE]             NUMERIC (38, 8)  NULL,
    [ANGLE]             NUMERIC (38, 8)  NULL,
    [STATE_NAME]        NVARCHAR (30)    NULL,
    [CNTRY_NAME]        NVARCHAR (30)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R363_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g326_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S326_idx]
    ON [dbo].[RXT_OFFSHOREPLATFORMS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9769134.1482, XMIN = -10810628.8847, YMAX = 3528663.5736, YMIN = 3003547.5494),
            CELLS_PER_OBJECT = 16
          );

