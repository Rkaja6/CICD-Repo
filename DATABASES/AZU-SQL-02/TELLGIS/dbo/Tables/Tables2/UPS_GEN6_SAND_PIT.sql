CREATE TABLE [dbo].[UPS_GEN6_SAND_PIT] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Type]              NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R583_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g546_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S546_idx]
    ON [dbo].[UPS_GEN6_SAND_PIT] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10407073.6138951, XMIN = -10408552.5965006, YMAX = 3781178.36672191, YMIN = 3779428.73430825),
            CELLS_PER_OBJECT = 16
          );

