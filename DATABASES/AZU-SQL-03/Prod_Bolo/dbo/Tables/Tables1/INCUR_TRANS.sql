CREATE TABLE [dbo].[INCUR_TRANS] (
    [u2_id]        VARCHAR (255)   NOT NULL,
    [ACCT]         VARCHAR (12)    NULL,
    [ACCTG_PERIOD] DATETIME        NULL,
    [AMT]          NUMERIC (19, 2) NULL,
    [COMPANY]      VARCHAR (3)     NULL,
    [COST_CENTER]  VARCHAR (8)     NULL,
    [DESCRIPTION]  VARCHAR (30)    NULL,
    [OCCUR_DATE]   DATETIME        NULL,
    [POST_DATE]    DATETIME        NULL,
    [PROJECT]      VARCHAR (14)    NULL,
    [VENDOR]       VARCHAR (30)    NULL,
    [time_stamp]   DATETIME        NULL,
    [u2_checksum]  VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

