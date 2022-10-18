CREATE TABLE [dbo].[PRR_CA] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [EXPIRE_DATE]    DATETIME      NULL,
    [EXPIRE_REASON]  VARCHAR (6)   NULL,
    [POOL_CODE]      VARCHAR (4)   NULL,
    [STATE_DISTRICT] VARCHAR (8)   NULL,
    [STATE_FIELD]    VARCHAR (5)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

