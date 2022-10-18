CREATE TABLE [dbo].[RXT_METHANELANDFILLS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (150)   NULL,
    [OWNER]             NVARCHAR (200)   NULL,
    [OWNER_TYPE]        NVARCHAR (10)    NULL,
    [TYPE]              NVARCHAR (25)    NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [PRJ_POTE]          NVARCHAR (20)    NULL,
    [STARTDATE]         DATETIME2 (7)    NULL,
    [P_SHUTDOWN]        DATETIME2 (7)    NULL,
    [LF_STATUS]         NVARCHAR (25)    NULL,
    [YR_OPEN]           INT              NULL,
    [YR_CLOSE]          INT              NULL,
    [WASTE_TON]         NUMERIC (38, 8)  NULL,
    [WASTE_YR]          INT              NULL,
    [LFG_SYSTM]         NVARCHAR (10)    NULL,
    [LFGCOLLECT]        NUMERIC (38, 8)  NULL,
    [LFG_FLARED]        NUMERIC (38, 8)  NULL,
    [LFG_P_TYPE]        NVARCHAR (25)    NULL,
    [RNG_DELVRY]        NVARCHAR (20)    NULL,
    [ACT_MW_GEN]        NUMERIC (38, 8)  NULL,
    [RT_MW_CAP]         NUMERIC (38, 8)  NULL,
    [LFP_FLOW]          NUMERIC (38, 8)  NULL,
    [DIR_EM_RED]        NUMERIC (38, 8)  NULL,
    [AVD_EM_RED]        NUMERIC (38, 8)  NULL,
    [PREV_OWNER]        NVARCHAR (200)   NULL,
    [TRANS_DATE]        DATETIME2 (7)    NULL,
    [TRANS_NOTE]        NVARCHAR (254)   NULL,
    [TRANS_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [LOC_DOCS]          NVARCHAR (254)   NULL,
    [SUBOPER_ID]        NVARCHAR (10)    NULL,
    [OPER_ID]           NVARCHAR (10)    NULL,
    [OPER_URL]          NVARCHAR (254)   NULL,
    [OPER_DOCS]         NVARCHAR (254)   NULL,
    [OWNER_ID]          NVARCHAR (10)    NULL,
    [OWNER_URL]         NVARCHAR (254)   NULL,
    [OWNER_DOCS]        NVARCHAR (254)   NULL,
    [CONTACTS_URL]      NVARCHAR (254)   NULL,
    [CATCHALL]          NVARCHAR (500)   NULL,
    [NOTES]             NVARCHAR (300)   NULL,
    [CNTY_NAME]         NVARCHAR (60)    NULL,
    [STATE_NAME]        NVARCHAR (40)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [UPDATE_NO]         NVARCHAR (4)     NULL,
    [QUALITY]           NVARCHAR (20)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R261_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g233_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S233_idx]
    ON [dbo].[RXT_METHANELANDFILLS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100)
          );

