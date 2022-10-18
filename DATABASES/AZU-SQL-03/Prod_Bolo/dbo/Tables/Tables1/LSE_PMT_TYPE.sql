CREATE TABLE [dbo].[LSE_PMT_TYPE] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [DESCRIPTION]  VARCHAR (28)  NULL,
    [PMT_CATEGORY] VARCHAR (8)   NULL,
    [TEN99_CODE]   VARCHAR (5)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

