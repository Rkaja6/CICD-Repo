CREATE TABLE [dbo].[RXT_NATURALGASPIPELINES] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (150)   NULL,
    [OWNER]             NVARCHAR (200)   NULL,
    [SYS_NAME]          NVARCHAR (100)   NULL,
    [SUBSYS_NM]         NVARCHAR (100)   NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [DIAMETER]          SMALLINT         NULL,
    [TRANSCAP]          NUMERIC (38, 8)  NULL,
    [COMMODITY]         NVARCHAR (50)    NULL,
    [CMDTY_DESC]        NVARCHAR (80)    NULL,
    [INTERSTATE]        NVARCHAR (5)     NULL,
    [RATE_ZONE]         NVARCHAR (30)    NULL,
    [FLOW_DIR]          NVARCHAR (3)     NULL,
    [INSTALL_YR]        INT              NULL,
    [PREV_OWNER]        NVARCHAR (200)   NULL,
    [TRANS_DATE]        DATETIME2 (7)    NULL,
    [TRANS_NOTE]        NVARCHAR (254)   NULL,
    [TRANS_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [LOC_DOCS]          NVARCHAR (254)   NULL,
    [SYSTEM_ID]         NVARCHAR (20)    NULL,
    [SEG_ID]            NVARCHAR (20)    NULL,
    [SUBSEG_ID]         NVARCHAR (20)    NULL,
    [SUBOPER_ID]        NVARCHAR (10)    NULL,
    [OPER_ID]           NVARCHAR (10)    NULL,
    [OPER_URL]          NVARCHAR (254)   NULL,
    [OPER_DOCS]         NVARCHAR (254)   NULL,
    [OWNER_ID]          NVARCHAR (10)    NULL,
    [OWNER_URL]         NVARCHAR (254)   NULL,
    [OWNER_DOCS]        NVARCHAR (254)   NULL,
    [CONTACTS_URL]      NVARCHAR (254)   NULL,
    [NOTES]             NVARCHAR (300)   NULL,
    [CATCHALL]          NVARCHAR (500)   NULL,
    [CNTY_NAME]         NVARCHAR (60)    NULL,
    [STATE_NAME]        NVARCHAR (40)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [MILES]             NUMERIC (38, 8)  NULL,
    [UPDATE_NO]         NVARCHAR (4)     NULL,
    [QUALITY]           NVARCHAR (20)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R240_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g212_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE NONCLUSTERED INDEX [I631SYSTEM_ID]
    ON [dbo].[RXT_NATURALGASPIPELINES]([SYSTEM_ID] ASC) WITH (FILLFACTOR = 75);


GO
CREATE NONCLUSTERED INDEX [I631LOC_ID]
    ON [dbo].[RXT_NATURALGASPIPELINES]([LOC_ID] ASC) WITH (FILLFACTOR = 75);


GO
CREATE SPATIAL INDEX [S212_idx]
    ON [dbo].[RXT_NATURALGASPIPELINES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -5957776.621, XMIN = -16899927.9604, YMAX = 11230215.2008, YMIN = 1670312.8228)
          );

