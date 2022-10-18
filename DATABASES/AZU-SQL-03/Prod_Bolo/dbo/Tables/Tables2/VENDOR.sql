CREATE TABLE [dbo].[VENDOR] (
    [u2_id]                  VARCHAR (255) NOT NULL,
    [BANK]                   VARCHAR (4)   NULL,
    [BANK_ACCT]              VARCHAR (17)  NULL,
    [BANK_ACCT_TYPE]         VARCHAR (3)   NULL,
    [DFLT_ACCT]              VARCHAR (12)  NULL,
    [EXP_DATE]               DATETIME      NULL,
    [INTERMEDIATE_BANK]      VARCHAR (4)   NULL,
    [INTERMEDIATE_BANK_ACCT] VARCHAR (12)  NULL,
    [PMT_ADDRESS]            VARCHAR (7)   NULL,
    [PRENOTE_DATE]           DATETIME      NULL,
    [SPECIAL_INSTRUCTIONS]   VARCHAR (418) NULL,
    [SPEND_CAT]              VARCHAR (3)   NULL,
    [TEN99_CODE]             VARCHAR (5)   NULL,
    [time_stamp]             DATETIME      NULL,
    [u2_checksum]            VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

