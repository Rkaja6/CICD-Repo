CREATE TABLE [dbo].[DFW_EGR_BIGLAKE_MUDLAKE_LINES] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Base]              NUMERIC (38, 8)  NULL,
    [PopupInfo]         NVARCHAR (MAX)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R722_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g685_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S685_idx]
    ON [dbo].[DFW_EGR_BIGLAKE_MUDLAKE_LINES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10384013.2309926, XMIN = -10407172.4671403, YMAX = 3523344.77266267, YMIN = 3509342.22264175)
          );

