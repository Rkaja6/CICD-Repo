CREATE TABLE [dbo].[LD_SYS] (
    [u2_id]                VARCHAR (255) NOT NULL,
    [ALLOW_UDECK_CHANGE]   VARCHAR (4)   NULL,
    [AP_ACCT]              VARCHAR (10)  NULL,
    [DFLT_BANK_ACCT]       VARCHAR (8)   NULL,
    [DFLT_CC_TYPE]         VARCHAR (7)   NULL,
    [DFLT_OFFICE]          VARCHAR (6)   NULL,
    [JIB_APP]              VARCHAR (10)  NULL,
    [JIB_VOU_SRC]          VARCHAR (3)   NULL,
    [PMT_REVERSAL_APP]     VARCHAR (10)  NULL,
    [PMT_REVERSAL_VOU_SRC] VARCHAR (9)   NULL,
    [time_stamp]           DATETIME      NULL,
    [u2_checksum]          VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

