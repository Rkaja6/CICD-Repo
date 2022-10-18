CREATE TABLE [dbo].[BUD_ACCT_XREF] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [ACCT]            VARCHAR (10)  NULL,
    [COMPANY]         VARCHAR (3)   NULL,
    [DESCRIPTION]     VARCHAR (47)  NULL,
    [OBUD_FIELD]      VARCHAR (12)  NULL,
    [OPER]            VARCHAR (9)   NULL,
    [SOURCE]          VARCHAR (10)  NULL,
    [SOURCE_DATA_LOC] VARCHAR (6)   NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

