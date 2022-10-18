CREATE TABLE [dbo].[INT] (
    [u2_id]             VARCHAR (255) NOT NULL,
    [CDX_INT]           VARCHAR (4)   NULL,
    [DESCRIPTION]       VARCHAR (34)  NULL,
    [INTEREST_CATEGORY] VARCHAR (4)   NULL,
    [SUMMARY_INT_TYPE]  VARCHAR (4)   NULL,
    [TEN99_CODE]        VARCHAR (3)   NULL,
    [time_stamp]        DATETIME      NULL,
    [u2_checksum]       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

