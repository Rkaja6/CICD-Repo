﻿CREATE TABLE [dbo].[PPL_SALE_NGL] (
    [u2_id]                  VARCHAR (255)   NOT NULL,
    [ACCT]                   VARCHAR (10)    NULL,
    [ACCTG_PERIOD]           DATETIME        NULL,
    [ANALYST]                VARCHAR (7)     NULL,
    [BTU_BASIS]              VARCHAR (5)     NULL,
    [BTU_FACTOR]             VARCHAR (10)    NULL,
    [CHK]                    VARCHAR (10)    NULL,
    [COMPANY]                VARCHAR (7)     NULL,
    [CONTRACT]               VARCHAR (8)     NULL,
    [CONTRACT_VOL1]          NUMERIC (19, 2) NULL,
    [CONTRACT_VOL2]          NUMERIC (19, 2) NULL,
    [CONTRA_PPL_SALE_ID]     VARCHAR (18)    NULL,
    [DELIVERED_MCFS]         VARCHAR (9)     NULL,
    [DELIVERED_MMBTUS]       VARCHAR (10)    NULL,
    [MEAS_PT]                VARCHAR (10)    NULL,
    [PPL_STMT_ID]            VARCHAR (15)    NULL,
    [PRESSURE_BASE]          NUMERIC (19, 4) NULL,
    [PROCEEDS]               NUMERIC (19, 2) NULL,
    [PRODUCT]                VARCHAR (7)     NULL,
    [REVERSAL_FLAG]          VARCHAR (8)     NULL,
    [SALE_DATE]              DATETIME        NULL,
    [SALE_TYPE]              VARCHAR (4)     NULL,
    [STMT_BTU_BASIS]         VARCHAR (5)     NULL,
    [STMT_BTU_FACTOR]        VARCHAR (10)    NULL,
    [STMT_PBASE]             NUMERIC (19, 4) NULL,
    [STMT_UOM]               VARCHAR (4)     NULL,
    [SUMMARY_PRICE_CONTRACT] VARCHAR (8)     NULL,
    [SYSTEM_DATE]            DATETIME        NULL,
    [SYSTEM_TIME]            VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]         VARCHAR (6)     NULL,
    [UOM]                    VARCHAR (5)     NULL,
    [VALUE_DATE]             DATETIME        NULL,
    [time_stamp]             DATETIME        NULL,
    [u2_checksum]            VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

