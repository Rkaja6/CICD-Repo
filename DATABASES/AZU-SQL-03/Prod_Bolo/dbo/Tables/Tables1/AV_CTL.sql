CREATE TABLE [dbo].[AV_CTL] (
    [u2_id]                  VARCHAR (255)   NOT NULL,
    [GAS_VOL_FLAG]           VARCHAR (4)     NULL,
    [GWIZ_PROD_FLAG]         VARCHAR (4)     NULL,
    [PURCHASER_VOUCHER_FLAG] VARCHAR (5)     NULL,
    [VARIANCE]               NUMERIC (19, 8) NULL,
    [VARIANCE_VOL]           NUMERIC (19, 2) NULL,
    [time_stamp]             DATETIME        NULL,
    [u2_checksum]            VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

