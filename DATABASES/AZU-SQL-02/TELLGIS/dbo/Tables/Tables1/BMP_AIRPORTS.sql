CREATE TABLE [dbo].[BMP_AIRPORTS] (
    [OBJECTID]          INT              NOT NULL,
    [ICAO]              NVARCHAR (10)    NULL,
    [IATA]              NVARCHAR (10)    NULL,
    [NAME]              NVARCHAR (254)   NULL,
    [CITY]              NVARCHAR (254)   NULL,
    [STATE]             NVARCHAR (5)     NULL,
    [STATE_FIPS]        NVARCHAR (5)     NULL,
    [COUNTY]            NVARCHAR (254)   NULL,
    [FIPS]              NVARCHAR (5)     NULL,
    [TOT_ENP]           NUMERIC (38, 8)  NULL,
    [ELEV]              NUMERIC (38, 8)  NULL,
    [CNTL_TWR]          NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R299_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g280_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S280_idx]
    ON [dbo].[BMP_AIRPORTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7213694.45735979, XMIN = -19664147.9910308, YMAX = 11500586.8865374, YMIN = 2002645.88619864),
            CELLS_PER_OBJECT = 16
          );

