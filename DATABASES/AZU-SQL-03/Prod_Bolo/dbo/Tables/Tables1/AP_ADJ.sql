CREATE TABLE [dbo].[AP_ADJ] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [ACCT]           VARCHAR (10)    NULL,
    [ACCTG_PERIOD]   DATETIME        NULL,
    [ADJ_AMT]        NUMERIC (19, 2) NULL,
    [COMPANY]        VARCHAR (4)     NULL,
    [EXPLANATION]    VARCHAR (266)   NULL,
    [INVOICE]        VARCHAR (24)    NULL,
    [SYSTEM_DATE]    DATETIME        NULL,
    [SYSTEM_TIME]    VARCHAR (8)     NULL,
    [SYSTEM_USER_ID] VARCHAR (16)    NULL,
    [UNDIST_AMT]     NUMERIC (19, 2) NULL,
    [VENDOR]         VARCHAR (6)     NULL,
    [VOUCHER]        VARCHAR (15)    NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

