CREATE TABLE [dbo].[BMP_HOSPITALS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (120)   NULL,
    [STCTYFIPS]         NVARCHAR (5)     NULL,
    [ELEV_METER]        SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R83_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g73_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S73_idx]
    ON [dbo].[BMP_HOSPITALS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

