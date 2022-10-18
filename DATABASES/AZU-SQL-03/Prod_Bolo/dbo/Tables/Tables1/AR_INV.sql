﻿CREATE TABLE [dbo].[AR_INV] (
    [u2_id]               VARCHAR (255)   NOT NULL,
    [ACCT]                VARCHAR (10)    NULL,
    [ACCTG_PERIOD]        DATETIME        NULL,
    [AMT]                 NUMERIC (19, 2) NULL,
    [APPLIED_AMT]         NUMERIC (19, 2) NULL,
    [APPR]                VARCHAR (4)     NULL,
    [APPR_DATE]           DATETIME        NULL,
    [BAL]                 NUMERIC (19, 2) NULL,
    [COMPANY]             VARCHAR (4)     NULL,
    [CREDIT_TERMS]        VARCHAR (5)     NULL,
    [CUSTOMER]            VARCHAR (9)     NULL,
    [DESCRIPTION]         VARCHAR (125)   NULL,
    [DIFF_AMT]            NUMERIC (19, 2) NULL,
    [DIFF_BAL]            NUMERIC (19, 2) NULL,
    [DISC_AMT]            NUMERIC (19, 2) NULL,
    [DUE_DATE]            DATETIME        NULL,
    [FOREIGN_SYSTEM_DATE] DATETIME        NULL,
    [INVOICE_DATE]        DATETIME        NULL,
    [INVOICE_NO]          VARCHAR (19)    NULL,
    [INV_REF_NO]          VARCHAR (8)     NULL,
    [MEAS_PT]             VARCHAR (8)     NULL,
    [NETTING_OVERRIDE]    VARCHAR (8)     NULL,
    [NEXT_DET_SEQ_NO]     VARCHAR (7)     NULL,
    [OVER_90]             NUMERIC (19, 2) NULL,
    [PAST_DUE_1_30]       NUMERIC (19, 2) NULL,
    [PAST_DUE_31_60]      NUMERIC (19, 2) NULL,
    [PAST_DUE_61_90]      NUMERIC (19, 2) NULL,
    [PORT]                VARCHAR (19)    NULL,
    [PRD_CATEGORY]        VARCHAR (3)     NULL,
    [PRESSURE_BASE]       NUMERIC (19, 4) NULL,
    [PRINT_STATUS]        VARCHAR (5)     NULL,
    [REMIT_TO]            VARCHAR (8)     NULL,
    [RV_RECONCILED_FLAG]  VARCHAR (5)     NULL,
    [SALE_DATE]           DATETIME        NULL,
    [SOURCE_CURRENCY]     VARCHAR (4)     NULL,
    [SYSTEM_DATE]         DATETIME        NULL,
    [SYSTEM_TIME]         VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]      VARCHAR (4)     NULL,
    [TYPE]                VARCHAR (4)     NULL,
    [VOUCHER]             VARCHAR (16)    NULL,
    [time_stamp]          DATETIME        NULL,
    [u2_checksum]         VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

