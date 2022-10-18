CREATE TABLE [dbo].[BMP_WORLDCITIES] (
    [OBJECTID]          INT              NOT NULL,
    [CITY_NAME]         NVARCHAR (30)    NULL,
    [GMI_ADMIN]         NVARCHAR (7)     NULL,
    [ADMIN_NAME]        NVARCHAR (42)    NULL,
    [FIPS_CNTRY]        NVARCHAR (2)     NULL,
    [CNTRY_NAME]        NVARCHAR (30)    NULL,
    [STATUS]            NVARCHAR (50)    NULL,
    [POP]               NUMERIC (38, 8)  NULL,
    [POP_RANK]          NUMERIC (38, 8)  NULL,
    [POP_CLASS]         NVARCHAR (25)    NULL,
    [PORT_ID]           NUMERIC (38, 8)  NULL,
    [LABEL_FLAG]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R186_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g167_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S167_idx]
    ON [dbo].[BMP_WORLDCITIES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 19950889.6393178, XMIN = -19609102.758582, YMAX = 14476657.8138332, YMIN = -7321601.89943203),
            CELLS_PER_OBJECT = 16
          );

