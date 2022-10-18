CREATE TABLE [dbo].[DOCUMENT] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [DB_COMPLETE]    VARCHAR (8)   NULL,
    [DB_ID]          VARCHAR (35)  NULL,
    [DOCUMENT_TYPE]  VARCHAR (12)  NULL,
    [FILE_ID]        VARCHAR (24)  NULL,
    [KEY_COMPLETE]   VARCHAR (8)   NULL,
    [MEDIA_REF]      VARCHAR (5)   NULL,
    [MEDIA_TYPE]     VARCHAR (5)   NULL,
    [SYSTEM_DATE]    DATETIME      NULL,
    [SYSTEM_TIME]    VARCHAR (8)   NULL,
    [SYSTEM_USER_ID] VARCHAR (15)  NULL,
    [TMP]            VARCHAR (4)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

