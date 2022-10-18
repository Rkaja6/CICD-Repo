CREATE TABLE [dbo].[MMR_BSUSP] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [PERIOD_END]     DATETIME      NULL,
    [SYSTEM_DATE]    DATETIME      NULL,
    [SYSTEM_TIME]    VARCHAR (8)   NULL,
    [SYSTEM_USER_ID] VARCHAR (7)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

