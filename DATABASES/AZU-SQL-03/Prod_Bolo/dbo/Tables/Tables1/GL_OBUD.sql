CREATE TABLE [dbo].[GL_OBUD] (
    [u2_id]                VARCHAR (255) NOT NULL,
    [ACCT]                 VARCHAR (10)  NULL,
    [ACTION_FLAG]          VARCHAR (6)   NULL,
    [COMPANY]              VARCHAR (7)   NULL,
    [COST_CENTER]          VARCHAR (10)  NULL,
    [CURR]                 VARCHAR (4)   NULL,
    [FYE]                  DATETIME      NULL,
    [JIB_DATE]             DATETIME      NULL,
    [PROJECT]              VARCHAR (8)   NULL,
    [SOURCE]               VARCHAR (10)  NULL,
    [SRC_ALLOC_GL_OBUD_ID] VARCHAR (7)   NULL,
    [TMP]                  VARCHAR (4)   NULL,
    [UNUSED]               VARCHAR (4)   NULL,
    [time_stamp]           DATETIME      NULL,
    [u2_checksum]          VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

