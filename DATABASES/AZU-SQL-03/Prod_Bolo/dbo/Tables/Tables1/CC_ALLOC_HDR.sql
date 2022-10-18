CREATE TABLE [dbo].[CC_ALLOC_HDR] (
    [u2_id]              VARCHAR (255) NOT NULL,
    [ACCT_GROUP]         VARCHAR (10)  NULL,
    [ALLOC_BASIS]        VARCHAR (5)   NULL,
    [AT_FLAG]            VARCHAR (4)   NULL,
    [BASIS_MONTHS]       NUMERIC (9)   NULL,
    [COMPANY]            VARCHAR (3)   NULL,
    [CONTRA_ACCT]        VARCHAR (12)  NULL,
    [COST_CENTER]        VARCHAR (6)   NULL,
    [DATA_TYPE]          VARCHAR (10)  NULL,
    [DESCRIPTION]        VARCHAR (78)  NULL,
    [INACTIVE_DATE]      DATETIME      NULL,
    [LAG_MONTHS]         NUMERIC (9)   NULL,
    [MAJOR_ACCT]         VARCHAR (6)   NULL,
    [MANUAL_UPDATE_FLAG] VARCHAR (3)   NULL,
    [REBUILD_CC_FLAG]    VARCHAR (7)   NULL,
    [SUB_ACCT]           VARCHAR (9)   NULL,
    [VIRTUAL_FLAG]       VARCHAR (7)   NULL,
    [time_stamp]         DATETIME      NULL,
    [u2_checksum]        VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

