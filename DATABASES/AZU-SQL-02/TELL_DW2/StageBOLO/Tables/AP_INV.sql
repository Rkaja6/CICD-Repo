﻿CREATE TABLE [StageBOLO].[AP_INV] (
    [u2_id]                   VARCHAR (255)   NULL,
    [ACCT]                    VARCHAR (12)    NULL,
    [ACCTG_PERIOD]            DATETIME        NULL,
    [ADVICE_REMARKS]          VARCHAR (668)   NULL,
    [AMT]                     NUMERIC (19, 2) NULL,
    [APPR_INITS]              VARCHAR (5)     NULL,
    [APPR_PROFILE]            VARCHAR (7)     NULL,
    [BAL]                     NUMERIC (19, 2) NULL,
    [BANK_ACCT]               VARCHAR (10)    NULL,
    [COMPANY]                 VARCHAR (4)     NULL,
    [CREDIT_TERMS]            VARCHAR (5)     NULL,
    [DISB_SELECT_FLAG]        VARCHAR (12)    NULL,
    [DOCUMENT_REF]            VARCHAR (3)     NULL,
    [DUE_DATE]                DATETIME        NULL,
    [EXISTING_INVOICE]        VARCHAR (5)     NULL,
    [HOLD_TAX_ACCT]           VARCHAR (10)    NULL,
    [IMAGE_REF]               VARCHAR (13)    NULL,
    [INT_AMT]                 NUMERIC (19, 2) NULL,
    [INT_BAL]                 NUMERIC (19, 2) NULL,
    [INT_OVERRIDE_AMT_TO_PAY] NUMERIC (19, 2) NULL,
    [INT_PMT_AMT]             NUMERIC (19, 2) NULL,
    [INT_PROV_DISC_AMT]       NUMERIC (19, 2) NULL,
    [INT_UNDIST_AMT]          NUMERIC (19, 2) NULL,
    [INT_VAT_AMT]             NUMERIC (19, 2) NULL,
    [INVOICE_DATE]            DATETIME        NULL,
    [INVOICE_NO]              VARCHAR (30)    NULL,
    [INVOICE_NO_R]            VARCHAR (30)    NULL,
    [JUR_TAX_TABLE_ID]        VARCHAR (8)     NULL,
    [OCCUR_DATE]              DATETIME        NULL,
    [OVERRIDE_AMT_TO_PAY]     NUMERIC (19, 2) NULL,
    [PAID_IN_FULL_PERIOD]     DATETIME        NULL,
    [PAY_DISP]                VARCHAR (4)     NULL,
    [PMT_AMT]                 NUMERIC (19, 2) NULL,
    [PROV_DISC_AMT]           NUMERIC (19, 2) NULL,
    [RECD_DATE]               DATETIME        NULL,
    [REVALUE_FLAG]            VARCHAR (7)     NULL,
    [SEP_CHK]                 VARCHAR (3)     NULL,
    [SOURCE_CURRENCY]         VARCHAR (4)     NULL,
    [STD_AP_INV_ID]           VARCHAR (26)    NULL,
    [SYSTEM_DATE]             DATETIME        NULL,
    [SYSTEM_TIME]             VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]          VARCHAR (8)     NULL,
    [TAX_ACCT]                VARCHAR (10)    NULL,
    [TAX_CODE]                VARCHAR (8)     NULL,
    [TAX_HOLD]                VARCHAR (4)     NULL,
    [TEN99_CODE]              VARCHAR (5)     NULL,
    [TRACKING_FLAG]           VARCHAR (5)     NULL,
    [UNDIST_AMT]              NUMERIC (19, 2) NULL,
    [VAT_AMT]                 NUMERIC (19, 2) NULL,
    [VAT_RATE]                NUMERIC (19, 8) NULL,
    [VENDOR]                  VARCHAR (7)     NULL,
    [VENDOR_ID]               VARCHAR (8)     NULL,
    [VOUCHER]                 VARCHAR (16)    NULL,
    [time_stamp]              DATETIME        NULL,
    [u2_checksum]             VARCHAR (25)    NULL
);

