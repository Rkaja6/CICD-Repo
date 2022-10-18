CREATE TABLE [dbo].[LEASE_PMT_TRACT] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [ACCT]              VARCHAR (10)    NULL,
    [AMT]               NUMERIC (19, 2) NULL,
    [LEASE_ID]          VARCHAR (8)     NULL,
    [LEASE_PMT_ID]      VARCHAR (28)    NULL,
    [PAYEE]             VARCHAR (9)     NULL,
    [PMT_PERIOD]        DATETIME        NULL,
    [PMT_TYPE]          VARCHAR (9)     NULL,
    [REVERSAL_TRANS_ID] VARCHAR (9)     NULL,
    [SYSTEM_DATE]       DATETIME        NULL,
    [SYSTEM_TIME]       VARCHAR (8)     NULL,
    [SYSTEM_USER_ID]    VARCHAR (8)     NULL,
    [TRACT_ID]          VARCHAR (15)    NULL,
    [TRANS_ID]          VARCHAR (9)     NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

