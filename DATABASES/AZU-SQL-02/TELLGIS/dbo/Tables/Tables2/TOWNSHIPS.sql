CREATE TABLE [dbo].[TOWNSHIPS] (
    [OBJECTID]          INT              NOT NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [TOWN_RANGE]        NVARCHAR (12)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R67_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g57_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S57_idx]
    ON [dbo].[TOWNSHIPS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -9924569.0461, XMIN = -10468836.2186, YMAX = 3897901.5943, YMIN = 3379359.7355),
            CELLS_PER_OBJECT = 16
          );

