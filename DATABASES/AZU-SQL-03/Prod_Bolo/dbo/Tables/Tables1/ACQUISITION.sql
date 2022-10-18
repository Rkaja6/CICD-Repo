CREATE TABLE [dbo].[ACQUISITION] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [CLOSE_DATE]     DATETIME      NULL,
    [COST_CENTER]    VARCHAR (10)  NULL,
    [DESCRIPTION]    VARCHAR (30)  NULL,
    [EFF_DATE]       DATETIME      NULL,
    [REMARKS]        VARCHAR (52)  NULL,
    [SYSTEM_DATE]    DATETIME      NULL,
    [SYSTEM_TIME]    VARCHAR (8)   NULL,
    [SYSTEM_USER_ID] VARCHAR (9)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

