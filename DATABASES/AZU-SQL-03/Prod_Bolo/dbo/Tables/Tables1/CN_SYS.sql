CREATE TABLE [dbo].[CN_SYS] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [CN_VOU_APP]   VARCHAR (7)   NULL,
    [CN_VOU_SRC]   VARCHAR (5)   NULL,
    [CONTRIB_ACCT] VARCHAR (12)  NULL,
    [DIST_ACCT]    VARCHAR (12)  NULL,
    [INVEST_SL]    VARCHAR (3)   NULL,
    [NRI_CLASS]    VARCHAR (5)   NULL,
    [OPER_CO]      VARCHAR (4)   NULL,
    [PURPOSE]      VARCHAR (30)  NULL,
    [SUMMARY_FLAG] VARCHAR (7)   NULL,
    [WI_CLASS]     VARCHAR (5)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

