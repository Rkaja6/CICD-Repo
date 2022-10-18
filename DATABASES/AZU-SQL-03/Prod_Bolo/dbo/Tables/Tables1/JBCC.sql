CREATE TABLE [dbo].[JBCC] (
    [u2_id]             VARCHAR (255) NOT NULL,
    [DESCRIPTION]       VARCHAR (30)  NULL,
    [SORT_ORDER]        VARCHAR (5)   NULL,
    [SUM_OR_DET_FLAG]   VARCHAR (8)   NULL,
    [SUPPRESS_ACCT_DET] VARCHAR (8)   NULL,
    [time_stamp]        DATETIME      NULL,
    [u2_checksum]       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

