﻿CREATE TABLE [dbo].[AP_SYS] (
    [u2_id]                  VARCHAR (255)   NOT NULL,
    [ADJ_APP]                VARCHAR (10)    NULL,
    [ADJ_VOU_SRC]            VARCHAR (7)     NULL,
    [APPR_PROFILES_USED]     VARCHAR (4)     NULL,
    [AUTO_NET]               VARCHAR (4)     NULL,
    [CONTRACTS_VOU_SRC]      VARCHAR (7)     NULL,
    [CONTRACT_APP]           VARCHAR (10)    NULL,
    [DFLT_AGING_OPTION]      VARCHAR (7)     NULL,
    [DFLT_AP_ACCT]           VARCHAR (10)    NULL,
    [DFLT_BANK_ACCT]         VARCHAR (15)    NULL,
    [DFLT_TERMS]             VARCHAR (6)     NULL,
    [EXP_ADV_APP]            VARCHAR (10)    NULL,
    [EXP_ADV_VOU_SRC]        VARCHAR (7)     NULL,
    [EXP_RPT_ACCT]           VARCHAR (10)    NULL,
    [EXP_RPT_APP]            VARCHAR (10)    NULL,
    [EXP_RPT_VOU_SRC]        VARCHAR (7)     NULL,
    [INVOICE_APP]            VARCHAR (10)    NULL,
    [INVOICE_VOU_SRC]        VARCHAR (7)     NULL,
    [PAY_DISPOSITION]        VARCHAR (4)     NULL,
    [RPT_ZERO_BAL_INVS]      VARCHAR (4)     NULL,
    [SALES_TAX_PAYABLE_ACCT] VARCHAR (10)    NULL,
    [SIGNIFICANT_CHK_AMT]    NUMERIC (19, 2) NULL,
    [VAT_PAYABLE_ACCT]       VARCHAR (11)    NULL,
    [WHT_PAYABLE_ACCT]       VARCHAR (11)    NULL,
    [time_stamp]             DATETIME        NULL,
    [u2_checksum]            VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);
