CREATE TABLE [dbo].[CN_ALLOC] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [ACCT_CLASS]    VARCHAR (2)   NULL,
    [ALLOC_BASIS]   VARCHAR (5)   NULL,
    [DESCRIPTION]   VARCHAR (30)  NULL,
    [INACTIVE_DATE] DATETIME      NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

