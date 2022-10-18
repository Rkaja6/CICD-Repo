CREATE TABLE [dbo].[RXT_HYDROGENPLANTS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (150)   NULL,
    [OWNER]             NVARCHAR (200)   NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [PC_H_MMCFD]        NUMERIC (38, 8)  NULL,
    [CAP_NM3_HR]        NUMERIC (38, 8)  NULL,
    [CAP_KG_D]          NUMERIC (38, 8)  NULL,
    [FUELTYPE]          NVARCHAR (15)    NULL,
    [H2_SOURCE]         NVARCHAR (100)   NULL,
    [PRODUCT]           NVARCHAR (150)   NULL,
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
    CONSTRAINT [R748_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g711_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S711_idx]
    ON [dbo].[RXT_HYDROGENPLANTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100)
          );

