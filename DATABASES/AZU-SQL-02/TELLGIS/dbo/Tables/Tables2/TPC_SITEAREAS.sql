CREATE TABLE [dbo].[TPC_SITEAREAS] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Type]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R235_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g216_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S216_idx]
    ON [dbo].[TPC_SITEAREAS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10381800.2936506, XMIN = -10401970.110545, YMAX = 3786624.60678623, YMIN = 3743471.22360047),
            CELLS_PER_OBJECT = 16
          );

