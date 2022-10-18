CREATE TABLE [dbo].[BMP_ENV_NATIONAL_PARKS_A] (
    [OBJECTID]          INT              NOT NULL,
    [UNIT_CODE]         NVARCHAR (16)    NULL,
    [GIS_Notes]         NVARCHAR (254)   NULL,
    [UNIT_NAME]         NVARCHAR (254)   NULL,
    [DATE_EDIT]         DATETIME2 (7)    NULL,
    [STATE]             NVARCHAR (2)     NULL,
    [REGION]            NVARCHAR (2)     NULL,
    [GNIS_ID]           NVARCHAR (50)    NULL,
    [UNIT_TYPE]         NVARCHAR (50)    NULL,
    [CREATED_BY]        NVARCHAR (10)    NULL,
    [METADATA]          NVARCHAR (100)   NULL,
    [PARKNAME]          NVARCHAR (254)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R274_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g255_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S255_idx]
    ON [dbo].[BMP_ENV_NATIONAL_PARKS_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 16222790.3208, XMIN = -19005305.9134, YMAX = 10644569.6237, YMIN = -1606722.5535),
            CELLS_PER_OBJECT = 16
          );

