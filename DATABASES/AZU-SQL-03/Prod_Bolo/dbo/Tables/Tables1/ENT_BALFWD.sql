CREATE TABLE [dbo].[ENT_BALFWD] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [COMPANY]      VARCHAR (5)   NULL,
    [PROPERTY]     VARCHAR (10)  NULL,
    [SUMMARY_WELL] VARCHAR (12)  NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

