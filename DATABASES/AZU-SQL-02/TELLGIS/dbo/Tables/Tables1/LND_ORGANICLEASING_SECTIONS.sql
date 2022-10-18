CREATE TABLE [dbo].[LND_ORGANICLEASING_SECTIONS] (
    [OBJECTID]          INT              NOT NULL,
    [SECTN]             NVARCHAR (12)    NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [S_T_R]             NVARCHAR (25)    NULL,
    [Leasing]           NVARCHAR (250)   NULL,
    [Lease_Checks]      NVARCHAR (250)   NULL,
    [AreasOfInterest]   NVARCHAR (250)   NULL,
    [DATE_]             DATETIME2 (7)    NULL,
    [Status]            NVARCHAR (25)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R652_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g615_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S615_idx]
    ON [dbo].[LND_ORGANICLEASING_SECTIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10392288.8751545, XMIN = -10405590.1336673, YMAX = 3760188.97170822, YMIN = 3727784.73374843),
            CELLS_PER_OBJECT = 16
          );

