CREATE TABLE [dbo].[MKT_VOL] (
    [u2_id]        VARCHAR (255)   NOT NULL,
    [COMPANY]      VARCHAR (7)     NULL,
    [COST_CENTER]  VARCHAR (11)    NULL,
    [DAILY_MMBTUS] NUMERIC (19, 2) NULL,
    [DIV_ID]       VARCHAR (11)    NULL,
    [MAKEUP_PCT]   VARCHAR (7)     NULL,
    [MEAS_PT]      VARCHAR (8)     NULL,
    [MONTHLY_PROD] NUMERIC (19, 2) NULL,
    [PPL_STMT]     VARCHAR (8)     NULL,
    [RECEIPT_PT]   VARCHAR (11)    NULL,
    [SALE_DATE]    DATETIME        NULL,
    [SALE_MONTH]   DATETIME        NULL,
    [SESSION_]     VARCHAR (10)    NULL,
    [time_stamp]   DATETIME        NULL,
    [u2_checksum]  VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

