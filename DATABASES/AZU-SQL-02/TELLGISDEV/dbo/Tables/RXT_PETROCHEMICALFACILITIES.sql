CREATE TABLE [dbo].[RXT_PETROCHEMICALFACILITIES] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (150)   NULL,
    [OWNER]             NVARCHAR (200)   NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [NAICS]             NVARCHAR (10)    NULL,
    [AMMONIA]           NVARCHAR (200)   NULL,
    [BENZENE]           NVARCHAR (200)   NULL,
    [BENZOPERYLENE]     NVARCHAR (200)   NULL,
    [BUTADIENE]         NVARCHAR (200)   NULL,
    [DIISOCYANATES]     NVARCHAR (200)   NULL,
    [ETHYLENE]          NVARCHAR (200)   NULL,
    [FORMALDEHYDE]      NVARCHAR (200)   NULL,
    [HEXANE]            NVARCHAR (200)   NULL,
    [METHANOL]          NVARCHAR (200)   NULL,
    [NAPHTHALENE]       NVARCHAR (200)   NULL,
    [PROPYLENE]         NVARCHAR (200)   NULL,
    [STYRENE]           NVARCHAR (200)   NULL,
    [TOLUENE]           NVARCHAR (200)   NULL,
    [XYLENE]            NVARCHAR (200)   NULL,
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
    CONSTRAINT [R213_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g185_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S185_idx]
    ON [dbo].[RXT_PETROCHEMICALFACILITIES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 16224807.7621, XMIN = -19000868.9156, YMAX = 10465298.9842, YMIN = -1605315.9694)
          );

