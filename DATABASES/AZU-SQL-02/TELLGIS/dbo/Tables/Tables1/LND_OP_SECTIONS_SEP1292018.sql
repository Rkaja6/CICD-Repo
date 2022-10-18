CREATE TABLE [dbo].[LND_OP_SECTIONS_SEP1292018] (
    [OBJECTID_1]        INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [SECTN]             NVARCHAR (12)    NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [WI]                NUMERIC (38, 8)  NULL,
    [NRI]               NUMERIC (38, 8)  NULL,
    [Operator]          NVARCHAR (10)    NULL,
    [Notes]             NVARCHAR (150)   NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R224_pk] PRIMARY KEY CLUSTERED ([OBJECTID_1] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g205_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S205_idx]
    ON [dbo].[LND_OP_SECTIONS_SEP1292018] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10380908.7297, XMIN = -10405567.2366, YMAX = 3809575.2676, YMIN = 3727787.2516),
            CELLS_PER_OBJECT = 16
          );

