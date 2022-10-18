CREATE TABLE [dbo].[DIV_AUTH] (
    [u2_id]                 VARCHAR (255) NOT NULL,
    [AUTH_NO]               VARCHAR (7)   NULL,
    [COMPANY]               VARCHAR (3)   NULL,
    [DESCRIPTION]           VARCHAR (30)  NULL,
    [OWNER]                 VARCHAR (8)   NULL,
    [SOURCE_DIVISION_ORDER] VARCHAR (16)  NULL,
    [time_stamp]            DATETIME      NULL,
    [u2_checksum]           VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

