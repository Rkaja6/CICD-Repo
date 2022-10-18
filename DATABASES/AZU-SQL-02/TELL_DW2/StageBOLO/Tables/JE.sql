﻿CREATE TABLE [StageBOLO].[JE] (
    [u2_id]                VARCHAR (255)   NULL,
    [ACCTG_PERIOD]         DATETIME        NULL,
    [ACTIVITY_DATE]        DATETIME        NULL,
    [ALT_ACT_DATE]         DATETIME        NULL,
    [AUTO_REVERSE_FLAG]    VARCHAR (7)     NULL,
    [BALANCE]              NUMERIC (19, 2) NULL,
    [COMPANY]              VARCHAR (12)    NULL,
    [CONTROL_TOTAL]        NUMERIC (19, 2) NULL,
    [CURR_CALC]            VARCHAR (10)    NULL,
    [DESCRIPTION]          VARCHAR (193)   NULL,
    [EXG_RATE_SRC]         VARCHAR (10)    NULL,
    [REVERSAL_VOUCHER]     VARCHAR (22)    NULL,
    [SRC_CURR]             VARCHAR (10)    NULL,
    [STD_JE_ID]            VARCHAR (10)    NULL,
    [SYSTEM_DATE]          DATETIME        NULL,
    [SYSTEM_TIME]          VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]       VARCHAR (7)     NULL,
    [TOTAL_DEBITS_ENTERED] NUMERIC (19, 2) NULL,
    [TYPE]                 VARCHAR (3)     NULL,
    [VOUCHER_SOURCE]       VARCHAR (8)     NULL,
    [VOU_NO]               VARCHAR (10)    NULL,
    [VOU_SRC]              VARCHAR (3)     NULL,
    [time_stamp]           DATETIME        NULL,
    [u2_checksum]          VARCHAR (25)    NULL
);

