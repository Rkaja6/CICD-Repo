CREATE TABLE [dbo].[DFW_EGR_JDEC_PMRYMETER_POINTS] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [HasLabel]          SMALLINT         NULL,
    [LabelID]           INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R719_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g682_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S682_idx]
    ON [dbo].[DFW_EGR_JDEC_PMRYMETER_POINTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389575.669288, XMIN = -10389576.084871, YMAX = 3516063.14321958, YMIN = 3516063.00257706)
          );

