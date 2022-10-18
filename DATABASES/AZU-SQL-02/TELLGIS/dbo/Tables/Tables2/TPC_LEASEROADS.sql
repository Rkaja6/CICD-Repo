CREATE TABLE [dbo].[TPC_LEASEROADS] (
    [OID]               INT              NOT NULL,
    [Name]              NVARCHAR (60)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R232_pk] PRIMARY KEY CLUSTERED ([OID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g213_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S213_idx]
    ON [dbo].[TPC_LEASEROADS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10381712.7418343, XMIN = -10402359.9961334, YMAX = 3786628.32786395, YMIN = 3743147.65588821),
            CELLS_PER_OBJECT = 16
          );

