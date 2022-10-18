CREATE TABLE [dbo].[IR_TRANS_SUM] (
    [u2_id]           VARCHAR (255)   NOT NULL,
    [ACCT]            VARCHAR (10)    NULL,
    [ACCTG_PERIOD]    DATETIME        NULL,
    [AMT]             NUMERIC (19, 2) NULL,
    [COST_CENTER]     VARCHAR (6)     NULL,
    [DIST_COMPANY]    VARCHAR (4)     NULL,
    [IR_DATE]         DATETIME        NULL,
    [IR_DECK]         VARCHAR (8)     NULL,
    [IR_DECK_SESSION] VARCHAR (8)     NULL,
    [IR_PGM_ID]       VARCHAR (10)    NULL,
    [QTY1]            NUMERIC (19, 2) NULL,
    [QTY2]            NUMERIC (19, 2) NULL,
    [SOURCE_CURR]     VARCHAR (3)     NULL,
    [SYSTEM_DATE]     DATETIME        NULL,
    [SYSTEM_TIME]     VARCHAR (7)     NULL,
    [time_stamp]      DATETIME        NULL,
    [u2_checksum]     VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

