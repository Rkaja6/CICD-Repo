CREATE TABLE [dbo].[ACC_OG_SALE_CTL] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [ACCT]           VARCHAR (10)    NULL,
    [ACCTG_PERIOD]   DATETIME        NULL,
    [COMPANY]        VARCHAR (3)     NULL,
    [CONTROL_TOTAL]  NUMERIC (19, 2) NULL,
    [DESCRIPTION]    VARCHAR (30)    NULL,
    [SELECT_ANALYST] VARCHAR (9)     NULL,
    [SELECT_PRODUCT] VARCHAR (7)     NULL,
    [VOUCHER_REF]    VARCHAR (12)    NULL,
    [VOU_NO]         VARCHAR (4)     NULL,
    [VOU_SRC]        VARCHAR (3)     NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

