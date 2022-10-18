CREATE TABLE [dbo].[LND_TELL_LA_SECTIONS] (
    [OBJECTID]           INT              NOT NULL,
    [SECTN]              NVARCHAR (12)    NULL,
    [TOWNSHIP]           NVARCHAR (12)    NULL,
    [RANGE]              NVARCHAR (12)    NULL,
    [S_T_R]              NVARCHAR (25)    NULL,
    [Adjusted_To_Survey] NVARCHAR (50)    NULL,
    [Shape]              [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA]  VARBINARY (MAX)  NULL,
    CONSTRAINT [R467_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g430_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S430_idx]
    ON [dbo].[LND_TELL_LA_SECTIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10255530.7259, XMIN = -10468839.0551, YMAX = 3904338.6947, YMIN = 3654219.8075),
            CELLS_PER_OBJECT = 16
          );

