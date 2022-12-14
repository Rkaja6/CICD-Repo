CREATE TABLE [dbo].[OG_SALE_DET] (
    [u2_id]                   VARCHAR (255)   NOT NULL,
    [ACC_OG_SALE_ID]          VARCHAR (12)    NULL,
    [ALLOC_PCT]               NUMERIC (19, 6) NULL,
    [ANALYST]                 VARCHAR (9)     NULL,
    [APP]                     VARCHAR (8)     NULL,
    [AV_SUMMARY_WELL]         VARCHAR (7)     NULL,
    [BASE_PRICE]              NUMERIC (19, 5) NULL,
    [BASE_PRICE_ADJ]          NUMERIC (19, 5) NULL,
    [BONUS_PRICE_ADJ]         NUMERIC (19, 5) NULL,
    [BREAK_CODE]              VARCHAR (3)     NULL,
    [BTU_FACTOR]              NUMERIC (19, 6) NULL,
    [CNV_ID]                  VARCHAR (6)     NULL,
    [CODE_SEND_PARTY_DATE]    DATETIME        NULL,
    [CODE_SEND_PUR_DATE]      DATETIME        NULL,
    [COMPANY]                 VARCHAR (4)     NULL,
    [CONTRACTING_PARTY]       VARCHAR (8)     NULL,
    [CONTRACT_INTEREST]       NUMERIC (19, 8) NULL,
    [CONTRACT_NET_BBLS]       NUMERIC (19, 2) NULL,
    [CONTRA_OG_SALE_DET_ID]   VARCHAR (14)    NULL,
    [CORR_VOLUME_VOL1]        NUMERIC (19, 2) NULL,
    [CORR_VOLUME_VOL2]        NUMERIC (19, 2) NULL,
    [COST_CENTER]             VARCHAR (9)     NULL,
    [CTRC_BASIS]              VARCHAR (4)     NULL,
    [CTRC_PBASE]              NUMERIC (19, 4) NULL,
    [DISP]                    VARCHAR (3)     NULL,
    [DISTRIBUTE_FLAG]         VARCHAR (3)     NULL,
    [FINAL_CTRC_PRICE]        NUMERIC (19, 5) NULL,
    [GATHERING_SYSTEM]        VARCHAR (20)    NULL,
    [GRAVITY]                 NUMERIC (9, 1)  NULL,
    [GRAVITY_PRICE_ADJ]       NUMERIC (19, 5) NULL,
    [GROSS_NET]               NUMERIC (19, 2) NULL,
    [GROSS_VALUE]             NUMERIC (19, 2) NULL,
    [GROSS_VOLUME_VOL1]       NUMERIC (19, 2) NULL,
    [GROSS_VOLUME_VOL2]       NUMERIC (19, 2) NULL,
    [INVOICE_FLAG]            VARCHAR (3)     NULL,
    [MEAS_PT]                 VARCHAR (12)    NULL,
    [OFP_ALLOC_DATE]          DATETIME        NULL,
    [OFP_PROP_ALLOC_EFF_DATE] DATETIME        NULL,
    [OFP_PROP_ALLOC_ID]       VARCHAR (18)    NULL,
    [OG_SALE_ID]              VARCHAR (10)    NULL,
    [PPL_SALE]                VARCHAR (10)    NULL,
    [PRICE_CTRC]              VARCHAR (25)    NULL,
    [PRICE_METHOD]            VARCHAR (10)    NULL,
    [PRODUCT]                 VARCHAR (3)     NULL,
    [PROPERTY]                VARCHAR (16)    NULL,
    [PURCHASER]               VARCHAR (9)     NULL,
    [PURCH_PROPERTY]          VARCHAR (15)    NULL,
    [REPORTING_LEVEL]         VARCHAR (3)     NULL,
    [REVERSAL_FLAG]           VARCHAR (3)     NULL,
    [RUN_TICKET_ID]           VARCHAR (6)     NULL,
    [RUN_TICKET_STATUS]       VARCHAR (6)     NULL,
    [SALE_ACCTG_PERIOD]       DATETIME        NULL,
    [SALE_DATE]               DATETIME        NULL,
    [SALE_TYPE]               VARCHAR (5)     NULL,
    [SELLER]                  VARCHAR (9)     NULL,
    [SRC_BASIS]               VARCHAR (3)     NULL,
    [SRC_OG_SALE_DET_ID]      VARCHAR (10)    NULL,
    [SRC_PBASE]               NUMERIC (19, 4) NULL,
    [STMT_DATE]               DATETIME        NULL,
    [SUBMIT_USER]             VARCHAR (6)     NULL,
    [SUMMARY_ADJ_PRICE]       NUMERIC (19, 5) NULL,
    [SUMMARY_PRICE_CTRC]      VARCHAR (8)     NULL,
    [SUMMARY_PRICE_METHOD]    VARCHAR (7)     NULL,
    [SYSTEM_DATE]             DATETIME        NULL,
    [SYSTEM_TIME]             VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]          VARCHAR (6)     NULL,
    [TKTGRAVITY]              NUMERIC (9, 1)  NULL,
    [TRANSPORTER]             VARCHAR (9)     NULL,
    [TRANSPORT_COST]          NUMERIC (19, 2) NULL,
    [UOM_VOL1]                VARCHAR (6)     NULL,
    [UOM_VOL2]                VARCHAR (6)     NULL,
    [VOUCHER]                 VARCHAR (15)    NULL,
    [time_stamp]              DATETIME        NULL,
    [u2_checksum]             VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

