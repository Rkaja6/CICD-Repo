CREATE TABLE [dbo].[RXT_ELECTRICTRANSMISSION_1] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (150)   NULL,
    [OWNER]             NVARCHAR (200)   NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [KV]                NUMERIC (38, 8)  NULL,
    [CURRENT_]          NVARCHAR (3)     NULL,
    [ISO_RTO_NM]        NVARCHAR (50)    NULL,
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
    [MILES]             NUMERIC (38, 8)  NULL,
    [UPDATE_NO]         NVARCHAR (4)     NULL,
    [KV_CONF]           NVARCHAR (20)    NULL,
    [QUALITY]           NVARCHAR (20)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R254_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g226_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S226_idx]
    ON [dbo].[RXT_ELECTRICTRANSMISSION_1] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100)
          );

