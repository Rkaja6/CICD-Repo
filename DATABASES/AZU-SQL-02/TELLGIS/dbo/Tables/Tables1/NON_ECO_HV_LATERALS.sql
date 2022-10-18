CREATE TABLE [dbo].[NON_ECO_HV_LATERALS] (
    [OBJECTID]          INT              NOT NULL,
    [LATERAL_LEN]       NUMERIC (38, 8)  NULL,
    [X]                 NUMERIC (38, 8)  NULL,
    [Y]                 NUMERIC (38, 8)  NULL,
    [Bearing]           SMALLINT         NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R34_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g24_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S24_idx]
    ON [dbo].[NON_ECO_HV_LATERALS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

