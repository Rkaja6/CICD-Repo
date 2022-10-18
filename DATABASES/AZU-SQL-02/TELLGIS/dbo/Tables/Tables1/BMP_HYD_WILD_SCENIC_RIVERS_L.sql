CREATE TABLE [dbo].[BMP_HYD_WILD_SCENIC_RIVERS_L] (
    [OBJECTID]                       INT              NOT NULL,
    [RIVER_ID]                       NVARCHAR (10)    NULL,
    [WSR_RIVER_NAME]                 NVARCHAR (175)   NULL,
    [WSR_RIVER_SHORTNAME]            NVARCHAR (150)   NULL,
    [STATE]                          NVARCHAR (50)    NULL,
    [MANAGEMENT_PLAN]                NVARCHAR (150)   NULL,
    [CLASSIFICATION_SOURCE_DOCUMENT] NVARCHAR (150)   NULL,
    [ORV_SOURCE_DOCUMENT]            NVARCHAR (150)   NULL,
    [MANAGING_ENTITIES]              NVARCHAR (150)   NULL,
    [PUBLIC_LAW_NAME]                NVARCHAR (150)   NULL,
    [PUBLIC_LAW_NUMBER]              NVARCHAR (50)    NULL,
    [ENACTED_DATE]                   DATETIME2 (7)    NULL,
    [AGENCY]                         NVARCHAR (50)    NULL,
    [WEBLINK]                        NVARCHAR (75)    NULL,
    [LOCALWEBSITE]                   NVARCHAR (100)   NULL,
    [RIVERCATEGORY]                  NVARCHAR (80)    NULL,
    [PHOTOLINK]                      NVARCHAR (150)   NULL,
    [PHOTOCREDIT]                    NVARCHAR (255)   NULL,
    [SHAPE]                          [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]              VARBINARY (MAX)  NULL,
    CONSTRAINT [R268_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g249_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S249_idx]
    ON [dbo].[BMP_HYD_WILD_SCENIC_RIVERS_L] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = -7319095.1437, XMIN = -18178469.8605, YMAX = 10767912.7125, YMIN = 2064872.6916),
            CELLS_PER_OBJECT = 16
          );

