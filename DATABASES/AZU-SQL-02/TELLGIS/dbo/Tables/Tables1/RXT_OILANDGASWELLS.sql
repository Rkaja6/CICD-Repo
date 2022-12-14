CREATE TABLE [dbo].[RXT_OILANDGASWELLS] (
    [OBJECTID]          INT              NOT NULL,
    [API_UNQSEQ]        NVARCHAR (25)    NULL,
    [API_NATFMT]        NVARCHAR (22)    NULL,
    [API_HRTSTD]        NVARCHAR (22)    NULL,
    [WELLNAME]          NVARCHAR (150)   NULL,
    [SUB_OPER]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (150)   NULL,
    [OWNER]             NVARCHAR (200)   NULL,
    [COMMODITY]         NVARCHAR (15)    NULL,
    [COMM_STATE]        NVARCHAR (35)    NULL,
    [WELLCLASS]         NVARCHAR (40)    NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [STAT_STATE]        NVARCHAR (100)   NULL,
    [WELLDIRECT]        NVARCHAR (15)    NULL,
    [BH_Y_NAD83]        NUMERIC (38, 8)  NULL,
    [BH_X_NAD83]        NUMERIC (38, 8)  NULL,
    [LEASENUM]          NVARCHAR (25)    NULL,
    [LEASENAME]         NVARCHAR (250)   NULL,
    [PERMITNUM]         NVARCHAR (25)    NULL,
    [PERMITDATE]        DATETIME2 (7)    NULL,
    [SPUDDATE]          DATETIME2 (7)    NULL,
    [COMPLDATE]         DATETIME2 (7)    NULL,
    [RECOMPLDATE]       DATETIME2 (7)    NULL,
    [PROD_DATE]         DATETIME2 (7)    NULL,
    [PLUGDATE]          DATETIME2 (7)    NULL,
    [VINTAGEYEARS]      INT              NULL,
    [DUCMONTHS]         SMALLINT         NULL,
    [DEPTHPROP]         INT              NULL,
    [TD_FT]             INT              NULL,
    [TVD_FT]            INT              NULL,
    [TMD_FT]            INT              NULL,
    [PBTD_FT]           INT              NULL,
    [ELEV_FT]           INT              NULL,
    [ELEV_REF]          NVARCHAR (2)     NULL,
    [FRACFLUIDTYPE]     NVARCHAR (50)    NULL,
    [FRACPROPPANTTYPE]  NVARCHAR (50)    NULL,
    [FORMATIONS]        NVARCHAR (250)   NULL,
    [FIELDS]            NVARCHAR (250)   NULL,
    [PRIMEMER]          NVARCHAR (50)    NULL,
    [SECTIONNUM]        NVARCHAR (10)    NULL,
    [TOWNSHIP]          NVARCHAR (10)    NULL,
    [WELLRANGE]         NVARCHAR (10)    NULL,
    [GASTOTAL]          NUMERIC (38, 8)  NULL,
    [GASLAST12]         NUMERIC (38, 8)  NULL,
    [OILTOTAL]          NUMERIC (38, 8)  NULL,
    [OILLAST12]         NUMERIC (38, 8)  NULL,
    [WATTOTAL]          NUMERIC (38, 8)  NULL,
    [WATLAST12]         NUMERIC (38, 8)  NULL,
    [BOETOTAL]          NUMERIC (38, 8)  NULL,
    [BOELAST12]         NUMERIC (38, 8)  NULL,
    [MONTHTOTAL]        NUMERIC (38, 8)  NULL,
    [MONTHLAST12]       NUMERIC (38, 8)  NULL,
    [YEARSPRODUCTION]   SMALLINT         NULL,
    [SHALE]             NVARCHAR (100)   NULL,
    [BASIN]             NVARCHAR (100)   NULL,
    [G_SUB_OPER]        NVARCHAR (150)   NULL,
    [G_OPERATOR]        NVARCHAR (150)   NULL,
    [G_OWNER]           NVARCHAR (200)   NULL,
    [C_SUB_OPER]        NVARCHAR (150)   NULL,
    [C_OPERATOR]        NVARCHAR (150)   NULL,
    [C_OWNER]           NVARCHAR (200)   NULL,
    [W_SUB_OPER]        NVARCHAR (150)   NULL,
    [W_OPERATOR]        NVARCHAR (150)   NULL,
    [W_OWNER]           NVARCHAR (200)   NULL,
    [PREV_OWNER]        NVARCHAR (200)   NULL,
    [TRANS_DATE]        DATETIME2 (7)    NULL,
    [TRANS_NOTE]        NVARCHAR (254)   NULL,
    [TRANS_ID]          NVARCHAR (20)    NULL,
    [LOC_ID]            NVARCHAR (50)    NULL,
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
    [CNTY_NAME]         NVARCHAR (60)    NULL,
    [STATE_NAME]        NVARCHAR (40)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [UPDATE_NO]         NVARCHAR (5)     NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R591_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g554_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S554_idx]
    ON [dbo].[RXT_OILANDGASWELLS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -8169422.0938, XMIN = -19847423.464, YMAX = 11700761.3674, YMIN = 2804892.5374)
          );

