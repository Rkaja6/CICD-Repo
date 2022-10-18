CREATE TABLE [dbo].[GL_OFCAST] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [ACCT]        VARCHAR (10)  NULL,
    [ACTION_FLAG] VARCHAR (6)   NULL,
    [COMPANY]     VARCHAR (7)   NULL,
    [COST_CENTER] VARCHAR (10)  NULL,
    [CURR]        VARCHAR (4)   NULL,
    [FYE]         DATETIME      NULL,
    [PROJECT]     VARCHAR (8)   NULL,
    [SOURCE]      VARCHAR (10)  NULL,
    [UNUSED]      VARCHAR (4)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

