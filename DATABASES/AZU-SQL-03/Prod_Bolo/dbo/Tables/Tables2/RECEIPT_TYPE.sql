CREATE TABLE [dbo].[RECEIPT_TYPE] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [AR_ACCT]     VARCHAR (11)  NULL,
    [DESCRIPTION] VARCHAR (30)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

