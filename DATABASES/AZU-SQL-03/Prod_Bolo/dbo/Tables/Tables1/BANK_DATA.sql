CREATE TABLE [dbo].[BANK_DATA] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [BANK_ACCT]      VARCHAR (10)    NULL,
    [BANK_AMOUNT]    NUMERIC (19, 2) NULL,
    [BANK_CODE]      VARCHAR (10)    NULL,
    [BANK_STMT_DATE] DATETIME        NULL,
    [BOOK_AMT]       NUMERIC (19, 2) NULL,
    [CHECK_DATE]     DATETIME        NULL,
    [CHECK_NO]       VARCHAR (10)    NULL,
    [CLEARED_DATE]   DATETIME        NULL,
    [COMPANY]        VARCHAR (3)     NULL,
    [INLOAD_DATE]    DATETIME        NULL,
    [INLOAD_TIME]    VARCHAR (8)     NULL,
    [RECON_DATE]     DATETIME        NULL,
    [RECON_TIME]     VARCHAR (8)     NULL,
    [RECORD_TYPE]    VARCHAR (4)     NULL,
    [VAR_AMT]        NUMERIC (19, 2) NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

