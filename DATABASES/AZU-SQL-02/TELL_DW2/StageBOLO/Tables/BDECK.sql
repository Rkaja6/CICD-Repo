CREATE TABLE [StageBOLO].[BDECK] (
    [u2_id]            VARCHAR (255)   NULL,
    [COMPANY]          VARCHAR (3)     NULL,
    [COST_CENTER]      VARCHAR (8)     NULL,
    [DESCRIPTION]      VARCHAR (244)   NULL,
    [INACTIVE_DATE]    DATETIME        NULL,
    [MAJOR_ACCT]       VARCHAR (12)    NULL,
    [PROJECT]          VARCHAR (10)    NULL,
    [PROPERTY]         VARCHAR (8)     NULL,
    [SUB_ACCT]         VARCHAR (12)    NULL,
    [SUSPEND_FLAG]     VARCHAR (4)     NULL,
    [TOTAL_WI_ENTERED] NUMERIC (19, 8) NULL,
    [WI_COMPLETE_FLAG] VARCHAR (7)     NULL,
    [WI_RPTG_DECK]     VARCHAR (4)     NULL,
    [time_stamp]       DATETIME        NULL,
    [u2_checksum]      VARCHAR (25)    NULL
);

