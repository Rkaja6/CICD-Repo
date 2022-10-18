CREATE TABLE [dbo].[DFW_EGR_DWPL_FLC48_LINE] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R735_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g698_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S698_idx]
    ON [dbo].[DFW_EGR_DWPL_FLC48_LINE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10269674.1509215, XMIN = -10397552.1327735, YMAX = 3583601.79375369, YMIN = 3516764.88668032)
          );

