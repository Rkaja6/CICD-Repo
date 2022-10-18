CREATE TABLE [dbo].[LND_LEASE_CHECKS] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [SECTN]             NVARCHAR (12)    NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [S_T_R]             NVARCHAR (25)    NULL,
    [Leasing]           NVARCHAR (250)   NULL,
    [Lease_Chec]        NVARCHAR (250)   NULL,
    [AreasOfInt]        NVARCHAR (250)   NULL,
    [DATE_]             DATETIME2 (7)    NULL,
    [Status]            NVARCHAR (25)    NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R767_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g730_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S730_idx]
    ON [dbo].[LND_LEASE_CHECKS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10373354.782198, XMIN = -10397997.1962148, YMAX = 3801989.92450473, YMIN = 3741116.45371688)
          );

