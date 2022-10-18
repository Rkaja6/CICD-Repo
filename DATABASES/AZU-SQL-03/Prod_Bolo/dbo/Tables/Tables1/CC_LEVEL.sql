CREATE TABLE [dbo].[CC_LEVEL] (
    [u2_id]             VARCHAR (255) NOT NULL,
    [AUTO_CC_DICT]      VARCHAR (10)  NULL,
    [AUTO_CC_NAME_DICT] VARCHAR (13)  NULL,
    [AUTO_CC_TYPE]      VARCHAR (4)   NULL,
    [DESCRIPTION]       VARCHAR (30)  NULL,
    [RELATIVE_LEVEL]    VARCHAR (8)   NULL,
    [time_stamp]        DATETIME      NULL,
    [u2_checksum]       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

