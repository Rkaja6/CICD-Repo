﻿CREATE TABLE [dbo].[RXT_ENERGYSTORAGE] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (254)   NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (300)   NULL,
    [UTILITY_NM]        NVARCHAR (150)   NULL,
    [STATUS]            NVARCHAR (40)    NULL,
    [SECTORNAME]        NVARCHAR (20)    NULL,
    [ISO_RTO_NM]        NVARCHAR (50)    NULL,
    [EXST_NMPLT]        NUMERIC (38, 8)  NULL,
    [PROP_NMPLT]        NUMERIC (38, 8)  NULL,
    [EXPR_NMPLT]        NUMERIC (38, 8)  NULL,
    [RETIPNMPLT]        NUMERIC (38, 8)  NULL,
    [DURATION]          NUMERIC (38, 8)  NULL,
    [SUMMER_CAP]        NUMERIC (38, 8)  NULL,
    [WINTER_CAP]        NUMERIC (38, 8)  NULL,
    [NMPLT_ENERGY_CAP]  NUMERIC (38, 8)  NULL,
    [MAX_CHRG_RT]       NUMERIC (38, 8)  NULL,
    [MAX_DISCHRG_RT]    NUMERIC (38, 8)  NULL,
    [NMPLT_PWR_RT]      NUMERIC (38, 8)  NULL,
    [GEN_ID]            NVARCHAR (25)    NULL,
    [PRIMEMOVER]        NVARCHAR (150)   NULL,
    [PRMOVPROP]         NVARCHAR (150)   NULL,
    [PRMOVRRET]         NVARCHAR (150)   NULL,
    [ENERGYSOURCE]      NVARCHAR (200)   NULL,
    [ENERGYSOURCEPROP]  NVARCHAR (200)   NULL,
    [ENERGYSOURCERET]   NVARCHAR (200)   NULL,
    [STORAGE_TECH]      NVARCHAR (200)   NULL,
    [STORAGE_TYPE]      NVARCHAR (200)   NULL,
    [ARBITRAGE]         NVARCHAR (4)     NULL,
    [FREQ_REG]          NVARCHAR (4)     NULL,
    [LOAD_FOL]          NVARCHAR (4)     NULL,
    [RAMP_SPIN_RES]     NVARCHAR (4)     NULL,
    [COLOC_RENEW_FIRM]  NVARCHAR (4)     NULL,
    [TRANS_DIST_DEFER]  NVARCHAR (4)     NULL,
    [SYS_PEAK_SHAV]     NVARCHAR (4)     NULL,
    [LOAD_MANAGE]       NVARCHAR (4)     NULL,
    [VLT_RCT_POWRSUP]   NVARCHAR (4)     NULL,
    [BACK_POW]          NVARCHAR (4)     NULL,
    [EXCE_WND_SOL_GEN]  NVARCHAR (4)     NULL,
    [STARTDATE]         DATETIME2 (7)    NULL,
    [PREV_OWNER]        NVARCHAR (200)   NULL,
    [TRANS_ID]          NVARCHAR (20)    NULL,
    [TRANS_DATE]        DATETIME2 (7)    NULL,
    [TRANS_NOTE]        NVARCHAR (254)   NULL,
    [LOC_ID]            NVARCHAR (20)    NULL,
    [LOC_DOCS]          NVARCHAR (254)   NULL,
    [SUBOPER_ID]        NVARCHAR (20)    NULL,
    [OPER_ID]           NVARCHAR (20)    NULL,
    [OPER_URL]          NVARCHAR (254)   NULL,
    [OPER_DOCS]         NVARCHAR (254)   NULL,
    [OWNER_ID]          NVARCHAR (20)    NULL,
    [OWNER_URL]         NVARCHAR (254)   NULL,
    [OWNER_DOCS]        NVARCHAR (254)   NULL,
    [CATCHALL]          NVARCHAR (500)   NULL,
    [NOTES]             NVARCHAR (150)   NULL,
    [CNTY_NAME]         NVARCHAR (60)    NULL,
    [STATE_NAME]        NVARCHAR (40)    NULL,
    [CNTRY_NAME]        NVARCHAR (40)    NULL,
    [UPDATE_NO]         NVARCHAR (4)     NULL,
    [QUALITY]           NVARCHAR (20)    NULL,
    [Shape]             [sys].[geometry] NULL,
    [GDB_GEOMATTR_DATA] VARBINARY (MAX)  NULL,
    CONSTRAINT [R745_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g708_ck] CHECK ([Shape].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S708_idx]
    ON [dbo].[RXT_ENERGYSTORAGE] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = 20037700, XMIN = -20037700, YMAX = 30241100, YMIN = -30241100)
          );
