CREATE TABLE [dbo].[LND_OP_SECTIONS] (
    [OBJECTID]          INT              NOT NULL,
    [S_T_R]             NVARCHAR (25)    NULL,
    [OBJECTID_12]       INT              NULL,
    [Section_]          NUMERIC (38, 8)  NULL,
    [Township_1]        NVARCHAR (255)   NULL,
    [Range_1]           NVARCHAR (255)   NULL,
    [HVILLE_WI]         NUMERIC (38, 8)  NULL,
    [HVILLE_RI]         NUMERIC (38, 8)  NULL,
    [BOS_WI]            NUMERIC (38, 8)  NULL,
    [BOS_RI]            NUMERIC (38, 8)  NULL,
    [S_T_R_12]          NVARCHAR (25)    NULL,
    [Operator]          NVARCHAR (50)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R452_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g415_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S415_idx]
    ON [dbo].[LND_OP_SECTIONS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10380909.4610495, XMIN = -10405558.6027697, YMAX = 3809576.03183141, YMIN = 3743001.92609021),
            CELLS_PER_OBJECT = 16
          );

