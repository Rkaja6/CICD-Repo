CREATE TABLE [dbo].[AP_CTL] (
    [u2_id]                      VARCHAR (255) NOT NULL,
    [ALT_DOC_PROVIDER]           VARCHAR (15)  NULL,
    [ALT_PC_TARGET_XML_PATH]     VARCHAR (41)  NULL,
    [ALT_SERVER_TARGET_XML_PATH] VARCHAR (40)  NULL,
    [ALT_SOURCE_XML_PATH]        VARCHAR (40)  NULL,
    [ALT_XML_ID]                 VARCHAR (14)  NULL,
    [APPR_HIERARCHIES]           VARCHAR (4)   NULL,
    [INVOICE_LINK_TYPE]          VARCHAR (10)  NULL,
    [MULTI_VENDOR_SITES_FLAG]    VARCHAR (16)  NULL,
    [UNVOUCHERED_TRANS_FLAG]     VARCHAR (5)   NULL,
    [time_stamp]                 DATETIME      NULL,
    [u2_checksum]                VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

