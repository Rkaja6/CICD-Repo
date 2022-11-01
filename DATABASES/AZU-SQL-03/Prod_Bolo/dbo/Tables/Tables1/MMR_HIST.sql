﻿CREATE TABLE [dbo].[MMR_HIST] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]   DATETIME        NULL,
    [ADJ_REAS_CODE]  VARCHAR (3)     NULL,
    [AGREEMENT_NO]   VARCHAR (11)    NULL,
    [AID_NO]         VARCHAR (11)    NULL,
    [AID_TYPE]       VARCHAR (1)     NULL,
    [BTU_CONTENT]    NUMERIC (19, 2) NULL,
    [CALC_METH]      VARCHAR (2)     NULL,
    [COMPANY]        VARCHAR (5)     NULL,
    [CUSTOMER_ID]    VARCHAR (5)     NULL,
    [DOCUMENT_ID]    VARCHAR (12)    NULL,
    [LINE_NUMBER]    VARCHAR (9)     NULL,
    [MMBTU]          NUMERIC (19, 2) NULL,
    [MMS_PRD]        VARCHAR (3)     NULL,
    [NET_ROY_AMT]    NUMERIC (19, 2) NULL,
    [ORIG_LINE_NO]   VARCHAR (6)     NULL,
    [PAD_NUMBER]     VARCHAR (8)     NULL,
    [PAYMENT_METHOD] VARCHAR (3)     NULL,
    [PRC_AMT]        NUMERIC (19, 2) NULL,
    [RECEIPT_DATE]   DATETIME        NULL,
    [REVENUE_SOURCE] VARCHAR (4)     NULL,
    [ROY_AMT]        NUMERIC (19, 2) NULL,
    [ROY_VOL]        NUMERIC (19, 2) NULL,
    [SALES_VAL]      NUMERIC (19, 2) NULL,
    [SALES_VOL]      NUMERIC (19, 2) NULL,
    [SALE_DATE]      DATETIME        NULL,
    [SALE_TYPE]      VARCHAR (4)     NULL,
    [SA_NUMBER]      VARCHAR (4)     NULL,
    [SYSTEM_DATE]    DATETIME        NULL,
    [SYSTEM_TIME]    VARCHAR (8)     NULL,
    [SYSTEM_USER_ID] VARCHAR (7)     NULL,
    [TRANS_AMT]      NUMERIC (19, 2) NULL,
    [TRANS_CODE]     VARCHAR (3)     NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);
