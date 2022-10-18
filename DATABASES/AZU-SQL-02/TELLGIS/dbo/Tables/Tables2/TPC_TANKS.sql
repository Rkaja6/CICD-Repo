CREATE TABLE [dbo].[TPC_TANKS] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Type]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R231_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g212_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S212_idx]
    ON [dbo].[TPC_TANKS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10381891.6168246, XMIN = -10401855.5399538, YMAX = 3786601.22909212, YMIN = 3744949.33050355),
            CELLS_PER_OBJECT = 16
          );

