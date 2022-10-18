CREATE TABLE [dbo].[LND_LA_HELDPRODUCINGAREASX] (
    [OBJECTID]           INT              NOT NULL,
    [SECTN]              NVARCHAR (12)    NULL,
    [TOWNSHIP]           NVARCHAR (12)    NULL,
    [RANGE]              NVARCHAR (12)    NULL,
    [S_T_R]              NVARCHAR (25)    NULL,
    [Adjusted_To_Survey] NVARCHAR (50)    NULL,
    [TRS]                NVARCHAR (25)    NULL,
    [sec]                NVARCHAR (10)    NULL,
    [twp]                NVARCHAR (10)    NULL,
    [rng]                NVARCHAR (10)    NULL,
    [no]                 SMALLINT         NULL,
    [MAP]                NVARCHAR (5)     NULL,
    [Shape]              [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]  VARBINARY (MAX)  NULL,
    CONSTRAINT [R661_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g624_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S624_idx]
    ON [dbo].[LND_LA_HELDPRODUCINGAREASX] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10356476.1361129, XMIN = -10468813.2996658, YMAX = 3897663.96228877, YMIN = 3710608.93526388),
            CELLS_PER_OBJECT = 16
          );

