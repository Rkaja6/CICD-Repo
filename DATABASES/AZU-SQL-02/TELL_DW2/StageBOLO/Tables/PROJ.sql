﻿CREATE TABLE [StageBOLO].[PROJ] (
    [u2_id]               VARCHAR (255)   NOT NULL,
    [ACCRUAL_FLAG]        VARCHAR (7)     NULL,
    [AFE_CATEGORY]        VARCHAR (3)     NULL,
    [AFE_DATE]            DATETIME        NULL,
    [AFE_TYPE]            VARCHAR (4)     NULL,
    [ALLOC_ENABLED]       VARCHAR (7)     NULL,
    [APPR]                VARCHAR (8)     NULL,
    [APPR_DATE]           DATETIME        NULL,
    [BEGIN_COST_DATE]     DATETIME        NULL,
    [BILLING_PROJECT]     VARCHAR (10)    NULL,
    [BUDGETED]            VARCHAR (4)     NULL,
    [BUDGET_TOTAL]        NUMERIC (19, 2) NULL,
    [BUDGET_YEAR]         VARCHAR (4)     NULL,
    [CODING_FLAG]         VARCHAR (2)     NULL,
    [COMPANY]             VARCHAR (4)     NULL,
    [COMPLETE_FLAG]       VARCHAR (8)     NULL,
    [COST_APPROVAL_DATE]  DATETIME        NULL,
    [COST_CENTER]         VARCHAR (8)     NULL,
    [DESCRIPTION]         VARCHAR (812)   NULL,
    [DFLT_COMPANY_ACCESS] VARCHAR (7)     NULL,
    [DISCRETE_BILL_FLAG]  VARCHAR (8)     NULL,
    [END_COST_DATE]       DATETIME        NULL,
    [EXPENSE_CATEGORY]    VARCHAR (4)     NULL,
    [EXP_DATE]            DATETIME        NULL,
    [FORMATION]           VARCHAR (9)     NULL,
    [MANAGER]             VARCHAR (20)    NULL,
    [NAME]                VARCHAR (383)   NULL,
    [OPERATOR_AFE]        VARCHAR (16)    NULL,
    [PRIORITY]            VARCHAR (5)     NULL,
    [PROJECT]             VARCHAR (24)    NULL,
    [PROJ_NO]             VARCHAR (24)    NULL,
    [RECALC_FLAG]         VARCHAR (2)     NULL,
    [RECLASS_CODE]        VARCHAR (7)     NULL,
    [RESULTS]             VARCHAR (4)     NULL,
    [RESULTS_DATE]        DATETIME        NULL,
    [ROLLUP_PROJECT]      VARCHAR (19)    NULL,
    [SPONSOR_COMPANY]     VARCHAR (4)     NULL,
    [STATUS]              VARCHAR (4)     NULL,
    [SUPPLEMENT_NO]       VARCHAR (3)     NULL,
    [SUPP_REF]            VARCHAR (7)     NULL,
    [TEMP_ACCTG_PERIOD]   DATETIME        NULL,
    [TMP]                 VARCHAR (4)     NULL,
    [TYPE]                VARCHAR (4)     NULL,
    [time_stamp]          DATETIME        NULL,
    [u2_checksum]         VARCHAR (25)    NULL
);
