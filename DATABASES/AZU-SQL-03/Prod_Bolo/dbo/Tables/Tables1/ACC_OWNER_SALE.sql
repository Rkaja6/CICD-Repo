CREATE TABLE [dbo].[ACC_OWNER_SALE] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [ACC_OG_SALE_ID]    VARCHAR (7)     NULL,
    [APP]               VARCHAR (6)     NULL,
    [COMPANY]           VARCHAR (4)     NULL,
    [CONTRACT]          VARCHAR (7)     NULL,
    [CONTRACT_INTEREST] NUMERIC (19, 4) NULL,
    [COST_CENTER]       VARCHAR (8)     NULL,
    [INTEREST]          NUMERIC (19, 8) NULL,
    [INTEREST_TYPE]     VARCHAR (4)     NULL,
    [OWNER_NO]          VARCHAR (9)     NULL,
    [PAY_CODE]          VARCHAR (7)     NULL,
    [PRODUCT]           VARCHAR (3)     NULL,
    [PURCHASER]         VARCHAR (9)     NULL,
    [SALE_ACCTG_PERIOD] DATETIME        NULL,
    [SALE_AMT]          NUMERIC (19, 2) NULL,
    [SALE_DATE]         DATETIME        NULL,
    [SALE_TYPE]         VARCHAR (4)     NULL,
    [SALE_VOL1]         NUMERIC (19, 2) NULL,
    [SALE_VOL2]         NUMERIC (19, 2) NULL,
    [STATUS]            VARCHAR (2)     NULL,
    [SYSTEM_DATE]       DATETIME        NULL,
    [SYSTEM_TIME]       VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]    VARCHAR (6)     NULL,
    [VOUCHER]           VARCHAR (13)    NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

