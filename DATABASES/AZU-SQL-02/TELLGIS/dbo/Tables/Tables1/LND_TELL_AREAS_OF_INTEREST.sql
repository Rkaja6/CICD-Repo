CREATE TABLE [dbo].[LND_TELL_AREAS_OF_INTEREST] (
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
    CONSTRAINT [R766_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g729_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S729_idx]
    ON [dbo].[LND_TELL_AREAS_OF_INTEREST] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10397948.5754919, XMIN = -10405570.5921572, YMAX = 3760186.52060555, YMIN = 3742966.11684045)
          );

