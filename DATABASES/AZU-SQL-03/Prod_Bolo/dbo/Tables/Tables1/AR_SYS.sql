CREATE TABLE [dbo].[AR_SYS] (
    [u2_id]               VARCHAR (255) NOT NULL,
    [AR_ADJ_APP]          VARCHAR (10)  NULL,
    [AR_ADJ_VOU_SRC]      VARCHAR (7)   NULL,
    [DFLT_AR_ACCT]        VARCHAR (10)  NULL,
    [DFLT_MSG]            VARCHAR (25)  NULL,
    [DFLT_TERMS]          VARCHAR (5)   NULL,
    [MAN_INVOICE_APP]     VARCHAR (10)  NULL,
    [MAN_INVOICE_VOU_SRC] VARCHAR (7)   NULL,
    [NEXT_INVOICE_NO]     VARCHAR (7)   NULL,
    [REMIT_TO]            VARCHAR (5)   NULL,
    [time_stamp]          DATETIME      NULL,
    [u2_checksum]         VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

