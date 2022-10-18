CREATE TABLE [dbo].[DFW_EGR_FERC_BOUNDARY] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R738_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g701_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S701_idx]
    ON [dbo].[DFW_EGR_FERC_BOUNDARY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10388997.5808964, XMIN = -10391455.1472309, YMAX = 3517047.11589665, YMIN = 3514156.81949171)
          );

