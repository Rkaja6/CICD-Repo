CREATE TABLE [dbo].[BMP_WORLDRIVERS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (25)    NULL,
    [SYSTEM]            NVARCHAR (16)    NULL,
    [MILES]             NUMERIC (38, 8)  NULL,
    [KILOMETERS]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R199_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g180_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S180_idx]
    ON [dbo].[BMP_WORLDRIVERS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 17896121.6043, XMIN = -18355185.4542, YMAX = 11537827.6522, YMIN = -4434848.7329),
            CELLS_PER_OBJECT = 16
          );

