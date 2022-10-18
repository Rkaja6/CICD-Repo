CREATE TABLE [dbo].[DFW_EGR_WATER_WELLS_LINE] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R731_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g694_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S694_idx]
    ON [dbo].[DFW_EGR_WATER_WELLS_LINE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389752.5667149, XMIN = -10389940.5484881, YMAX = 3517152.31027055, YMIN = 3516833.78799559)
          );

