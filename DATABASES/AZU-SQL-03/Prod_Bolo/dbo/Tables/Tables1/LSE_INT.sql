CREATE TABLE [dbo].[LSE_INT] (
    [u2_id]             VARCHAR (255) NOT NULL,
    [DESCRIPTION]       VARCHAR (30)  NULL,
    [INTEREST_CATEGORY] VARCHAR (3)   NULL,
    [time_stamp]        DATETIME      NULL,
    [u2_checksum]       VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

