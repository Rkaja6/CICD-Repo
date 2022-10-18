CREATE TABLE [dbo].[DFW_EGR_ROUTE_WS_HDDVALVE_POLY] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R729_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g692_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S692_idx]
    ON [dbo].[DFW_EGR_ROUTE_WS_HDDVALVE_POLY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389483.9238405, XMIN = -10391234.3957826, YMAX = 3516879.57739615, YMIN = 3515912.31169099)
          );

