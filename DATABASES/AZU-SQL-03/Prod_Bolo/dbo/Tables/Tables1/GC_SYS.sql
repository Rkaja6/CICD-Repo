CREATE TABLE [dbo].[GC_SYS] (
    [u2_id]                     VARCHAR (255) NOT NULL,
    [DIST_POST_FLAG]            VARCHAR (4)   NULL,
    [ENT_INCOME_ACCT]           VARCHAR (11)  NULL,
    [LMT_LIAB_GAS_ENT_ACCT]     VARCHAR (11)  NULL,
    [SUM_WELL_FLG]              VARCHAR (10)  NULL,
    [TAKES_ENTITLEMENT_VOU_SRC] VARCHAR (6)   NULL,
    [time_stamp]                DATETIME      NULL,
    [u2_checksum]               VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

