﻿CREATE TABLE [dbo].[PRD_BAL_MAN] (
    [u2_id]                   VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]            DATETIME        NULL,
    [APPR]                    VARCHAR (4)     NULL,
    [APPR_DATE]               DATETIME        NULL,
    [BTU_BASIS]               VARCHAR (10)    NULL,
    [BTU_FACTOR]              NUMERIC (19, 3) NULL,
    [COMPANY]                 VARCHAR (7)     NULL,
    [COST_CENTER]             VARCHAR (12)    NULL,
    [DIV_ID]                  VARCHAR (6)     NULL,
    [DIV_SESSION]             VARCHAR (4)     NULL,
    [OWNER_VOL_STATUS]        VARCHAR (6)     NULL,
    [PRESSURE_BASE]           VARCHAR (10)    NULL,
    [PRICE]                   NUMERIC (19, 5) NULL,
    [PRODUCT]                 VARCHAR (3)     NULL,
    [REVERSAL_PRD_BAL_MAN_ID] VARCHAR (10)    NULL,
    [SALE_DATE]               DATETIME        NULL,
    [SOURCE_PRD_BAL_MAN_ID]   VARCHAR (11)    NULL,
    [TAKES_VOL1_TOTAL]        NUMERIC (19, 2) NULL,
    [TAKES_VOL2_TOTAL]        NUMERIC (19, 2) NULL,
    [time_stamp]              DATETIME        NULL,
    [u2_checksum]             VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

