﻿CREATE TABLE [StageAries].[AC_PROPERTY] (
    [DBSKEY]             VARCHAR (12)  NOT NULL,
    [PROPNUM]            VARCHAR (12)  NOT NULL,
    [SEC_PROPNUM]        VARCHAR (4)   NULL,
    [WELLNAME]           VARCHAR (50)  NULL,
    [LEASE]              VARCHAR (255) NULL,
    [WELL_ID]            VARCHAR (10)  NULL,
    [API10]              VARCHAR (10)  NULL,
    [SEQNUM]             FLOAT (53)    NULL,
    [GISNUM]             VARCHAR (12)  NULL,
    [KINGDOM]            FLOAT (53)    NULL,
    [COST_CENTER]        VARCHAR (20)  NULL,
    [MAJOR]              VARCHAR (4)   NULL,
    [RSV_CAT]            VARCHAR (6)   NULL,
    [PARENT_CODE]        VARCHAR (10)  NULL,
    [REGION]             VARCHAR (30)  NULL,
    [STATE]              VARCHAR (2)   NULL,
    [COUNTY]             VARCHAR (30)  NULL,
    [FIELD]              VARCHAR (35)  NULL,
    [RESERVOIR]          VARCHAR (100) NULL,
    [OPERATOR]           VARCHAR (30)  NULL,
    [OPER_RSV]           VARCHAR (10)  NULL,
    [SPUD_DATE]          DATETIME      NULL,
    [TD_DATE]            DATETIME      NULL,
    [DATE_COMP]          DATETIME      NULL,
    [FIRST_PROD]         DATETIME      NULL,
    [START_DATE]         DATETIME      NULL,
    [LAT_SURFACE]        FLOAT (53)    NULL,
    [LONG_SURFACE]       FLOAT (53)    NULL,
    [LAT_BH]             FLOAT (53)    NULL,
    [LONG_BH]            FLOAT (53)    NULL,
    [LOCATION]           VARCHAR (75)  NULL,
    [M_SECTION]          FLOAT (53)    NULL,
    [TOWNSHIP]           VARCHAR (6)   NULL,
    [RANGE]              VARCHAR (6)   NULL,
    [DEPTH]              FLOAT (53)    NULL,
    [PB_DEPTH]           FLOAT (53)    NULL,
    [UPR_PERF]           FLOAT (53)    NULL,
    [LWR_PERF]           FLOAT (53)    NULL,
    [HORIZONTAL]         VARCHAR (3)   NULL,
    [LATERAL_LEN]        FLOAT (53)    NULL,
    [LATERAL_DIR]        VARCHAR (10)  NULL,
    [STATUS]             VARCHAR (12)  NULL,
    [WI_BPO]             FLOAT (53)    NULL,
    [NRI_BPO]            FLOAT (53)    NULL,
    [WI_APO]             FLOAT (53)    NULL,
    [NRI_APO]            FLOAT (53)    NULL,
    [PROD_ID]            FLOAT (53)    NULL,
    [PAYOUT]             FLOAT (53)    NULL,
    [WI_APO2]            FLOAT (53)    NULL,
    [NRI_APO2]           FLOAT (53)    NULL,
    [PAYOUT2]            FLOAT (53)    NULL,
    [ROI]                FLOAT (53)    NULL,
    [ORRI]               FLOAT (53)    NULL,
    [PRIOR_OIL]          FLOAT (53)    NULL,
    [PRIOR_GAS]          FLOAT (53)    NULL,
    [PRIOR_WTR]          FLOAT (53)    NULL,
    [NOTES1]             VARCHAR (255) NULL,
    [NOTES2]             VARCHAR (255) NULL,
    [NOTES3]             VARCHAR (255) NULL,
    [NOTES4]             VARCHAR (255) NULL,
    [PV10]               FLOAT (53)    NULL,
    [TC_AREA]            VARCHAR (12)  NULL,
    [PIPELINEAREA]       VARCHAR (30)  NULL,
    [BENCH]              VARCHAR (30)  NULL,
    [FC_INDICATOR]       NCHAR (10)    NULL,
    [TECH_EUR_GAS]       FLOAT (53)    NULL,
    [TECH_EUR_OIL]       FLOAT (53)    NULL,
    [TELL_GEO_RESERVOIR] VARCHAR (50)  NULL,
    [IN_IHS]             VARCHAR (50)  NULL,
    [IN_DI]              VARCHAR (50)  NULL
);

