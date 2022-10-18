CREATE TABLE [dbo].[OFP_DRIVER] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [EFF_DATE]      DATETIME      NULL,
    [EMP_ID]        VARCHAR (12)  NULL,
    [EXP_DATE]      DATETIME      NULL,
    [INACTIVE_FLAG] VARCHAR (8)   NULL,
    [NAME]          VARCHAR (25)  NULL,
    [SORT_KEY]      VARCHAR (25)  NULL,
    [TYPE]          VARCHAR (4)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

