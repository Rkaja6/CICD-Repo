CREATE TABLE [dbo].[PAY_CODE_CHANGE] (
    [u2_id]                  VARCHAR (255) NOT NULL,
    [APPR]                   VARCHAR (4)   NULL,
    [APPR_DATE]              DATETIME      NULL,
    [BEG_SALE_DATE]          DATETIME      NULL,
    [CHANGE_DATE]            DATETIME      NULL,
    [COMPANY]                VARCHAR (3)   NULL,
    [DOCUMENT]               VARCHAR (8)   NULL,
    [EFF_DATE]               DATETIME      NULL,
    [END_SALE_DATE]          DATETIME      NULL,
    [OVERRIDE_PAY_CODE]      VARCHAR (5)   NULL,
    [REASON]                 VARCHAR (30)  NULL,
    [SAVED_LIST]             VARCHAR (50)  NULL,
    [SYSTEM_DATE]            DATETIME      NULL,
    [SYSTEM_TIME]            VARCHAR (8)   NULL,
    [SYSTEM_USER_ID]         VARCHAR (8)   NULL,
    [TEMP_UPDATE_TRIAL_FLAG] VARCHAR (6)   NULL,
    [TYPE]                   VARCHAR (3)   NULL,
    [time_stamp]             DATETIME      NULL,
    [u2_checksum]            VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

