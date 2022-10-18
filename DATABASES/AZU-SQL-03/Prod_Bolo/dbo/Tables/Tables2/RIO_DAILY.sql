﻿CREATE TABLE [dbo].[RIO_DAILY] (
    [u2_id]              VARCHAR (255)   NOT NULL,
    [ALLOC_DATE]         DATETIME        NULL,
    [BH_PRESS]           NUMERIC (9)     NULL,
    [BH_TEMP]            NUMERIC (9, 1)  NULL,
    [BOLO_WELLZONE]      VARCHAR (11)    NULL,
    [BOLO_WELL_NAME]     VARCHAR (30)    NULL,
    [BOLO_WELL_NO]       VARCHAR (15)    NULL,
    [BTU_FACTOR]         NUMERIC (19, 3) NULL,
    [CASING_PRESS]       NUMERIC (9)     NULL,
    [CHOKE]              VARCHAR (5)     NULL,
    [CO2_INJ]            VARCHAR (15)    NULL,
    [DATA_SOURCE]        VARCHAR (11)    NULL,
    [DEF_PROD]           VARCHAR (25)    NULL,
    [GAS_INJ]            VARCHAR (12)    NULL,
    [GAS_LIFT]           NUMERIC (19, 2) NULL,
    [GAS_PROD]           NUMERIC (19, 2) NULL,
    [GAUGE_DEPTH]        VARCHAR (11)    NULL,
    [GRAVITY]            NUMERIC (9, 1)  NULL,
    [INTER_CASING_PRESS] NUMERIC (9)     NULL,
    [LAST_MOD_DT]        DATETIME        NULL,
    [LAST_MOD_USER]      VARCHAR (20)    NULL,
    [LINER_CASING_PRESS] NUMERIC (9)     NULL,
    [METHOD]             VARCHAR (6)     NULL,
    [NGL_PROD]           NUMERIC (19, 2) NULL,
    [NO_HOURS]           VARCHAR (5)     NULL,
    [OIL_PROD]           NUMERIC (19, 2) NULL,
    [PRESSURE_BASE]      NUMERIC (19, 2) NULL,
    [RIO_WELLZONE]       VARCHAR (11)    NULL,
    [SI_BH_PRESS]        NUMERIC (9)     NULL,
    [SI_TUB_PRESS]       NUMERIC (9)     NULL,
    [STATUS]             VARCHAR (6)     NULL,
    [SURF_CASING_PRESS]  NUMERIC (9)     NULL,
    [TMP]                NUMERIC (9, 1)  NULL,
    [TUBING_PRESS1]      NUMERIC (9)     NULL,
    [TUBING_PRESS2]      NUMERIC (9)     NULL,
    [WATER_INJ]          VARCHAR (12)    NULL,
    [WATER_PROD]         NUMERIC (19, 2) NULL,
    [time_stamp]         DATETIME        NULL,
    [u2_checksum]        VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

