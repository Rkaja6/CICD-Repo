CREATE TABLE [dbo].[LND_TELL_OP_SECSX] (
    [OBJECTID_12]       INT              NOT NULL,
    [OBJECTID]          INT              NULL,
    [SECTN]             NVARCHAR (12)    NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [S_T_R]             NVARCHAR (25)    NULL,
    [Adjusted_T]        NVARCHAR (50)    NULL,
    [TRS]               NVARCHAR (25)    NULL,
    [sec]               NVARCHAR (10)    NULL,
    [twp]               NVARCHAR (10)    NULL,
    [rng]               NVARCHAR (10)    NULL,
    [no_]               INT              NULL,
    [OBJECTID_1]        INT              NULL,
    [STR]               NVARCHAR (254)   NULL,
    [STATUS]            NVARCHAR (254)   NULL,
    [COMMENTS]          NVARCHAR (254)   NULL,
    [OPS]               NVARCHAR (254)   NULL,
    [HVWIX]             NUMERIC (38, 8)  NULL,
    [HVRIX]             NUMERIC (38, 8)  NULL,
    [BSWIX]             NUMERIC (38, 8)  NULL,
    [BSRIX]             NUMERIC (38, 8)  NULL,
    [Shape_Leng]        NUMERIC (38, 8)  NULL,
    [HBP_STATUS]        NVARCHAR (50)    NULL,
    [OP_NONOP]          NVARCHAR (50)    NULL,
    [OVERRIDES]         NVARCHAR (50)    NULL,
    [Active]            NVARCHAR (5)     NULL,
    [Shape_Le_1]        NUMERIC (38, 8)  NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R657_pk] PRIMARY KEY CLUSTERED ([OBJECTID_12] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g620_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S620_idx]
    ON [dbo].[LND_TELL_OP_SECSX] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10380908.7296517, XMIN = -10405557.8659065, YMAX = 3786651.99425948, YMIN = 3731562.49078155),
            CELLS_PER_OBJECT = 16
          );

