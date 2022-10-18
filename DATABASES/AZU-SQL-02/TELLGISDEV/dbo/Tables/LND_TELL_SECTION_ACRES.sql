CREATE TABLE [dbo].[LND_TELL_SECTION_ACRES] (
    [OBJECTID]          INT              NOT NULL,
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
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R237_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g209_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S209_idx]
    ON [dbo].[LND_TELL_SECTION_ACRES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -10373395.5458, XMIN = -10468796.5874, YMAX = 3821468.759, YMIN = 3723955.4822),
            CELLS_PER_OBJECT = 16
          );

