﻿CREATE TABLE [StageAries].[ROCK_AC_PROPERTY] (
    [DBSKEY]            VARCHAR (12)  NULL,
    [PROPNUM]           VARCHAR (12)  NULL,
    [LEASE]             VARCHAR (50)  NULL,
    [ALIAS]             VARCHAR (125) NULL,
    [CATEGORY]          VARCHAR (20)  NULL,
    [WELL_NO]           VARCHAR (10)  NULL,
    [MAJOR]             VARCHAR (5)   NULL,
    [WELL_TYPE]         VARCHAR (40)  NULL,
    [STATUS]            VARCHAR (5)   NULL,
    [RESERVOIR]         VARCHAR (40)  NULL,
    [OPERATOR]          VARCHAR (40)  NULL,
    [OP_CODE]           VARCHAR (3)   NULL,
    [AREA]              VARCHAR (15)  NULL,
    [FIELD]             VARCHAR (40)  NULL,
    [FIELD_GRP]         VARCHAR (40)  NULL,
    [STATE]             VARCHAR (2)   NULL,
    [COUNTY]            VARCHAR (25)  NULL,
    [RPT_TYPE]          VARCHAR (20)  NULL,
    [RSV_CLASS]         VARCHAR (10)  NULL,
    [RSV_CAT]           VARCHAR (5)   NULL,
    [CC_ID]             VARCHAR (15)  NULL,
    [API]               VARCHAR (10)  NULL,
    [PETRA_UWI]         VARCHAR (125) NULL,
    [IHS_CODE]          VARCHAR (25)  NULL,
    [SECTION]           VARCHAR (5)   NULL,
    [TWNSHP]            VARCHAR (5)   NULL,
    [RANGE]             VARCHAR (5)   NULL,
    [LATITUDE]          FLOAT (53)    NULL,
    [LONGITUDE]         FLOAT (53)    NULL,
    [SPUD_DATE]         DATETIME      NULL,
    [COMPL_DATE]        DATETIME      NULL,
    [FIRST_PROD]        DATETIME      NULL,
    [LAST_PROD]         DATETIME      NULL,
    [PA_DATE]           DATETIME      NULL,
    [DEPTH]             FLOAT (53)    NULL,
    [LAT_LENGTH]        VARCHAR (5)   NULL,
    [PRIOR_OIL]         FLOAT (53)    NULL,
    [PRIOR_GAS]         FLOAT (53)    NULL,
    [PRIOR_WTR]         FLOAT (53)    NULL,
    [ALTCODE1]          VARCHAR (255) NULL,
    [ALTCODE2]          VARCHAR (255) NULL,
    [ALTCODE3]          VARCHAR (255) NULL,
    [UNIQUEID]          VARCHAR (255) NULL,
    [RTRVCODE]          VARCHAR (255) NULL,
    [RRCDIST]           VARCHAR (255) NULL,
    [SHRINK]            FLOAT (53)    NULL,
    [WIRI]              FLOAT (53)    NULL,
    [GTC]               FLOAT (53)    NULL,
    [NEEDADJ]           VARCHAR (255) NULL,
    [LOWTAXD]           VARCHAR (255) NULL,
    [TAX_BREAK]         VARCHAR (255) NULL,
    [GASGATH]           VARCHAR (255) NULL,
    [OILGATH]           VARCHAR (255) NULL,
    [LOCATION]          VARCHAR (255) NULL,
    [SOURCE]            VARCHAR (255) NULL,
    [TELL_RSVCAT]       VARCHAR (50)  NULL,
    [TELL_NOTES]        VARCHAR (50)  NULL,
    [TELL_TC_AREA]      VARCHAR (50)  NULL,
    [TELL_LATLEN]       FLOAT (53)    NULL,
    [TELL_TVD]          FLOAT (53)    NULL,
    [TELL_TECH_EUR_GAS] FLOAT (53)    NULL,
    [TELL_TECH_EUR_OIL] FLOAT (53)    NULL,
    [BH_LAT]            FLOAT (53)    NULL,
    [BH_LONG]           FLOAT (53)    NULL,
    [TELL_BHP_REGION]   VARCHAR (50)  NULL,
    [TELL_NORM]         DATETIME      NULL,
    [TELL_START1]       DATETIME      NULL,
    [TELL_START2]       DATETIME      NULL,
    [TELL_START3]       DATETIME      NULL,
    [RESERVOIR_ALIAS]   VARCHAR (50)  NULL,
    [LOE_CC]            VARCHAR (50)  NULL,
    [LOE_FIELD]         VARCHAR (50)  NULL,
    [RCE_WI1]           FLOAT (53)    NULL,
    [RCE_WI2]           FLOAT (53)    NULL,
    [RCE_WI3]           FLOAT (53)    NULL,
    [RCE_WI4]           FLOAT (53)    NULL,
    [RCE_NRI1]          FLOAT (53)    NULL,
    [RCE_NRI2]          FLOAT (53)    NULL,
    [RCE_NRI3]          FLOAT (53)    NULL,
    [RCE_NRI4]          FLOAT (53)    NULL,
    [TELL_WI1]          FLOAT (53)    NULL,
    [TELL_WI2]          FLOAT (53)    NULL,
    [TELL_WI3]          FLOAT (53)    NULL,
    [TELL_WI4]          FLOAT (53)    NULL,
    [TELL_NRI1]         FLOAT (53)    NULL,
    [TELL_NRI2]         FLOAT (53)    NULL,
    [TELL_NRI3]         FLOAT (53)    NULL,
    [TELL_NRI4]         FLOAT (53)    NULL,
    [NGL_YIELD]         FLOAT (53)    NULL,
    [TELL_NGL]          FLOAT (53)    NULL,
    [TELL_SHRINK]       FLOAT (53)    NULL,
    [STXGAS1]           FLOAT (53)    NULL,
    [STXGAS1DATE]       VARCHAR (50)  NULL,
    [TELL_CAP]          VARCHAR (50)  NULL,
    [TELL_SL_LAT]       FLOAT (53)    NULL,
    [TELL_SL_LONG]      FLOAT (53)    NULL,
    [TELL_BH_LAT]       FLOAT (53)    NULL,
    [TELL_BH_LONG]      FLOAT (53)    NULL,
    [TELL_TIER]         VARCHAR (50)  NULL,
    [TELL_GIS]          VARCHAR (50)  NULL,
    [TELL_WELL_CNT]     FLOAT (53)    NULL,
    [TELL_GATH]         VARCHAR (50)  NULL,
    [TELL_WELL_SPAC]    FLOAT (53)    NULL,
    [TELL_TC_VAL]       FLOAT (53)    NULL,
    [TELL_MIKE]         DATE          NULL,
    [VSO_KEEP]          VARCHAR (50)  NULL,
    [VSO_CAPEX]         FLOAT (53)    NULL,
    [VSO_AREA]          INT           NULL,
    [VSO_GAS_SCALER]    FLOAT (53)    NULL,
    [VSO_COND_SCALER]   FLOAT (53)    NULL,
    [VSO_WATER_YIELD]   FLOAT (53)    NULL,
    [VSO_LOC]           INT           NULL,
    [VSO_START]         DATETIME      NULL,
    [VSO_NGL]           FLOAT (53)    NULL,
    [VSO_GTC]           FLOAT (53)    NULL,
    [VSO_OIL_DIFF]      FLOAT (53)    NULL,
    [VSO_GAS_DIFF]      FLOAT (53)    NULL,
    [VSO_NGL_DIFF]      FLOAT (53)    NULL,
    [VSO_SHRINK]        FLOAT (53)    NULL,
    [VSO_UPSIDE_GAS]    FLOAT (53)    NULL,
    [VSO_UPSIDE_COND]   FLOAT (53)    NULL,
    [VSO_UPSIDE_CAPEX]  FLOAT (53)    NULL,
    [VSO_CHECK]         INT           NULL,
    [VSO_RIG_START]     DATETIME      NULL,
    [TELL_BTU]          FLOAT (53)    NULL,
    [BTU]               FLOAT (53)    NULL,
    [VSO_UPSIDE_START]  DATETIME      NULL,
    [RCE_OP_CODE]       VARCHAR (50)  NULL,
    [TELL_CLASS]        VARCHAR (50)  NULL,
    [TELL_INVWT]        FLOAT (53)    NULL
);

