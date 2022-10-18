CREATE TABLE [dbo].[DFW_EGR_JDEC_PMRYMETER_POLY] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R720_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g683_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S683_idx]
    ON [dbo].[DFW_EGR_JDEC_PMRYMETER_POLY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389547.3040379, XMIN = -10389725.5584913, YMAX = 3516179.65565558, YMIN = 3515980.12373158)
          );

