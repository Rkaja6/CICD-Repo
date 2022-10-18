CREATE TABLE [dbo].[RVCC_INFO] (
    [u2_id]                     VARCHAR (255) NOT NULL,
    [ACCRUAL_ANALYST]           VARCHAR (7)   NULL,
    [ANALYST]                   VARCHAR (9)   NULL,
    [CONTRACT_REQ_FLAG]         VARCHAR (8)   NULL,
    [DFLT_CPTS_FLAG]            VARCHAR (4)   NULL,
    [DIV_ID]                    VARCHAR (6)   NULL,
    [FORMATION]                 VARCHAR (20)  NULL,
    [INT_SUMMARY_OVERRIDE_FLAG] VARCHAR (3)   NULL,
    [MAJOR_WELL]                VARCHAR (5)   NULL,
    [PROCESS_CYCLE]             VARCHAR (5)   NULL,
    [SEN168_FLAG]               VARCHAR (7)   NULL,
    [STATE]                     VARCHAR (5)   NULL,
    [TAX_ALLOC_METHOD]          VARCHAR (3)   NULL,
    [TAX_DISTRICT]              VARCHAR (4)   NULL,
    [time_stamp]                DATETIME      NULL,
    [u2_checksum]               VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

