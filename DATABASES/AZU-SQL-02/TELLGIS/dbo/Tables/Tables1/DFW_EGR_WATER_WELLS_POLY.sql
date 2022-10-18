CREATE TABLE [dbo].[DFW_EGR_WATER_WELLS_POLY] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R732_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g695_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S695_idx]
    ON [dbo].[DFW_EGR_WATER_WELLS_POLY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10269587.8901161, XMIN = -10397631.4873178, YMAX = 3583716.99914819, YMIN = 3514269.25373628)
          );

