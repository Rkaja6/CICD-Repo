CREATE TABLE [dbo].[DFW_EGR_DWPL_JUNK_POLY] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R737_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g700_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S700_idx]
    ON [dbo].[DFW_EGR_DWPL_JUNK_POLY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10269637.6910053, XMIN = -10397631.4873178, YMAX = 3583475.02833556, YMIN = 3514269.25373628)
          );

