CREATE TABLE [dbo].[CPT_FORM] (
    [u2_id]                   VARCHAR (255)   NOT NULL,
    [DESCRIPTION]             VARCHAR (62)    NULL,
    [FORMULA]                 VARCHAR (41)    NULL,
    [GLINFO_ACCT]             VARCHAR (10)    NULL,
    [GLINFO_ACCTG_OCCUR_FLAG] VARCHAR (9)     NULL,
    [GLINFO_COMPANY]          VARCHAR (7)     NULL,
    [GLINFO_COST_CENTER]      VARCHAR (12)    NULL,
    [GLINFO_DATA_TYPE]        VARCHAR (6)     NULL,
    [RLE]                     VARCHAR (252)   NULL,
    [TEST_COST_CENTER]        VARCHAR (11)    NULL,
    [TEST_DATE]               DATETIME        NULL,
    [TEST_QTY1]               NUMERIC (19, 2) NULL,
    [TEST_QTY2]               NUMERIC (19, 2) NULL,
    [TEST_RESULT]             NUMERIC (19, 2) NULL,
    [TEST_SALE]               NUMERIC (19, 2) NULL,
    [time_stamp]              DATETIME        NULL,
    [u2_checksum]             VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

