﻿CREATE TABLE [dbo].[STD_AP_INV] (
    [u2_id]              VARCHAR (255)   NOT NULL,
    [ACCT]               VARCHAR (12)    NULL,
    [ADVICE_REMARKS]     VARCHAR (45)    NULL,
    [APPLY_VAT]          VARCHAR (7)     NULL,
    [BANK_ACCT]          VARCHAR (8)     NULL,
    [COMPANY]            VARCHAR (3)     NULL,
    [DESCRIPTION]        VARCHAR (41)    NULL,
    [FREQUENCY]          VARCHAR (9)     NULL,
    [INACTIVE_DATE]      DATETIME        NULL,
    [INVOICE_PREFIX]     VARCHAR (17)    NULL,
    [JUR_TAX_ID]         VARCHAR (6)     NULL,
    [MAX_AMT]            NUMERIC (19, 2) NULL,
    [NEXT_AP_INV_SEQ_NO] VARCHAR (6)     NULL,
    [PERIODIC_AMT]       NUMERIC (19, 2) NULL,
    [SOURCE_CURRENCY]    VARCHAR (4)     NULL,
    [SYSTEM_DATE]        DATETIME        NULL,
    [SYSTEM_TIME]        VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]     VARCHAR (8)     NULL,
    [TAX_EXEMPT]         VARCHAR (6)     NULL,
    [TEN99_CODE]         VARCHAR (4)     NULL,
    [UNDIST_AMT]         NUMERIC (19, 2) NULL,
    [VENDOR]             VARCHAR (9)     NULL,
    [time_stamp]         DATETIME        NULL,
    [u2_checksum]        VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

