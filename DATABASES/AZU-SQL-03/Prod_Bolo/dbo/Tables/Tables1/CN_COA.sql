CREATE TABLE [dbo].[CN_COA] (
    [u2_id]              VARCHAR (255) NOT NULL,
    [FROM_COMPANY]       VARCHAR (7)   NULL,
    [TARGET_INVEST_ACCT] VARCHAR (12)  NULL,
    [TO_COMPANY]         VARCHAR (7)   NULL,
    [time_stamp]         DATETIME      NULL,
    [u2_checksum]        VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

