CREATE TABLE [dbo].[POR_WELL] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [FLAT_RATE_FLAG] VARCHAR (4)   NULL,
    [NRA_NO]         VARCHAR (14)  NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

