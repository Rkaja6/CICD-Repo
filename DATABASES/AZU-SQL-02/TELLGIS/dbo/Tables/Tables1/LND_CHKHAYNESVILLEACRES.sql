CREATE TABLE [dbo].[LND_CHKHAYNESVILLEACRES] (
    [OBJECTID]          INT              NOT NULL,
    [LEASE_NUMB]        NVARCHAR (17)    NULL,
    [TRACT_NUMB]        NVARCHAR (3)     NULL,
    [GrossAc]           NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R20_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g10_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S10_idx]
    ON [dbo].[LND_CHKHAYNESVILLEACRES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

