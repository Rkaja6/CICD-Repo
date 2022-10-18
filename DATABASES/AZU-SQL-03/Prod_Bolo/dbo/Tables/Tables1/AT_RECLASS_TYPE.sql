CREATE TABLE [dbo].[AT_RECLASS_TYPE] (
    [u2_id]                      VARCHAR (255) NOT NULL,
    [DESCRIPTION]                VARCHAR (30)  NULL,
    [ORIG_IN_SERVICE_DATES_FLAG] VARCHAR (10)  NULL,
    [PRE_FYB_ACQ_FLAG]           VARCHAR (4)   NULL,
    [RECLASS_ALL_FLAG]           VARCHAR (8)   NULL,
    [SOURCE_AT_TRANS_TYPE]       VARCHAR (8)   NULL,
    [TARGET_AT_TRANS_TYPE]       VARCHAR (8)   NULL,
    [time_stamp]                 DATETIME      NULL,
    [u2_checksum]                VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

