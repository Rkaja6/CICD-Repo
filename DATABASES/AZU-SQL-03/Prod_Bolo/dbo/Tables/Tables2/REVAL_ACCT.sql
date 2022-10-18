CREATE TABLE [dbo].[REVAL_ACCT] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

