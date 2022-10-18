CREATE TABLE [dbo].[UPR_OWNER] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [AGENCY_STATUS]     VARCHAR (6)     NULL,
    [APP]               VARCHAR (8)     NULL,
    [AR_BALANCE]        NUMERIC (19, 2) NULL,
    [CURRENT_AMT]       NUMERIC (19, 2) NULL,
    [DATE_LAST_CONTACT] DATETIME        NULL,
    [ID]                VARCHAR (126)   NULL,
    [NET_JIB_AR_FLAG]   VARCHAR (3)     NULL,
    [OWNER_AGENCY]      VARCHAR (6)     NULL,
    [REPORT_AGENCY]     VARCHAR (6)     NULL,
    [STATUS]            VARCHAR (6)     NULL,
    [UPR2301_STATUS]    VARCHAR (7)     NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

