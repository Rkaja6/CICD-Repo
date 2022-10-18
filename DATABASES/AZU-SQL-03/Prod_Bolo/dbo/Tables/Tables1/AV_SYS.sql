CREATE TABLE [dbo].[AV_SYS] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [BAL_CONTRACT]    VARCHAR (10)  NULL,
    [CNV_INVALID_MSG] VARCHAR (45)  NULL,
    [CNV_VALID_DATE]  DATETIME      NULL,
    [DIST_ACCT]       VARCHAR (9)   NULL,
    [DUMMY_UPI]       VARCHAR (9)   NULL,
    [PTR_EFF_DATE]    DATETIME      NULL,
    [SALE_DATE_LAG]   VARCHAR (3)   NULL,
    [UBA_VOLUME_ACCT] VARCHAR (9)   NULL,
    [VOLUME_ACCT]     VARCHAR (9)   NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

