CREATE TABLE [StageBOLO].[AP_ADJ] (
    [u2_id]          VARCHAR (255)   NULL,
    [ACCT]           VARCHAR (12)    NULL,
    [ACCTG_PERIOD]   DATETIME        NULL,
    [COMPANY]        VARCHAR (4)     NULL,
    [SYSTEM_DATE]    DATETIME        NULL,
    [SYSTEM_TIME]    VARCHAR (8)     NULL,
    [SYSTEM_USER_ID] VARCHAR (16)    NULL,
    [UNDIST_AMT]     NUMERIC (19, 2) NULL,
    [VENDOR]         VARCHAR (7)     NULL,
    [VOUCHER]        VARCHAR (16)    NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    [ADJ_AMT]        NUMERIC (19, 2) NULL,
    [EXPLANATION]    VARCHAR (266)   NULL,
    [INVOICE]        VARCHAR (24)    NULL
);

