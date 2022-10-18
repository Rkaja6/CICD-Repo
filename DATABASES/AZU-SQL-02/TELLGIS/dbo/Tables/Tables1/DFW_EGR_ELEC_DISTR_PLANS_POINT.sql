CREATE TABLE [dbo].[DFW_EGR_ELEC_DISTR_PLANS_POINT] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [HasLabel]          SMALLINT         NULL,
    [LabelID]           INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R717_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g680_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S680_idx]
    ON [dbo].[DFW_EGR_ELEC_DISTR_PLANS_POINT] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389892.043135, XMIN = -10390152.0927013, YMAX = 3516989.82118879, YMIN = 3516854.38550425)
          );

