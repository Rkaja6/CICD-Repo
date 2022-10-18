CREATE TABLE [dbo].[DFW_EGR_TEMP_FACILITIES] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R714_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g677_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S677_idx]
    ON [dbo].[DFW_EGR_TEMP_FACILITIES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389244.1345329, XMIN = -10391906.6804589, YMAX = 3517093.33816421, YMIN = 3515092.86642311)
          );

