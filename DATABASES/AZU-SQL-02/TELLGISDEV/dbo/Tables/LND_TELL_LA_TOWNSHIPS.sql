CREATE TABLE [dbo].[LND_TELL_LA_TOWNSHIPS] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [ID]                INT              NULL,
    [STATE]             NVARCHAR (2)     NULL,
    [MER]               INT              NULL,
    [TWP]               NUMERIC (38, 8)  NULL,
    [TDIR]              NVARCHAR (1)     NULL,
    [RNG]               NUMERIC (38, 8)  NULL,
    [RDIR]              NVARCHAR (1)     NULL,
    [TWPRNG]            NVARCHAR (12)    NULL,
    [AMODDATE]          DATETIME2 (7)    NULL,
    [GMODDATE]          DATETIME2 (7)    NULL,
    [DATUM]             NVARCHAR (5)     NULL,
    [SOURCE]            NVARCHAR (25)    NULL,
    [MTR]               NVARCHAR (14)    NULL,
    [SHAPE_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R149_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g121_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S121_idx]
    ON [dbo].[LND_TELL_LA_TOWNSHIPS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10255942.6361, XMIN = -10468839.0551, YMAX = 3902403.078, YMIN = 3654219.8075),
            CELLS_PER_OBJECT = 16
          );

