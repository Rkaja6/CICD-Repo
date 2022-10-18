CREATE TABLE [dbo].[LOE_ADJ] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]   DATETIME        NULL,
    [ADJUSTMENT]     NUMERIC (19, 2) NULL,
    [COMPANY]        VARCHAR (2)     NULL,
    [LOE]            NUMERIC (19, 2) NULL,
    [LOE_DECIMAL]    NUMERIC (19, 8) NULL,
    [NET_LOE_ADJ]    NUMERIC (19, 2) NULL,
    [NET_REVENUE]    NUMERIC (19, 2) NULL,
    [NEW_OG_SALE]    VARCHAR (9)     NULL,
    [OGP_PROP]       VARCHAR (12)    NULL,
    [OGP_PROP_NO]    VARCHAR (12)    NULL,
    [SYSTEM_DATE]    DATETIME        NULL,
    [SYSTEM_TIME]    VARCHAR (8)     NULL,
    [SYSTEM_USER_ID] VARCHAR (9)     NULL,
    [VOUCHER]        VARCHAR (15)    NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

