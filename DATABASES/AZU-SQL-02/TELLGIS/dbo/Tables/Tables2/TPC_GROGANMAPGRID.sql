CREATE TABLE [dbo].[TPC_GROGANMAPGRID] (
    [OID]               INT              NOT NULL,
    [PageName]          NVARCHAR (255)   NULL,
    [PageNumber]        INT              NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R234_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g215_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S215_idx]
    ON [dbo].[TPC_GROGANMAPGRID] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10381568.7454495, XMIN = -10408344.822091, YMAX = 3790001.90542691, YMIN = 3742822.74340181),
            CELLS_PER_OBJECT = 16
          );

