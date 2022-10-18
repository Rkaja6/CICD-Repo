CREATE TABLE [dbo].[BMP_CITIES] (
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
    CONSTRAINT [R134_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g115_ck] CHECK ([SHAPE].[STSrid]=(4326))
);


GO
CREATE SPATIAL INDEX [S115_idx]
    ON [dbo].[BMP_CITIES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 179.2218873636, XMIN = -176.1515636364, YMAX = 78.2000010314, YMIN = -54.792),
            CELLS_PER_OBJECT = 16
          );

