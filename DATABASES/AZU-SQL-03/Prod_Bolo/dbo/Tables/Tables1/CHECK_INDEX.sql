CREATE TABLE [dbo].[CHECK_INDEX] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [BANK_ACCT]      VARCHAR (12)    NULL,
    [CHECK_NO]       VARCHAR (23)    NULL,
    [CHK_AMT]        NUMERIC (19, 2) NULL,
    [CHK_DATE]       DATETIME        NULL,
    [CHK_PAYEE]      VARCHAR (9)     NULL,
    [CHK_PAYEE_NAME] VARCHAR (40)    NULL,
    [CHK_TYPE]       VARCHAR (5)     NULL,
    [CHK_VOID_DATE]  DATETIME        NULL,
    [MICR_NO]        VARCHAR (15)    NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

