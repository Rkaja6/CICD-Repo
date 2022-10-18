CREATE TABLE [dbo].[DFW_EGR_DWPL_FLC48_POLY] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R736_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g699_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S699_idx]
    ON [dbo].[DFW_EGR_DWPL_FLC48_POLY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10269591.4055856, XMIN = -10397593.5005435, YMAX = 3583689.18124427, YMIN = 3516573.28039913)
          );

