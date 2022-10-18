CREATE TABLE [dbo].[GS_STATUS] (
    [u2_id]                    VARCHAR (255) NOT NULL,
    [ALLOC_DATE]               DATETIME      NULL,
    [ALLOC_STATUS]             VARCHAR (20)  NULL,
    [CHANGE_FLAG]              VARCHAR (6)   NULL,
    [DELETE_FLAG]              VARCHAR (6)   NULL,
    [DISP]                     VARCHAR (4)   NULL,
    [GAS_BAL_ONLY_FLAG]        VARCHAR (7)   NULL,
    [GATHERING_SYSTEM]         VARCHAR (20)  NULL,
    [PENDING_PROD_UPLOAD_FLAG] VARCHAR (7)   NULL,
    [POSTED_DATE]              DATETIME      NULL,
    [POSTED_STATUS]            VARCHAR (20)  NULL,
    [SALE_DATE]                DATETIME      NULL,
    [TEMP_ACCTG_PERIOD]        DATETIME      NULL,
    [TEMP_ANALYST]             VARCHAR (5)   NULL,
    [UPLOAD_DATE]              DATETIME      NULL,
    [VALUE_DATE]               DATETIME      NULL,
    [VALUE_STATUS]             VARCHAR (20)  NULL,
    [time_stamp]               DATETIME      NULL,
    [u2_checksum]              VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

