CREATE TABLE [dbo].[BMP_MAJORLAKES] (
    [OBJECTID]          INT              NOT NULL,
    [AREA]              NUMERIC (38, 8)  NULL,
    [NAME]              NVARCHAR (25)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R86_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g76_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S76_idx]
    ON [dbo].[BMP_MAJORLAKES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

