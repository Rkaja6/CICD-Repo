CREATE TABLE [dbo].[RXT_GASSTORAGE] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (150)   NULL,
    [OWNER]             NVARCHAR (200)   NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [RESERVOIR]         NVARCHAR (40)    NULL,
    [AGA_REGION]        NVARCHAR (20)    NULL,
    [FLDCAPBCF]         NUMERIC (38, 8)  NULL,
    [FLDCAPMMCF]        NUMERIC (38, 8)  NULL,
    [CAPWKGBCF]         NUMERIC (38, 8)  NULL,
    [CAPWKGMMCF]        NUMERIC (38, 8)  NULL,
    [MAXDELBCF]         NUMERIC (38, 8)  NULL,
    [MAXDELMMCF]        NUMERIC (38, 8)  NULL,
    [BASEGASBCF]        NUMERIC (38, 8)  NULL,
    [BASEGASMMCF]       NUMERIC (38, 8)  NULL,
    [STARTDATE]         DATETIME2 (7)    NULL,
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
    CONSTRAINT [R229_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g201_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S201_idx]
    ON [dbo].[RXT_GASSTORAGE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7592899.7963, XMIN = -16839876.2223, YMAX = 8686972.6537, YMIN = 3086261.8271)
          );

