CREATE TABLE [dbo].[GATH_SUB_SYS] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [DESCRIPTION]      VARCHAR (42)  NULL,
    [GATHERING_SYSTEM] VARCHAR (6)   NULL,
    [SUB_SYSTEM]       VARCHAR (6)   NULL,
    [TYPE]             VARCHAR (4)   NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

