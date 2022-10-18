CREATE TABLE [dbo].[CR_SYS] (
    [u2_id]                VARCHAR (255) NOT NULL,
    [AR_RECEIPT_APP]       VARCHAR (10)  NULL,
    [AR_RECEIPT_VOU_SRC]   VARCHAR (7)   NULL,
    [CASH_CLEARING_ACCT]   VARCHAR (12)  NULL,
    [DEPOSIT_APP]          VARCHAR (10)  NULL,
    [DEPOSIT_VOU_SRC]      VARCHAR (7)   NULL,
    [MISC_RECEIPT_APP]     VARCHAR (10)  NULL,
    [MISC_RECEIPT_VOU_SRC] VARCHAR (7)   NULL,
    [time_stamp]           DATETIME      NULL,
    [u2_checksum]          VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

