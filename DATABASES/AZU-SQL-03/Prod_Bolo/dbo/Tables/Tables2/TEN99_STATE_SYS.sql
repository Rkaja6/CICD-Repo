CREATE TABLE [dbo].[TEN99_STATE_SYS] (
    [u2_id]                 VARCHAR (255) NOT NULL,
    [COMBINED_FILING_FLAG]  VARCHAR (4)   NULL,
    [EXEMPT_INTEREST_TYPES] VARCHAR (5)   NULL,
    [IRS_COMBINED_CODE]     VARCHAR (4)   NULL,
    [IRS_COMBINED_ELIGIBLE] VARCHAR (8)   NULL,
    [MAINT_TAX_YEAR]        VARCHAR (5)   NULL,
    [OUT_FILE]              VARCHAR (30)  NULL,
    [TAX_YEAR]              VARCHAR (4)   NULL,
    [time_stamp]            DATETIME      NULL,
    [u2_checksum]           VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

