CREATE TABLE [dbo].[RE_SYS] (
    [u2_id]                VARCHAR (255) NOT NULL,
    [AP_ACCT]              VARCHAR (10)  NULL,
    [ESCROW_CONTRA_ACCT]   VARCHAR (10)  NULL,
    [ESCROW_SUSPENSE_ACCT] VARCHAR (10)  NULL,
    [ESCROW_VOU_APP]       VARCHAR (8)   NULL,
    [ESCROW_VOU_SRC]       VARCHAR (5)   NULL,
    [ID]                   VARCHAR (126) NULL,
    [RLSE_VOU_APP]         VARCHAR (8)   NULL,
    [RLSE_VOU_SRC]         VARCHAR (5)   NULL,
    [_ID]                  VARCHAR (126) NULL,
    [time_stamp]           DATETIME      NULL,
    [u2_checksum]          VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

