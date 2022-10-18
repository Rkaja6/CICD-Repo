CREATE TABLE [dbo].[RRCC_INFO] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [ST_FIELD]       VARCHAR (20)  NULL,
    [ST_LEASE_NO]    VARCHAR (10)  NULL,
    [SYSTEM_DATE]    DATETIME      NULL,
    [SYSTEM_TIME]    VARCHAR (8)   NULL,
    [SYSTEM_USER_ID] VARCHAR (9)   NULL,
    [TAX_ANALYST]    VARCHAR (9)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

