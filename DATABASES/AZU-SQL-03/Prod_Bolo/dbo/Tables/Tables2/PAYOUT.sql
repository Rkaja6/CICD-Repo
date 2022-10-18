CREATE TABLE [dbo].[PAYOUT] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [ACCT_PROFILE]  VARCHAR (7)   NULL,
    [DESCRIPTION]   VARCHAR (30)  NULL,
    [PAID_OUT_DATE] DATETIME      NULL,
    [PAID_OUT_FLAG] VARCHAR (4)   NULL,
    [PAYOUT_TYPE]   VARCHAR (6)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

