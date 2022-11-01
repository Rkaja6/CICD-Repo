﻿CREATE TABLE [dbo].[RXT_REFINERIES] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (150)   NULL,
    [OPERATOR]          NVARCHAR (150)   NULL,
    [OWNER]             NVARCHAR (200)   NULL,
    [STATUS]            NVARCHAR (25)    NULL,
    [CAP_BCD]           NUMERIC (38, 8)  NULL,
    [CAP_OP_BCD]        NUMERIC (38, 8)  NULL,
    [DCC_VD]            NUMERIC (38, 8)  NULL,
    [DCC_TC_DC]         NUMERIC (38, 8)  NULL,
    [DCC_CC_F]          NUMERIC (38, 8)  NULL,
    [DCC_CC_R]          NUMERIC (38, 8)  NULL,
    [DCC_CH_D]          NUMERIC (38, 8)  NULL,
    [DCC_CH_GO]         NUMERIC (38, 8)  NULL,
    [DCC_CR_LP]         NUMERIC (38, 8)  NULL,
    [DCC_CR_HP]         NUMERIC (38, 8)  NULL,
    [DCC_D_FSD]         NUMERIC (38, 8)  NULL,
    [DCC_D_NRF]         NUMERIC (38, 8)  NULL,
    [DCC_D_G]           NUMERIC (38, 8)  NULL,
    [DCC_D_KJT]         NUMERIC (38, 8)  NULL,
    [DCC_D_DF]          NUMERIC (38, 8)  NULL,
    [DCC_D_OD]          NUMERIC (38, 8)  NULL,
    [DCC_D_HGO]         NUMERIC (38, 8)  NULL,
    [DCC_D_O]           NUMERIC (38, 8)  NULL,
    [PC_AL]             NUMERIC (38, 8)  NULL,
    [PC_AR]             NUMERIC (38, 8)  NULL,
    [PC_ARD]            NUMERIC (38, 8)  NULL,
    [PC_I_IB]           NUMERIC (38, 8)  NULL,
    [PC_I_IP_IH]        NUMERIC (38, 8)  NULL,
    [PC_L]              NUMERIC (38, 8)  NULL,
    [PC_MPC]            NUMERIC (38, 8)  NULL,
    [PC_H_MMCFD]        NUMERIC (38, 8)  NULL,
    [PC_S_STPD]         NUMERIC (38, 8)  NULL,
    [COMPLEXITY]        NUMERIC (38, 8)  NULL,
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
    CONSTRAINT [R518_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g481_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S481_idx]
    ON [dbo].[RXT_REFINERIES] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -6010512.7552, XMIN = -17601025.0264, YMAX = 11181928.7157, YMIN = 1830034.4104)
          );
