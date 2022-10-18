CREATE TABLE [dbo].[DFW_EGR_BIGLAKE_MUDLAKE_MULTIP] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R724_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g687_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S687_idx]
    ON [dbo].[DFW_EGR_BIGLAKE_MUDLAKE_MULTIP] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10384157.4082122, XMIN = -10407006.9143521, YMAX = 3519635.08836365, YMIN = 3509343.33116601)
          );

