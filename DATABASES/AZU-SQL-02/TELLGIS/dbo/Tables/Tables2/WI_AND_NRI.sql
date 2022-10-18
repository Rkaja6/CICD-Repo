CREATE TABLE [dbo].[WI_AND_NRI] (
    [OBJECTID]          INT              NOT NULL,
    [SECTN]             NVARCHAR (12)    NULL,
    [TOWNSHIP]          NVARCHAR (12)    NULL,
    [RANGE]             NVARCHAR (12)    NULL,
    [twpx]              NVARCHAR (10)    NULL,
    [rngx]              NVARCHAR (10)    NULL,
    [TwpDir]            NVARCHAR (5)     NULL,
    [RngDir]            NVARCHAR (5)     NULL,
    [STR]               NVARCHAR (25)    NULL,
    [OID]               INT              NULL,
    [OBJECTID_1]        INT              NULL,
    [TYPE_AREA]         NUMERIC (38, 8)  NULL,
    [OP_NONOP]          NVARCHAR (254)   NULL,
    [UNECONOMIC]        NVARCHAR (254)   NULL,
    [PARISH]            NVARCHAR (254)   NULL,
    [GR_UN_AC]          NUMERIC (38, 8)  NULL,
    [NET_ACRES]         NUMERIC (38, 8)  NULL,
    [UNIT_WI]           NUMERIC (38, 8)  NULL,
    [UNIT_NRI]          NUMERIC (38, 8)  NULL,
    [NRI_ACRES]         NUMERIC (38, 8)  NULL,
    [NRI88]             NUMERIC (38, 8)  NULL,
    [Bossier]           NUMERIC (38, 8)  NULL,
    [HV]                NUMERIC (38, 8)  NULL,
    [WEIGHTED_A]        NUMERIC (38, 8)  NULL,
    [S_T_R]             NVARCHAR (254)   NULL,
    [TC_AREA]           NUMERIC (38, 8)  NULL,
    [OP_NONOP1]         NVARCHAR (254)   NULL,
    [S_T_R1]            NVARCHAR (254)   NULL,
    [UNECONOM_1]        NVARCHAR (254)   NULL,
    [strx]              NVARCHAR (254)   NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R108_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g98_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S98_idx]
    ON [dbo].[WI_AND_NRI] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100),
            CELLS_PER_OBJECT = 16
          );

