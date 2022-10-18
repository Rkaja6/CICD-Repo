CREATE TABLE [dbo].[BMP_COUNTRIES_SOUTH_AMERICA] (
    [OBJECTID_1]        INT              NOT NULL,
    [ObjectID]          INT              NULL,
    [FIPS_CNTRY]        NVARCHAR (2)     NULL,
    [GMI_CNTRY]         NVARCHAR (3)     NULL,
    [ISO_2DIGIT]        NVARCHAR (2)     NULL,
    [ISO_3DIGIT]        NVARCHAR (3)     NULL,
    [ISO_NUM]           SMALLINT         NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [LONG_NAME]         NVARCHAR (40)    NULL,
    [ISOSHRTNAM]        NVARCHAR (45)    NULL,
    [UNSHRTNAM]         NVARCHAR (55)    NULL,
    [LOCSHRTNAM]        NVARCHAR (43)    NULL,
    [LOCLNGNAM]         NVARCHAR (74)    NULL,
    [STATUS]            NVARCHAR (60)    NULL,
    [POP_CNTRY]         INT              NULL,
    [SQKM]              NUMERIC (38, 8)  NULL,
    [SQMI]              NUMERIC (38, 8)  NULL,
    [COLORMAP]          SMALLINT         NULL,
    [GDP]               NUMERIC (38, 8)  NULL,
    [Shape__Area]       NUMERIC (38, 8)  NULL,
    [Shape__Length]     NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R711_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g674_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S674_idx]
    ON [dbo].[BMP_COUNTRIES_SOUTH_AMERICA] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -3873130.13756193, XMIN = -12183485.3458488, YMAX = 1412959.89694574, YMIN = -7538977.18172831)
          );

