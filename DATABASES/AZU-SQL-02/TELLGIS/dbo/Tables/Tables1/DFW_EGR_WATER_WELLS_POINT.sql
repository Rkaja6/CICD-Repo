CREATE TABLE [dbo].[DFW_EGR_WATER_WELLS_POINT] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (320)   NULL,
    [FolderPath]        NVARCHAR (320)   NULL,
    [SymbolID]          INT              NULL,
    [HasLabel]          SMALLINT         NULL,
    [LabelID]           INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R730_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g693_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S693_idx]
    ON [dbo].[DFW_EGR_WATER_WELLS_POINT] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389779.862588, XMIN = -10389940.7062278, YMAX = 3517033.84094384, YMIN = 3516833.6894307)
          );

