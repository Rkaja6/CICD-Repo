CREATE TABLE [dbo].[RXT_LNGTERMINALS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (150)   NULL,
    [OWNER]             NVARCHAR (200)   NULL,
    [TYPE]              NVARCHAR (40)    NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [CAP_R_SEND]        NUMERIC (38, 8)  NULL,
    [CAP_R_UNL]         NUMERIC (38, 8)  NULL,
    [CAP_L_SEND]        NUMERIC (38, 8)  NULL,
    [CAP_L_UNL]         NUMERIC (38, 8)  NULL,
    [CAP_STO]           NUMERIC (38, 8)  NULL,
    [TANKS]             INT              NULL,
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
    CONSTRAINT [R500_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g463_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S463_idx]
    ON [dbo].[RXT_LNGTERMINALS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -6823976.8498, XMIN = -17330511.626, YMAX = 8552567.2821, YMIN = 1823841.1253)
          );

