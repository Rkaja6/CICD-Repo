﻿CREATE TABLE [dbo].[CHECK] (
    [u2_id]                    VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]             DATETIME        NULL,
    [ACH_DATE]                 DATETIME        NULL,
    [ALT_FBO_ID]               VARCHAR (6)     NULL,
    [AMT]                      NUMERIC (19, 2) NULL,
    [APP]                      VARCHAR (10)    NULL,
    [BANK_ACCT]                VARCHAR (10)    NULL,
    [BANK_ACCT_NO]             VARCHAR (10)    NULL,
    [BANK_STMT_DATE]           DATETIME        NULL,
    [CHECK_DATE]               DATETIME        NULL,
    [CHECK_TYPE]               VARCHAR (5)     NULL,
    [COMPANY]                  VARCHAR (3)     NULL,
    [CONTROL_NO]               VARCHAR (15)    NULL,
    [CO_YYMM_IDX]              VARCHAR (20)    NULL,
    [CREDIT_TO]                VARCHAR (9)     NULL,
    [DUE_DATE]                 DATETIME        NULL,
    [FIRST_ACCOUNT_NO]         VARCHAR (25)    NULL,
    [FIRST_PARTNER_NO]         VARCHAR (6)     NULL,
    [FIRST_PTRSHP_INVESTOR_ID] VARCHAR (12)    NULL,
    [FIRST_PTRSHP_NO]          VARCHAR (6)     NULL,
    [LAST_ACCOUNT_NO]          VARCHAR (25)    NULL,
    [LAST_PTRSHP_INVESTOR_ID]  VARCHAR (12)    NULL,
    [LAST_PTRSHP_NO]           VARCHAR (6)     NULL,
    [LAST_PTR_NO]              VARCHAR (6)     NULL,
    [LEASE]                    VARCHAR (12)    NULL,
    [MICR_NO]                  VARCHAR (23)    NULL,
    [PAYEE]                    VARCHAR (9)     NULL,
    [PMT_TYPE]                 VARCHAR (9)     NULL,
    [SEQ_NO]                   VARCHAR (15)    NULL,
    [SH_CODE]                  VARCHAR (5)     NULL,
    [SORT_ORDER]               VARCHAR (5)     NULL,
    [SOURCE_PAY_TABLE]         VARCHAR (15)    NULL,
    [SYSTEM_DATE]              DATETIME        NULL,
    [SYSTEM_TIME]              VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]           VARCHAR (15)    NULL,
    [TMP]                      VARCHAR (4)     NULL,
    [UNDIST_AMT]               NUMERIC (19, 2) NULL,
    [VOID_DATE]                DATETIME        NULL,
    [VOID_VOUCHER_NO]          VARCHAR (16)    NULL,
    [VOUCHER_NO]               VARCHAR (16)    NULL,
    [WIRE_TRANSFER]            VARCHAR (4)     NULL,
    [time_stamp]               DATETIME        NULL,
    [u2_checksum]              VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

