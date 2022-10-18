CREATE TABLE [dbo].[GL_PROJ_CONS] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [ACCT]           VARCHAR (12)  NULL,
    [COMPANY]        VARCHAR (3)   NULL,
    [CURR]           VARCHAR (4)   NULL,
    [HIER]           VARCHAR (10)  NULL,
    [HIERARCHY]      VARCHAR (4)   NULL,
    [PROJECT]        VARCHAR (28)  NULL,
    [REPORT_COMPANY] VARCHAR (7)   NULL,
    [UNUSED]         VARCHAR (4)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

