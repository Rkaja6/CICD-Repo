CREATE TABLE [dbo].[DFW_EGR_BUDM_PL_75FT_ROW] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R712_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g675_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S675_idx]
    ON [dbo].[DFW_EGR_BUDM_PL_75FT_ROW] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389528.6691551, XMIN = -10406712.5355246, YMAX = 3515163.75699607, YMIN = 3510099.91118835)
          );

