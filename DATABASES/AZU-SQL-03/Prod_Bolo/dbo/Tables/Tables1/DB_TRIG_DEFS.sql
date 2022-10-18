CREATE TABLE [dbo].[DB_TRIG_DEFS] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [DESCRIPTION]    VARCHAR (182) NULL,
    [DISABLE_FLAG]   VARCHAR (7)   NULL,
    [MODIFY_ENABLED] VARCHAR (7)   NULL,
    [TYPE]           VARCHAR (11)  NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

