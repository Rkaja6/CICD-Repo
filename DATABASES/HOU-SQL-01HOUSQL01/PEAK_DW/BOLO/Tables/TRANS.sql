﻿CREATE TABLE [BOLO].[TRANS] (
    [u2_id]                     VARCHAR (255)   NOT NULL,
    [ACCT]                      VARCHAR (16)    NULL,
    [ACCTG_PERIOD]              DATETIME        NULL,
    [ACTIVITY_DATE]             DATETIME        NULL,
    [ALLOC_ENABLED]             VARCHAR (7)     NULL,
    [ALLOC_PCT]                 NUMERIC (19, 6) NULL,
    [ALLOC_TRACT_ID]            VARCHAR (10)    NULL,
    [AMT]                       NUMERIC (19, 2) NULL,
    [APP]                       VARCHAR (8)     NULL,
    [APPLY_WHT]                 VARCHAR (5)     NULL,
    [AT_ALLOC_DATE]             DATETIME        NULL,
    [AT_ASSET_ID]               VARCHAR (48)    NULL,
    [AT_BASIS_ACCT]             VARCHAR (10)    NULL,
    [AT_CC_ALLOC_ID]            VARCHAR (14)    NULL,
    [AT_TYPE]                   VARCHAR (13)    NULL,
    [BALANCING_AMT]             NUMERIC (19, 2) NULL,
    [BAL_SOURCE_TRANS_ID]       VARCHAR (8)     NULL,
    [CC_ALLOC_DATE]             DATETIME        NULL,
    [CC_ALLOC_DATE_ENABLED]     VARCHAR (25)    NULL,
    [CC_ALLOC_ID]               VARCHAR (31)    NULL,
    [CNV_ID]                    VARCHAR (21)    NULL,
    [CN_GRP_ID]                 VARCHAR (25)    NULL,
    [CN_PCT]                    NUMERIC (19, 8) NULL,
    [COMPANY]                   VARCHAR (4)     NULL,
    [COST_CENTER]               VARCHAR (7)     NULL,
    [CPT]                       VARCHAR (6)     NULL,
    [CURR_STATUS]               VARCHAR (10)    NULL,
    [DESCRIPTION]               VARCHAR (660)   NULL,
    [DESC_TXT]                  VARCHAR (660)   NULL,
    [DIRECT_BILL]               VARCHAR (9)     NULL,
    [DIST_COMPANY]              VARCHAR (4)     NULL,
    [DOI]                       VARCHAR (9)     NULL,
    [DOI_SESSION]               VARCHAR (10)    NULL,
    [FOREIGN_SYSTEM_DATE]       DATETIME        NULL,
    [GEN_ACCT]                  VARCHAR (8)     NULL,
    [GL_DATE]                   VARCHAR (11)    NULL,
    [IDEAS_EXPORT_DATE]         VARCHAR (10)    NULL,
    [IDEAS_EXPORT_FN]           VARCHAR (21)    NULL,
    [IDEAS_FQA]                 VARCHAR (9)     NULL,
    [INTERCO_FROM_TRANS_ID]     VARCHAR (11)    NULL,
    [INTERCO_TO_TRANS_ID]       VARCHAR (8)     NULL,
    [INT_AMT]                   NUMERIC (19, 2) NULL,
    [INT_BALANCING_AMT]         NUMERIC (19, 2) NULL,
    [INT_PMT_AMT]               NUMERIC (19, 2) NULL,
    [INT_STAT1_AMT]             NUMERIC (19, 2) NULL,
    [INT_WHT_AMT]               NUMERIC (19, 2) NULL,
    [IN_SERVICE_PERIOD]         DATETIME        NULL,
    [IR_DATE]                   DATETIME        NULL,
    [IR_DECK]                   VARCHAR (8)     NULL,
    [IR_DECK_SESSION]           VARCHAR (8)     NULL,
    [IR_ENABLED]                VARCHAR (8)     NULL,
    [IR_PGM_ID]                 VARCHAR (8)     NULL,
    [JIB_ALLOC_DATE]            DATETIME        NULL,
    [JIB_ALLOC_DATE_ENABLED]    VARCHAR (39)    NULL,
    [JIB_DECK]                  VARCHAR (7)     NULL,
    [JIB_DECK_SESSION]          VARCHAR (4)     NULL,
    [JUR_TAX_TABLE_ID]          VARCHAR (8)     NULL,
    [NAME]                      VARCHAR (9)     NULL,
    [ORIGINAL_VOU_TYPE]         VARCHAR (6)     NULL,
    [PMT_AMT]                   NUMERIC (19, 2) NULL,
    [POST_DATE]                 DATETIME        NULL,
    [POST_TIME]                 VARCHAR (9)     NULL,
    [PO_NO]                     VARCHAR (8)     NULL,
    [PRODUCT]                   VARCHAR (3)     NULL,
    [PROJECT]                   VARCHAR (28)    NULL,
    [QTY1]                      NUMERIC (19, 2) NULL,
    [QTY2]                      NUMERIC (19, 2) NULL,
    [RECEIPT_ID]                VARCHAR (16)    NULL,
    [RECONCILED]                VARCHAR (10)    NULL,
    [RETIREMENT_AMT]            NUMERIC (19, 2) NULL,
    [RETIREMENT_PERIOD]         DATETIME        NULL,
    [REVAL_CURR]                VARCHAR (5)     NULL,
    [SALES_TAX_RATE_ID]         VARCHAR (5)     NULL,
    [SALE_TAX_TRANS_INDEX]      VARCHAR (9)     NULL,
    [SOURCE_CURRENCY]           VARCHAR (3)     NULL,
    [SOURCE_GROSS_TRANS_ID]     VARCHAR (8)     NULL,
    [SOURCE_PORT]               VARCHAR (9)     NULL,
    [SOURCE_SALES_TAX_TRANS_ID] VARCHAR (9)     NULL,
    [SOURCE_TABLE]              VARCHAR (12)    NULL,
    [SRC_ALLOC_TRANS_ID]        VARCHAR (9)     NULL,
    [SRC_CN_TRANS_ID]           VARCHAR (9)     NULL,
    [SRC_TRANS_ID_AT]           VARCHAR (8)     NULL,
    [SRC_VIR_TRANS_ID]          VARCHAR (9)     NULL,
    [STAT1_AMT]                 NUMERIC (19, 2) NULL,
    [STAT1_QTY1]                NUMERIC (19, 2) NULL,
    [STAT1_QTY2]                NUMERIC (19, 2) NULL,
    [STAT2_AMT]                 NUMERIC (19, 2) NULL,
    [STAT2_QTY1]                NUMERIC (19, 2) NULL,
    [STAT2_QTY2]                NUMERIC (19, 2) NULL,
    [SUB_ACCT]                  VARCHAR (4)     NULL,
    [SUMMARY_TRANS_ID]          VARCHAR (8)     NULL,
    [SUMMARY_TRANS_PCT]         NUMERIC (19, 6) NULL,
    [SYSTEM_DATE]               DATETIME        NULL,
    [SYSTEM_TIME]               VARCHAR (7)     NULL,
    [SYSTEM_USER_ID]            VARCHAR (16)    NULL,
    [TARGET_DOCUMENT]           VARCHAR (15)    NULL,
    [TARGET_NAME]               VARCHAR (8)     NULL,
    [TARGET_TABLE]              VARCHAR (8)     NULL,
    [TEN99_CODE]                VARCHAR (5)     NULL,
    [TRACT_ID]                  VARCHAR (8)     NULL,
    [TYPE]                      VARCHAR (13)    NULL,
    [VIRTUAL_FLAG]              VARCHAR (4)     NULL,
    [VOUCHER]                   VARCHAR (22)    NULL,
    [WHT_AMT]                   NUMERIC (19, 2) NULL,
    [WHT_RATE]                  NUMERIC (19, 8) NULL,
    [time_stamp]                DATETIME        NULL,
    [u2_checksum]               VARCHAR (25)    NULL
);

