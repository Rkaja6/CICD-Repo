CREATE TABLE [dbo].[AT_MT_TYPE] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CATEGORY]    VARCHAR (8)   NULL,
    [DESCRIPTION] VARCHAR (42)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

