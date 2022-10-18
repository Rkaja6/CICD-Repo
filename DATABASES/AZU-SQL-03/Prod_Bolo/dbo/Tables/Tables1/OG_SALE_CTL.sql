CREATE TABLE [dbo].[OG_SALE_CTL] (
    [u2_id]         VARCHAR (255)   NOT NULL,
    [ACCT]          VARCHAR (10)    NULL,
    [ACCTG_PERIOD]  DATETIME        NULL,
    [AR_INV_ID]     VARCHAR (10)    NULL,
    [COMPANY]       VARCHAR (3)     NULL,
    [CONTROL_TOTAL] NUMERIC (19, 2) NULL,
    [DESCRIPTION]   VARCHAR (98)    NULL,
    [OGP_CC]        VARCHAR (6)     NULL,
    [UNDIST_AMT]    NUMERIC (19, 2) NULL,
    [VOUCHER_REF]   VARCHAR (12)    NULL,
    [VOU_NO]        VARCHAR (12)    NULL,
    [VOU_SRC]       VARCHAR (3)     NULL,
    [time_stamp]    DATETIME        NULL,
    [u2_checksum]   VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

