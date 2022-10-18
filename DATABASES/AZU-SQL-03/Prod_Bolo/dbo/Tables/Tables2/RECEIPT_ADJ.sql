CREATE TABLE [dbo].[RECEIPT_ADJ] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]   DATETIME        NULL,
    [ADJ_AMT]        NUMERIC (19, 2) NULL,
    [CHK]            VARCHAR (9)     NULL,
    [COMPANY]        VARCHAR (3)     NULL,
    [CUSTOMER]       VARCHAR (6)     NULL,
    [REMITTER]       VARCHAR (8)     NULL,
    [SYSTEM_DATE]    DATETIME        NULL,
    [SYSTEM_TIME]    VARCHAR (8)     NULL,
    [SYSTEM_USER_ID] VARCHAR (7)     NULL,
    [UNDIST_AMT]     NUMERIC (19, 2) NULL,
    [VOUCHER]        VARCHAR (16)    NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

