CREATE TABLE [dbo].[RE_CHECK] (
    [u2_id]               VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]        DATETIME        NULL,
    [AMT]                 NUMERIC (19, 2) NULL,
    [APP]                 VARCHAR (9)     NULL,
    [BANK_STATEMENT_DATE] DATETIME        NULL,
    [CHECK_DATE]          DATETIME        NULL,
    [COMPANY]             VARCHAR (9)     NULL,
    [CREDIT_TO]           VARCHAR (9)     NULL,
    [ID]                  VARCHAR (126)   NULL,
    [PAYEE]               VARCHAR (9)     NULL,
    [STATE]               VARCHAR (3)     NULL,
    [TEN99_YEAR]          VARCHAR (4)     NULL,
    [VOID_DATE]           DATETIME        NULL,
    [VOID_VOUCHER]        VARCHAR (16)    NULL,
    [VOUCHER]             VARCHAR (16)    NULL,
    [time_stamp]          DATETIME        NULL,
    [u2_checksum]         VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

