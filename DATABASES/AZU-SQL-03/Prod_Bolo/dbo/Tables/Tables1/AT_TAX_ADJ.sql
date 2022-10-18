CREATE TABLE [dbo].[AT_TAX_ADJ] (
    [u2_id]          VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD]   DATETIME        NULL,
    [ACTIVITY_DATE]  DATETIME        NULL,
    [ADJ_AMT]        NUMERIC (19, 2) NULL,
    [BAL]            NUMERIC (19, 2) NULL,
    [COMPANY]        VARCHAR (3)     NULL,
    [CONTRA_ACCT]    VARCHAR (10)    NULL,
    [CURR_CALC]      VARCHAR (10)    NULL,
    [DESCRIPTION]    VARCHAR (30)    NULL,
    [EXG_RATE_SRC]   VARCHAR (10)    NULL,
    [PERSPECTIVE]    VARCHAR (11)    NULL,
    [SRC_CURR]       VARCHAR (10)    NULL,
    [SYSTEM_DATE]    DATETIME        NULL,
    [SYSTEM_TIME]    VARCHAR (8)     NULL,
    [SYSTEM_USER_ID] VARCHAR (7)     NULL,
    [TYPE]           VARCHAR (2)     NULL,
    [VOUCHER]        VARCHAR (12)    NULL,
    [time_stamp]     DATETIME        NULL,
    [u2_checksum]    VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

