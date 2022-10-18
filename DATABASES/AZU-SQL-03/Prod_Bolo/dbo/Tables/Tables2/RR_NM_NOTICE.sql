CREATE TABLE [dbo].[RR_NM_NOTICE] (
    [u2_id]        VARCHAR (255)   NOT NULL,
    [ACCTG_PERIOD] DATETIME        NULL,
    [AMT]          NUMERIC (19, 2) NULL,
    [COMPANY]      VARCHAR (3)     NULL,
    [DESCRIPTION]  VARCHAR (30)    NULL,
    [REASON_CODE]  VARCHAR (4)     NULL,
    [REPORT_DATE]  DATETIME        NULL,
    [STATE_REF]    VARCHAR (7)     NULL,
    [time_stamp]   DATETIME        NULL,
    [u2_checksum]  VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

