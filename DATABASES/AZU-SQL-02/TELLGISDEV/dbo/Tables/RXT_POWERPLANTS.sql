﻿CREATE TABLE [dbo].[RXT_POWERPLANTS] (
    [OBJECTID]          INT              NOT NULL,
    [NAME]              NVARCHAR (100)   NULL,
    [SUB_OPER]          NVARCHAR (254)   NULL,
    [OPERATOR]          NVARCHAR (100)   NULL,
    [OWNER]             NVARCHAR (300)   NULL,
    [UTILITY_NM]        NVARCHAR (150)   NULL,
    [STATUS]            NVARCHAR (40)    NULL,
    [EXST_NMPLT]        NUMERIC (38, 8)  NULL,
    [PROP_NMPLT]        NUMERIC (38, 8)  NULL,
    [RETIPNMPLT]        NUMERIC (38, 8)  NULL,
    [PRIM_PURP]         NUMERIC (38, 8)  NULL,
    [TITLE]             NVARCHAR (80)    NULL,
    [NERC]              NVARCHAR (60)    NULL,
    [NM_WTR_SRC]        NVARCHAR (32)    NULL,
    [REG_STATUS]        NVARCHAR (15)    NULL,
    [FERC_COGEN]        NVARCHAR (3)     NULL,
    [SECTORNAME]        NVARCHAR (20)    NULL,
    [PRIMEMOVER]        NVARCHAR (150)   NULL,
    [PRMOVRRET]         NVARCHAR (150)   NULL,
    [PRMOVPROP]         NVARCHAR (150)   NULL,
    [ENERGYSOURCE]      NVARCHAR (200)   NULL,
    [ENERGYSOURCEPROP]  NVARCHAR (200)   NULL,
    [ENERGYSOURCERET]   NVARCHAR (200)   NULL,
    [TRANSCO]           NVARCHAR (150)   NULL,
    [GRIDVOLT]          NUMERIC (38, 8)  NULL,
    [GASLDC]            NVARCHAR (150)   NULL,
    [PLNAME]            NVARCHAR (150)   NULL,
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
    CONSTRAINT [R216_pk] PRIMARY KEY CLUSTERED ([OBJECTID] ASC) WITH (FILLFACTOR = 75),
    CONSTRAINT [g188_ck] CHECK ([SHAPE].[STSrid]=(3857))
);


GO
CREATE SPATIAL INDEX [S188_idx]
    ON [dbo].[RXT_POWERPLANTS] ([Shape])
    WITH  (
            BOUNDING_BOX = (XMAX = -7458773.1491, XMIN = -19114943.8157, YMAX = 11502860.5065, YMIN = 2151899.0335)
          );
