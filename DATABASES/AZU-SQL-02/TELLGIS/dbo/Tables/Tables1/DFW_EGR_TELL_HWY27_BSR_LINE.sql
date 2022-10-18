CREATE TABLE [dbo].[DFW_EGR_TELL_HWY27_BSR_LINE] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R727_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g690_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S690_idx]
    ON [dbo].[DFW_EGR_TELL_HWY27_BSR_LINE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10391233.8015592, XMIN = -10392725.9238949, YMAX = 3517496.78977041, YMIN = 3516605.26165154)
          );

