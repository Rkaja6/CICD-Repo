CREATE TABLE [dbo].[SUBLEDGER_CTL] (
    [u2_id]                 VARCHAR (255) NOT NULL,
    [DESCRIPTION]           VARCHAR (42)  NULL,
    [DIRECT_CODING_ENABLED] VARCHAR (7)   NULL,
    [time_stamp]            DATETIME      NULL,
    [u2_checksum]           VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

