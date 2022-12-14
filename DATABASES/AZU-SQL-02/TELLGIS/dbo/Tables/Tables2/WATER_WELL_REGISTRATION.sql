CREATE TABLE [dbo].[WATER_WELL_REGISTRATION] (
    [OBJECTID]          INT              NOT NULL,
    [WATER_WELL_NUM]    NVARCHAR (10)    NULL,
    [LATITUDE]          NVARCHAR (6)     NULL,
    [LONGITUDE]         NVARCHAR (6)     NULL,
    [OWNERS_NAME]       NVARCHAR (65)    NULL,
    [WELL_DEPTH]        NVARCHAR (4)     NULL,
    [GEOLOGIC_UNIT]     NVARCHAR (8)     NULL,
    [AVAILABLE_INFO]    NVARCHAR (200)   NULL,
    [DRILLERS_NAME]     NVARCHAR (45)    NULL,
    [SECTION]           NVARCHAR (3)     NULL,
    [TOWNSHIP]          NVARCHAR (3)     NULL,
    [RANGE]             NVARCHAR (3)     NULL,
    [WATER_LEVEL]       NVARCHAR (14)    NULL,
    [DATE_MEASURED]     NVARCHAR (12)    NULL,
    [OWNERS_NUMBER]     NVARCHAR (30)    NULL,
    [X_LONGDD]          NUMERIC (38, 8)  NULL,
    [Y_LATDD]           NUMERIC (38, 8)  NULL,
    [CASING_DIAMETER3]  NVARCHAR (8)     NULL,
    [PARISH_NAME]       NVARCHAR (50)    NULL,
    [AQUIFER_NAME]      NVARCHAR (100)   NULL,
    [USE_DESCRIPTION]   NVARCHAR (100)   NULL,
    [WELL_STATUS]       NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R102_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g92_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S92_idx]
    ON [dbo].[WATER_WELL_REGISTRATION] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

