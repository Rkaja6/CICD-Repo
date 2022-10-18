CREATE TABLE [dbo].[BMP_FEDERALLANDBOUNDARIES] (
    [OBJECTID]          INT              NOT NULL,
    [FEATURE1]          NVARCHAR (50)    NULL,
    [NAME1]             NVARCHAR (250)   NULL,
    [ADMIN1]            NVARCHAR (10)    NULL,
    [FEATURE2]          NVARCHAR (50)    NULL,
    [NAME2]             NVARCHAR (250)   NULL,
    [ADMIN2]            NVARCHAR (10)    NULL,
    [FEATURE3]          NVARCHAR (50)    NULL,
    [NAME3]             NVARCHAR (250)   NULL,
    [ADMIN3]            NVARCHAR (10)    NULL,
    [STATE]             NVARCHAR (10)    NULL,
    [STATE_FIPS]        NVARCHAR (10)    NULL,
    [SQMI]              NUMERIC (38, 8)  NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R79_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g69_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S69_idx]
    ON [dbo].[BMP_FEDERALLANDBOUNDARIES] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

