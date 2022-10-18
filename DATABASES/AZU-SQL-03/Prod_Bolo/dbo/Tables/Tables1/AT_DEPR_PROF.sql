CREATE TABLE [dbo].[AT_DEPR_PROF] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [COMPANY]       VARCHAR (7)   NULL,
    [MAJOR_ACCT_ND] VARCHAR (5)   NULL,
    [SUB_ACCT_ND]   VARCHAR (5)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

