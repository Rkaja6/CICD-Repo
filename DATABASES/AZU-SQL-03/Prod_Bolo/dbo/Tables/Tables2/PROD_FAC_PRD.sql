CREATE TABLE [dbo].[PROD_FAC_PRD] (
    [u2_id]                      VARCHAR (255) NOT NULL,
    [ALLOC_PRODUCT]              VARCHAR (7)   NULL,
    [GATHERING_SUB_SYSTEM]       VARCHAR (5)   NULL,
    [GATHERING_SYSTEM]           VARCHAR (12)  NULL,
    [GATH_SUB_SYS_ID]            VARCHAR (12)  NULL,
    [PRODUCT]                    VARCHAR (5)   NULL,
    [PROD_FAC_ID]                VARCHAR (11)  NULL,
    [PROD_UI_COORD]              VARCHAR (6)   NULL,
    [SUM_DAILY_FOR_MONTHLY_FLAG] VARCHAR (11)  NULL,
    [THEO_PRODUCT]               VARCHAR (4)   NULL,
    [time_stamp]                 DATETIME      NULL,
    [u2_checksum]                VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

