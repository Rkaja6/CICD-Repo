CREATE TABLE [dbo].[BMP_WORLDCOUNTRY] (
    [OBJECTID]          INT              NOT NULL,
    [FIPS_CNTRY]        NVARCHAR (2)     NULL,
    [ISO_2DIGIT]        NVARCHAR (2)     NULL,
    [ISO_3DIGIT]        NVARCHAR (3)     NULL,
    [NAME]              NVARCHAR (50)    NULL,
    [LONG_NAME]         NVARCHAR (60)    NULL,
    [LOCSHRTNAM]        NVARCHAR (50)    NULL,
    [LOCLNGNAM]         NVARCHAR (75)    NULL,
    [CAPITAL]           NVARCHAR (25)    NULL,
    [COUNTRYAFF]        NVARCHAR (50)    NULL,
    [CONTINENT]         NVARCHAR (15)    NULL,
    [LAND_TYPE]         NVARCHAR (20)    NULL,
    [LAND_RANK]         SMALLINT         NULL,
    [COLORMAP]          SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R189_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g170_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S170_idx]
    ON [dbo].[BMP_WORLDCOUNTRY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037507.0672, XMIN = -20037507.0672, YMAX = 18460513.247, YMIN = -30240971.9584),
            CELLS_PER_OBJECT = 16
          );

