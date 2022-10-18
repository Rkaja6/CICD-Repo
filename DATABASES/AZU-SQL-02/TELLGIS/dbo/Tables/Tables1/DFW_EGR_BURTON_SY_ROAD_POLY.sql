CREATE TABLE [dbo].[DFW_EGR_BURTON_SY_ROAD_POLY] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R725_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g688_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S688_idx]
    ON [dbo].[DFW_EGR_BURTON_SY_ROAD_POLY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389940.694094, XMIN = -10391246.5405164, YMAX = 3516857.63313351, YMIN = 3516825.56554905)
          );

