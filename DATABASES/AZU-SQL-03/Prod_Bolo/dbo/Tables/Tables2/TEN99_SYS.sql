CREATE TABLE [dbo].[TEN99_SYS] (
    [u2_id]                VARCHAR (255)  NOT NULL,
    [BOLD_FLAG]            VARCHAR (3)    NULL,
    [COMBINED_FILING_FLAG] VARCHAR (4)    NULL,
    [DATA_OUT_FILE]        VARCHAR (30)   NULL,
    [DD_PROCESS]           VARCHAR (30)   NULL,
    [DISKETTE_PATH]        VARCHAR (30)   NULL,
    [DUMP_SUMMARY]         VARCHAR (30)   NULL,
    [DUMP_TAX_ID]          VARCHAR (30)   NULL,
    [MAINT_TAX_YEAR]       VARCHAR (5)    NULL,
    [OUT_FILE]             VARCHAR (364)  NULL,
    [TAX_YEAR]             VARCHAR (4007) NULL,
    [TEN42_OUT_FILE]       VARCHAR (30)   NULL,
    [time_stamp]           DATETIME       NULL,
    [u2_checksum]          VARCHAR (25)   NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

