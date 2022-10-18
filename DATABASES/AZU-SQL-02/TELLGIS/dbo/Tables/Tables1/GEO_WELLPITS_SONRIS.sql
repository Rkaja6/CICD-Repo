CREATE TABLE [dbo].[GEO_WELLPITS_SONRIS] (
    [OBJECTID]          INT              NOT NULL,
    [PIT_TYPE]          NVARCHAR (50)    NULL,
    [WELL_SERIAL_NUM]   INT              NULL,
    [PIT_ID]            NVARCHAR (10)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R213_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g194_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S194_idx]
    ON [dbo].[GEO_WELLPITS_SONRIS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9342230.1626, XMIN = -10957852.522, YMAX = 6631145.8062, YMIN = 3358251.4727),
            CELLS_PER_OBJECT = 16
          );

