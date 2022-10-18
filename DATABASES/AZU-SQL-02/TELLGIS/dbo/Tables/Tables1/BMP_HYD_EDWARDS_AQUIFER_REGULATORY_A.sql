CREATE TABLE [dbo].[BMP_HYD_EDWARDS_AQUIFER_REGULATORY_A] (
    [OBJECTID]          INT              NOT NULL,
    [AREA]              NUMERIC (38, 8)  NULL,
    [PERIMETER]         NUMERIC (38, 8)  NULL,
    [POLY_]             INT              NULL,
    [CODE]              INT              NULL,
    [TYPE]              NVARCHAR (70)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R287_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g268_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S268_idx]
    ON [dbo].[BMP_HYD_EDWARDS_AQUIFER_REGULATORY_A] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10863952.9279, XMIN = -11183182.1327, YMAX = 3619450.8236, YMIN = 3410016.4649),
            CELLS_PER_OBJECT = 16
          );

