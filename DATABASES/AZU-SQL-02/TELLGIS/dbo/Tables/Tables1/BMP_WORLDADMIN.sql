CREATE TABLE [dbo].[BMP_WORLDADMIN] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (44)    NULL,
    [COUNTRY]           NVARCHAR (50)    NULL,
    [ISO_CODE]          NVARCHAR (6)     NULL,
    [ISO_CC]            NVARCHAR (2)     NULL,
    [ISO_SUB]           NVARCHAR (5)     NULL,
    [ADMINTYPE]         NVARCHAR (50)    NULL,
    [DISPUTED]          INT              NULL,
    [NOTES]             NVARCHAR (254)   NULL,
    [AUTONOMOUS]        INT              NULL,
    [COUNTRYAFF]        NVARCHAR (100)   NULL,
    [CONTINENT]         NVARCHAR (13)    NULL,
    [LAND_TYPE]         NVARCHAR (20)    NULL,
    [LAND_RANK]         SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R183_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g164_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S164_idx]
    ON [dbo].[BMP_WORLDADMIN] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037507.0672, XMIN = -20037507.0672, YMAX = 18460513.247, YMIN = -30240971.9584),
            CELLS_PER_OBJECT = 16
          );

