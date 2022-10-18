﻿CREATE TABLE [StageBOLO].[OWNER_SALE] (
    [u2_id]                VARCHAR (255)   NULL,
    [COMPANY]              VARCHAR (4)     NULL,
    [time_stamp]           DATETIME        NULL,
    [u2_checksum]          VARCHAR (25)    NULL,
    [COST_CENTER]          VARCHAR (10)    NULL,
    [ADJ_SALE_VOL1]        NUMERIC (19, 2) NULL,
    [APP]                  VARCHAR (8)     NULL,
    [BANK_ACCT]            VARCHAR (4)     NULL,
    [CNV_GROSS_SALE]       NUMERIC (19, 2) NULL,
    [CNV_GROSS_VOL]        NUMERIC (19, 2) NULL,
    [CNV_ID]               VARCHAR (10)    NULL,
    [CONTRACT]             VARCHAR (7)     NULL,
    [CONTRACT_INTEREST]    NUMERIC (19, 8) NULL,
    [DIV_ID]               VARCHAR (6)     NULL,
    [DIV_SESSION]          VARCHAR (3)     NULL,
    [ESCROW_AP_INV]        VARCHAR (25)    NULL,
    [ESCROW_RLSE_DATE]     DATETIME        NULL,
    [INTEREST]             NUMERIC (19, 8) NULL,
    [INTEREST_TYPE]        VARCHAR (4)     NULL,
    [IR_DATE]              DATETIME        NULL,
    [IR_ENABLED]           VARCHAR (7)     NULL,
    [IR_PGM_ID]            VARCHAR (8)     NULL,
    [MMS_FLAG]             DATETIME        NULL,
    [OG_REG_RPT_ID]        VARCHAR (8)     NULL,
    [OG_SALE_ID]           VARCHAR (8)     NULL,
    [OWNER]                VARCHAR (9)     NULL,
    [OWNER_NO]             VARCHAR (9)     NULL,
    [OWNER_PRICE_REVALUED] DATETIME        NULL,
    [PAY_CODE]             VARCHAR (4)     NULL,
    [PROCESS_CYCLE]        VARCHAR (3)     NULL,
    [PRODUCT]              VARCHAR (3)     NULL,
    [PROPERTY]             VARCHAR (16)    NULL,
    [PROP_CHANGE_ID]       VARCHAR (10)    NULL,
    [PURCHASER]            VARCHAR (9)     NULL,
    [REVALUE_FLAG]         VARCHAR (7)     NULL,
    [RV_ASSIGN_ID]         VARCHAR (10)    NULL,
    [SALE_ACCTG_PERIOD]    DATETIME        NULL,
    [SALE_AMT]             NUMERIC (19, 2) NULL,
    [SALE_DATE]            DATETIME        NULL,
    [SALE_TYPE]            VARCHAR (4)     NULL,
    [SALE_VOL1]            NUMERIC (19, 2) NULL,
    [SALE_VOL2]            NUMERIC (19, 2) NULL,
    [SHRINK_CONTRACT]      VARCHAR (15)    NULL,
    [SOURCE_OWNER_SALE_ID] VARCHAR (8)     NULL,
    [STATUS]               VARCHAR (2)     NULL,
    [SUPPRESS_SWT_FLAG]    VARCHAR (8)     NULL,
    [UNDIST_AMT]           NUMERIC (19, 2) NULL,
    [VOUCHER]              VARCHAR (16)    NULL
);

