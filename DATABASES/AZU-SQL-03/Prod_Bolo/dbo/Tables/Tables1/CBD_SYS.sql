CREATE TABLE [dbo].[CBD_SYS] (
    [u2_id]                     VARCHAR (255)   NOT NULL,
    [ACCRUAL_CODING_FLAG]       VARCHAR (7)     NULL,
    [AFE_ACCRUAL_JE_TYPE]       VARCHAR (7)     NULL,
    [AFE_ACCRUAL_OFFSET_ACCT]   VARCHAR (9)     NULL,
    [AFE_ACCRUAL_THRESHOLD_AMT] NUMERIC (19, 2) NULL,
    [AFE_ACCRUAL_VOU_SRC]       VARCHAR (11)    NULL,
    [AFE_PROF_EDIT_FLAG]        VARCHAR (11)    NULL,
    [BILL_AFE_ACCRUALS_FLAG]    VARCHAR (8)     NULL,
    [DFLT_STATUS]               VARCHAR (7)     NULL,
    [time_stamp]                DATETIME        NULL,
    [u2_checksum]               VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

