CREATE TABLE [dbo].[DFW_EGR_PROPERTY_PARCELS_2019] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R713_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g676_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S676_idx]
    ON [dbo].[DFW_EGR_PROPERTY_PARCELS_2019] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389118.9535391, XMIN = -10392937.4415028, YMAX = 3517828.38926226, YMIN = 3513558.33457716)
          );

