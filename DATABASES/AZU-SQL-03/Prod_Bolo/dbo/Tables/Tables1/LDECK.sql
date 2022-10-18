CREATE TABLE [dbo].[LDECK] (
    [u2_id]            VARCHAR (255)   NOT NULL,
    [CNV_ID]           VARCHAR (25)    NULL,
    [CNV_NAME]         VARCHAR (5)     NULL,
    [COMPANY]          VARCHAR (3)     NULL,
    [COST_CENTER]      VARCHAR (8)     NULL,
    [DESCRIPTION]      VARCHAR (107)   NULL,
    [INACTIVE_DATE]    DATETIME        NULL,
    [PARENT_DECK]      VARCHAR (6)     NULL,
    [PROPERTY]         VARCHAR (8)     NULL,
    [TOTAL_WI_ENTERED] NUMERIC (19, 8) NULL,
    [WI_COMPLETE_FLAG] VARCHAR (7)     NULL,
    [time_stamp]       DATETIME        NULL,
    [u2_checksum]      VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

