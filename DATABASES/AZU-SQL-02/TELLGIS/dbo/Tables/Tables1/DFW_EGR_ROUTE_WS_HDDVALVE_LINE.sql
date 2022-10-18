CREATE TABLE [dbo].[DFW_EGR_ROUTE_WS_HDDVALVE_LINE] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R728_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g691_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S691_idx]
    ON [dbo].[DFW_EGR_ROUTE_WS_HDDVALVE_LINE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389416.3667132, XMIN = -10391742.7552729, YMAX = 3517119.10250187, YMIN = 3515733.81865456)
          );

