CREATE TABLE [dbo].[OWNER_JIB] (
    [u2_id]                  VARCHAR (255)   NOT NULL,
    [ACTIVITY_DATE]          DATETIME        NULL,
    [AMT]                    NUMERIC (19, 2) NULL,
    [APP]                    VARCHAR (10)    NULL,
    [AR_INV_DET_ID]          VARCHAR (13)    NULL,
    [AT_RETIREMENT_PERIOD]   DATETIME        NULL,
    [BALANCE]                NUMERIC (19, 2) NULL,
    [BILLED_PERIOD]          DATETIME        NULL,
    [CHK]                    VARCHAR (13)    NULL,
    [CLASS]                  VARCHAR (5)     NULL,
    [CNV_ID]                 VARCHAR (10)    NULL,
    [COMPANY]                VARCHAR (4)     NULL,
    [COST_CENTER]            VARCHAR (7)     NULL,
    [INV_DATE]               DATETIME        NULL,
    [IR_DATE]                DATETIME        NULL,
    [IR_ENABLED]             VARCHAR (7)     NULL,
    [IR_PGM_ID]              VARCHAR (8)     NULL,
    [OWNER]                  VARCHAR (9)     NULL,
    [PROJECT]                VARCHAR (28)    NULL,
    [QTY1]                   NUMERIC (19, 2) NULL,
    [QTY2]                   NUMERIC (19, 2) NULL,
    [SOURCE_ACCT]            VARCHAR (9)     NULL,
    [SOURCE_ACCTG_PERIOD]    DATETIME        NULL,
    [SOURCE_OWNER_JIB_INDEX] VARCHAR (8)     NULL,
    [SOURCE_TRANS_ID]        VARCHAR (9)     NULL,
    [STATUS]                 VARCHAR (5)     NULL,
    [SYSTEM_DATE]            DATETIME        NULL,
    [SYSTEM_TIME]            VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]         VARCHAR (8)     NULL,
    [UNDIST_AMT]             NUMERIC (19, 2) NULL,
    [VENDOR_NO]              VARCHAR (9)     NULL,
    [WORKING_INTEREST]       NUMERIC (19, 8) NULL,
    [time_stamp]             DATETIME        NULL,
    [u2_checksum]            VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

