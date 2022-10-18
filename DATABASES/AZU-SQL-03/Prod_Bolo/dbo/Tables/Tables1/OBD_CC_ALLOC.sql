CREATE TABLE [dbo].[OBD_CC_ALLOC] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [CC_ALLOC_HDR_ID] VARCHAR (30)  NULL,
    [COMPANY]         VARCHAR (3)   NULL,
    [COST_CENTER]     VARCHAR (6)   NULL,
    [EFF_DATE]        DATETIME      NULL,
    [MAJOR_ACCT]      VARCHAR (6)   NULL,
    [SUB_ACCT]        VARCHAR (6)   NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

