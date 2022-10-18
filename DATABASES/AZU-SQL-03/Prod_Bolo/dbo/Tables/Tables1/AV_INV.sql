CREATE TABLE [dbo].[AV_INV] (
    [u2_id]         VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]  DATETIME        NULL,
    [ACTIVITY_DATE] DATETIME        NULL,
    [ANALYST]       VARCHAR (10)    NULL,
    [COMPANY]       VARCHAR (9)     NULL,
    [INV_NO]        VARCHAR (12)    NULL,
    [MEAS_PT]       VARCHAR (9)     NULL,
    [PRD_CAT]       VARCHAR (3)     NULL,
    [PROD_PBASE]    NUMERIC (19, 4) NULL,
    [PURCHASER]     VARCHAR (9)     NULL,
    [REMIT_TO]      VARCHAR (9)     NULL,
    [SALE_DATE]     DATETIME        NULL,
    [time_stamp]    DATETIME        NULL,
    [u2_checksum]   VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

