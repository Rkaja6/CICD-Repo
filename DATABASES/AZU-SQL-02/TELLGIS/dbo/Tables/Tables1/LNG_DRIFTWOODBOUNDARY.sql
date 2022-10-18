CREATE TABLE [dbo].[LNG_DRIFTWOODBOUNDARY] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R265_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g246_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S246_idx]
    ON [dbo].[LNG_DRIFTWOODBOUNDARY] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10389126.9525, XMIN = -10391986.6096, YMAX = 3517786.7676, YMIN = 3514210.3008),
            CELLS_PER_OBJECT = 16
          );

