CREATE TABLE [dbo].[BMP_NATIONALATLASWATERFEATLINE] (
    [OBJECTID]          INT              NOT NULL,
    [Name]              NVARCHAR (150)   NULL,
    [Feature]           NVARCHAR (50)    NULL,
    [State]             NVARCHAR (30)    NULL,
    [Region]            SMALLINT         NULL,
    [Miles]             NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R90_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g80_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S80_idx]
    ON [dbo].[BMP_NATIONALATLASWATERFEATLINE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

