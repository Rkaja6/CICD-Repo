CREATE TABLE [dbo].[XCG_EXPORT_TEMPLATE] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [COL_HDG_FLAG]   VARCHAR (3)   NULL,
    [DESCRIPTION]    VARCHAR (34)  NULL,
    [DFLT_FILE_NAME] VARCHAR (20)  NULL,
    [DFLT_PATH]      VARCHAR (4)   NULL,
    [QUERY_TYPE]     VARCHAR (4)   NULL,
    [TBL]            VARCHAR (20)  NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

