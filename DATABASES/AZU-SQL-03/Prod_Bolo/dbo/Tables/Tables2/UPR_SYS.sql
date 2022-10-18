CREATE TABLE [dbo].[UPR_SYS] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [AP_ACCT]        VARCHAR (8)   NULL,
    [CREDIT_TERM]    VARCHAR (6)   NULL,
    [DFLT_AGENCY]    VARCHAR (6)   NULL,
    [REPORT_COMPANY] VARCHAR (7)   NULL,
    [UPR_VOU_APP]    VARCHAR (11)  NULL,
    [UPR_VOU_SRC]    VARCHAR (3)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

