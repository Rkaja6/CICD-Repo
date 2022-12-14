CREATE TABLE [dbo].[DFW_CLB_TRACTS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [PROVINCE]          NVARCHAR (100)   NULL,
    [HECTARES]          NUMERIC (38, 8)  NULL,
    [GIS_HECTARES]      NUMERIC (38, 8)  NULL,
    [SHAPE]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R708_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g671_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S671_idx]
    ON [dbo].[DFW_CLB_TRACTS] ([SHAPE])
    WITH  (
            BOUNDING_BOX = (XMAX = -6095992.69075754, XMIN = -6274123.8737483, YMAX = -3169243.57849608, YMIN = -3213011.24909442)
          );

