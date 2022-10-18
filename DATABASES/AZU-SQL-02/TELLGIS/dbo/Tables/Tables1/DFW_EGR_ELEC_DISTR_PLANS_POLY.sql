CREATE TABLE [dbo].[DFW_EGR_ELEC_DISTR_PLANS_POLY] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R718_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g681_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S681_idx]
    ON [dbo].[DFW_EGR_ELEC_DISTR_PLANS_POLY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389306.1131066, XMIN = -10390152.7137527, YMAX = 3517183.55024774, YMIN = 3516081.88132781)
          );

