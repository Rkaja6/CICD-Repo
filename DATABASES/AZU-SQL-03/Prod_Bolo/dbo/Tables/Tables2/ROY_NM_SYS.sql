CREATE TABLE [dbo].[ROY_NM_SYS] (
    [u2_id]               VARCHAR (255) NOT NULL,
    [ACCEL_ROY_PAYER]     VARCHAR (5)   NULL,
    [ADV_ROY_PREPAY_ACCT] VARCHAR (11)  NULL,
    [ADV_ROY_SALE_TYPE]   VARCHAR (4)   NULL,
    [AGENCY_TYPE]         VARCHAR (6)   NULL,
    [CALC_INTEREST]       VARCHAR (4)   NULL,
    [CONTACT]             VARCHAR (7)   NULL,
    [CONTACT_PHONE]       VARCHAR (10)  NULL,
    [DFLT_PAY_METHOD]     VARCHAR (6)   NULL,
    [FILE_NAME]           VARCHAR (25)  NULL,
    [INT_EXPENSE_ACCT]    VARCHAR (11)  NULL,
    [OGRID_NO]            VARCHAR (6)   NULL,
    [SENDER_ID]           VARCHAR (15)  NULL,
    [SENDER_ID_QUALIFIER] VARCHAR (7)   NULL,
    [time_stamp]          DATETIME      NULL,
    [u2_checksum]         VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

