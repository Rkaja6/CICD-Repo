CREATE TABLE [dbo].[DEPOSIT] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]   DATETIME        NULL,
    [BANK_ACCT]      VARCHAR (10)    NULL,
    [BANK_STMT_DATE] DATETIME        NULL,
    [COMPANY]        VARCHAR (3)     NULL,
    [DEPOSIT_AMT]    NUMERIC (19, 2) NULL,
    [DEPOSIT_DATE]   DATETIME        NULL,
    [SYSTEM_DATE]    DATETIME        NULL,
    [SYSTEM_TIME]    VARCHAR (8)     NULL,
    [SYSTEM_USER_ID] VARCHAR (4)     NULL,
    [TOTAL_AMT]      NUMERIC (19, 2) NULL,
    [VOUCHER]        VARCHAR (16)    NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

