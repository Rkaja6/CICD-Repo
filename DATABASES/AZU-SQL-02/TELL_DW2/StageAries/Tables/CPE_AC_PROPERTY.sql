﻿CREATE TABLE [StageAries].[CPE_AC_PROPERTY] (
    [DBSKEY]               VARCHAR (12)  NULL,
    [PROPNUM]              VARCHAR (12)  NULL,
    [SEQNUM]               INT           NULL,
    [MAJOR]                VARCHAR (4)   NULL,
    [LEASE]                VARCHAR (50)  NULL,
    [RSVCAT]               VARCHAR (20)  NULL,
    [RSVCAT_SEC]           VARCHAR (20)  NULL,
    [STATE]                VARCHAR (2)   NULL,
    [COUNTY]               VARCHAR (20)  NULL,
    [OPERATOR]             VARCHAR (24)  NULL,
    [OP_OBO]               VARCHAR (3)   NULL,
    [ACQ_FROM]             VARCHAR (20)  NULL,
    [API]                  VARCHAR (17)  NULL,
    [TEN_DIGIT_API]        VARCHAR (10)  NULL,
    [COMPANY_ID]           VARCHAR (6)   NULL,
    [FIELD]                VARCHAR (50)  NULL,
    [ASSET_TYPE]           VARCHAR (50)  NULL,
    [TC_AREA_LOOKUP]       VARCHAR (50)  NULL,
    [SUB_AREA]             VARCHAR (20)  NULL,
    [ZONE]                 VARCHAR (50)  NULL,
    [ZONE_SIMPLE]          VARCHAR (50)  NULL,
    [UPSIDE_TYPE]          VARCHAR (15)  NULL,
    [STATUS]               VARCHAR (5)   NULL,
    [OPS_UNIT]             VARCHAR (50)  NULL,
    [UPR_PERF]             FLOAT (53)    NULL,
    [LWR_PERF]             FLOAT (53)    NULL,
    [DEPTH]                FLOAT (53)    NULL,
    [TVD]                  FLOAT (53)    NULL,
    [LAND_ZONE]            VARCHAR (50)  NULL,
    [HOLE_DIR]             VARCHAR (4)   NULL,
    [LAT_LENGTH]           FLOAT (53)    NULL,
    [PERFD_LENGTH]         INT           NULL,
    [TOTAL_PROPPANT_LBS]   INT           NULL,
    [PROPPANT_PER_FT]      FLOAT (53)    NULL,
    [SH_LAT]               FLOAT (53)    NULL,
    [SH_LONG]              FLOAT (53)    NULL,
    [BH_LAT]               FLOAT (53)    NULL,
    [BH_LONG]              FLOAT (53)    NULL,
    [BH_PRESS]             FLOAT (53)    NULL,
    [CPE_BPO_WI]           FLOAT (53)    NULL,
    [CPE_BPO_NRI]          FLOAT (53)    NULL,
    [CPE_POB]              FLOAT (53)    NULL,
    [CPE_APO_WI]           FLOAT (53)    NULL,
    [CPE_APO_NRI]          FLOAT (53)    NULL,
    [CPE_POB2]             FLOAT (53)    NULL,
    [CPE_APO_WI2]          FLOAT (53)    NULL,
    [CPE_APO_NRI2]         FLOAT (53)    NULL,
    [LAST_POB_DATE]        DATETIME      NULL,
    [CPE_WI_RATIO]         FLOAT (53)    NULL,
    [CPE_POB_ORIG]         FLOAT (53)    NULL,
    [PO_MOS]               INT           NULL,
    [FIRST_PROD]           DATETIME      NULL,
    [FIRST_PROD_YEAR]      VARCHAR (6)   NULL,
    [START_REFRAC]         DATETIME      NULL,
    [START_1]              DATETIME      NULL,
    [NGL_YIELD]            FLOAT (53)    NULL,
    [BTU]                  FLOAT (53)    NULL,
    [SHRINK]               FLOAT (53)    NULL,
    [ABDN]                 FLOAT (53)    NULL,
    [CPE_EPCO_AREA]        VARCHAR (50)  NULL,
    [CPE_EPCO_AREA_DETAIL] VARCHAR (50)  NULL,
    [EXEMPT_END_DATE]      DATETIME      NULL,
    [EXEMPT_TAX_RATE]      FLOAT (53)    NULL,
    [BASIS_DIFF_GAS]       FLOAT (53)    NULL,
    [BASIS_DIFF_OIL]       FLOAT (53)    NULL,
    [BASIS_DIFF_NGL]       FLOAT (53)    NULL,
    [GTC_DIFF_GAS]         FLOAT (53)    NULL,
    [LOE_VAR]              FLOAT (53)    NULL,
    [LOE_FIXED]            FLOAT (53)    NULL,
    [WOE_FIXED]            FLOAT (53)    NULL,
    [GTC_FUEL]             FLOAT (53)    NULL,
    [GTC_NGL]              FLOAT (53)    NULL,
    [OPC_GATHER]           FLOAT (53)    NULL,
    [GTC_TREATMENT]        FLOAT (53)    NULL,
    [DRILL_CAPEX]          FLOAT (53)    NULL,
    [COMPL_CAPEX]          FLOAT (53)    NULL,
    [WO_CAPEX]             FLOAT (53)    NULL,
    [START_REFRAC_CPE]     DATETIME      NULL,
    [START_CPE]            DATETIME      NULL,
    [DRILL_DATE]           DATETIME      NULL,
    [COMPL_DATE]           DATETIME      NULL,
    [WO_DATE]              DATETIME      NULL,
    [START_CPE_N_15B]      DATETIME      NULL,
    [DRILL_DATE_N_15B]     DATETIME      NULL,
    [COMPL_DATE_N_15B]     DATETIME      NULL,
    [WO_DATE_N_15B]        DATETIME      NULL,
    [TYPE_CURVE_SOURCE]    VARCHAR (255) NULL,
    [START_CPE_G_15B]      DATETIME      NULL,
    [DRILL_DATE_G_15B]     DATETIME      NULL,
    [COMPL_DATE_G_15B]     DATETIME      NULL,
    [WO_DATE_G_15B]        DATETIME      NULL,
    [TELL_TC_AREA]         VARCHAR (50)  NULL,
    [TELL_RSV_CAT]         VARCHAR (50)  NULL,
    [TELL_CAP]             VARCHAR (50)  NULL,
    [TELL_START1]          DATETIME      NULL,
    [TELL_START2]          DATETIME      NULL,
    [TELL_START3]          DATETIME      NULL,
    [TELL_START4]          DATETIME      NULL,
    [TELL_GISNUM]          VARCHAR (50)  NULL,
    [TELL_S_SECTION]       FLOAT (53)    NULL,
    [TELL_S_TWN]           VARCHAR (50)  NULL,
    [TELL_S_RANGE]         VARCHAR (50)  NULL,
    [TELL_LAT_LEN]         FLOAT (53)    NULL,
    [TELL_TECH_GAS_EUR]    FLOAT (53)    NULL,
    [TELL_TECH_OIL_EUR]    FLOAT (53)    NULL,
    [TELL_WELL_NAME]       VARCHAR (50)  NULL,
    [MWL_API10]            VARCHAR (50)  NULL,
    [TELL_API14]           VARCHAR (50)  NULL,
    [TELL_FPD]             DATETIME      NULL,
    [TELL_NOTE]            VARCHAR (255) NULL,
    [TELL_TOT_PROPPANT]    FLOAT (53)    NULL,
    [TELL_ZONE_SIMPLE]     VARCHAR (50)  NULL,
    [TELL_ZONE]            VARCHAR (50)  NULL,
    [TELL_BHP_REGION]      VARCHAR (50)  NULL,
    [OTHER_CAPEX]          FLOAT (53)    NULL,
    [OTHER_DATE]           DATETIME      NULL,
    [TELL_PV10_OK]         FLOAT (53)    NULL,
    [TELL_PV10_NO]         FLOAT (53)    NULL,
    [TELL_TC_AREA_2]       VARCHAR (50)  NULL,
    [TELL_B_SECTION]       FLOAT (53)    NULL,
    [TELL_B_TWN]           VARCHAR (50)  NULL,
    [TELL_B_RANGE]         VARCHAR (50)  NULL,
    [TELL_WI]              FLOAT (53)    NULL,
    [TELL_NRI]             FLOAT (53)    NULL,
    [TELL_SHL_LAT]         FLOAT (53)    NULL,
    [TELL_SHL_LONG]        FLOAT (53)    NULL,
    [TELL_BHL_LAT]         FLOAT (53)    NULL,
    [TELL_BHL_LONG]        FLOAT (53)    NULL,
    [TELL_OPERATED]        VARCHAR (50)  NULL,
    [TELL_CNT_ID]          VARCHAR (50)  NULL,
    [TELL_START_N]         DATETIME      NULL,
    [TELL_TC_USED]         VARCHAR (50)  NULL,
    [TELL_FIXED_START]     VARCHAR (50)  NULL,
    [TELL_WELL_NUM]        FLOAT (53)    NULL,
    [TELL_BASE_SP]         FLOAT (53)    NULL,
    [TELL_BASE_ID]         VARCHAR (50)  NULL,
    [TELL_UPSIDE_SP]       FLOAT (53)    NULL,
    [TELL_UPSIDE_ID]       VARCHAR (50)  NULL,
    [TELL_OPEX]            VARCHAR (50)  NULL,
    [TELL_DIFF]            VARCHAR (50)  NULL,
    [TELL_SHRINK]          FLOAT (53)    NULL,
    [TELL_RISK]            VARCHAR (50)  NULL
);
