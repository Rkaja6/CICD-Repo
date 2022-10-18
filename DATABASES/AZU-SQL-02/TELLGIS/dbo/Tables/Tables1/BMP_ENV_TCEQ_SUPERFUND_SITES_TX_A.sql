CREATE TABLE [dbo].[BMP_ENV_TCEQ_SUPERFUND_SITES_TX_A] (
    [OBJECTID]             INT              NOT NULL,
    [SITE_ID]              NVARCHAR (255)   NULL,
    [NAME]                 NVARCHAR (255)   NULL,
    [PROGRAM]              NVARCHAR (255)   NULL,
    [SUBFACILITY]          NVARCHAR (255)   NULL,
    [PROPERTY_DESCRIPTION] NVARCHAR (255)   NULL,
    [HORZ_METH]            NVARCHAR (255)   NULL,
    [HORZ_REF]             NVARCHAR (20)    NULL,
    [HORZ_DESC]            NVARCHAR (255)   NULL,
    [NOTES]                NVARCHAR (50)    NULL,
    [HORZ_DATUM]           NVARCHAR (255)   NULL,
    [HORZ_DATE]            NVARCHAR (255)   NULL,
    [Shape]                [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]    VARBINARY (MAX)  NULL,
    CONSTRAINT [R282_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g263_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S263_idx]
    ON [dbo].[BMP_ENV_TCEQ_SUPERFUND_SITES_TX_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10434986.2741, XMIN = -11851796.5384, YMAX = 4355991.5967, YMIN = 3010940.4141),
            CELLS_PER_OBJECT = 16
          );

