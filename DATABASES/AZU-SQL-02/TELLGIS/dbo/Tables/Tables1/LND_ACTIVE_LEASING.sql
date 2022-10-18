CREATE TABLE [dbo].[LND_ACTIVE_LEASING] (
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
    CONSTRAINT [R780_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g743_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S743_idx]
    ON [dbo].[LND_ACTIVE_LEASING] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10379204.9785965, XMIN = -10405574.8600633, YMAX = 3769343.54993793, YMIN = 3721759.00692981)
          );

