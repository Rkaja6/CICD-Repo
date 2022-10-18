CREATE TABLE [dbo].[PRR_TX_LEASE] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [NAME]           VARCHAR (31)  NULL,
    [STATE_DISTRICT] VARCHAR (4)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

