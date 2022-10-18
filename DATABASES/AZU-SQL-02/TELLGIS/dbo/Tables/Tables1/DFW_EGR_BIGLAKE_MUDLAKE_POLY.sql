CREATE TABLE [dbo].[DFW_EGR_BIGLAKE_MUDLAKE_POLY] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [PopupInfo]         NVARCHAR (MAX)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R723_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g686_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S686_idx]
    ON [dbo].[DFW_EGR_BIGLAKE_MUDLAKE_POLY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10380077.0461558, XMIN = -10402942.2159499, YMAX = 3522386.5223222, YMIN = 3501784.26835413)
          );

