CREATE TABLE [dbo].[PDECK] (
    [u2_id]                  VARCHAR (255)   NOT NULL,
    [ACCT_GROUP_CODE]        VARCHAR (10)    NULL,
    [APP]                    VARCHAR (10)    NULL,
    [COMPANY]                VARCHAR (3)     NULL,
    [COMPLETE_FLAG]          VARCHAR (7)     NULL,
    [COST_CENTER]            VARCHAR (8)     NULL,
    [DECK_TYPE]              VARCHAR (4)     NULL,
    [DESCRIPTION]            VARCHAR (30)    NULL,
    [INACTIVE_DATE]          DATETIME        NULL,
    [MAJOR_ACCT]             VARCHAR (12)    NULL,
    [PARENT_DECK]            VARCHAR (6)     NULL,
    [PROPERTY]               VARCHAR (8)     NULL,
    [PTRSHP_NO]              VARCHAR (9)     NULL,
    [SUB_ACCT]               VARCHAR (12)    NULL,
    [SYSTEM_DATE]            DATETIME        NULL,
    [SYSTEM_TIME]            VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]         VARCHAR (6)     NULL,
    [TOTAL_INTEREST_ENTERED] NUMERIC (19, 8) NULL,
    [time_stamp]             DATETIME        NULL,
    [u2_checksum]            VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

