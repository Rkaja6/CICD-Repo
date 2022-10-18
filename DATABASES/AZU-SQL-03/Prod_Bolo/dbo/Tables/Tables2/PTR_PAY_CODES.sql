CREATE TABLE [dbo].[PTR_PAY_CODES] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [DESCRIPTION]    VARCHAR (15)  NULL,
    [DISPOSITION]    VARCHAR (11)  NULL,
    [SYSTEM_DATE]    VARCHAR (8)   NULL,
    [SYSTEM_TIME]    VARCHAR (8)   NULL,
    [SYSTEM_USER_ID] VARCHAR (6)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

