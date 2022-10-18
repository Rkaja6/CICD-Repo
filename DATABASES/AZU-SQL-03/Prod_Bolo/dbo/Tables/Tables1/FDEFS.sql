CREATE TABLE [dbo].[FDEFS] (
    [u2_id]                 VARCHAR (255)  NOT NULL,
    [AUDIT_FLAG]            VARCHAR (5)    NULL,
    [COMMENTS]              VARCHAR (1894) NULL,
    [DESCRIPTION]           VARCHAR (98)   NULL,
    [ENABLE_ENCRYPTION]     VARCHAR (3)    NULL,
    [FDEFS_PK]              VARCHAR (12)   NULL,
    [INDEX_LENGTH]          NUMERIC (9)    NULL,
    [LAST_CHANGE_STAMP]     VARCHAR (22)   NULL,
    [LOOKUP_CHARS_REQUIRED] VARCHAR (10)   NULL,
    [ODS_FLAG]              VARCHAR (4)    NULL,
    [SQL_UPDATE_FLAG]       VARCHAR (6)    NULL,
    [SUB_SYSTEM]            VARCHAR (7)    NULL,
    [TYPE]                  VARCHAR (2)    NULL,
    [time_stamp]            DATETIME       NULL,
    [u2_checksum]           VARCHAR (25)   NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

