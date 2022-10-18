CREATE TABLE [dbo].[PRR_CO] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [INACTIVE_FLAG] VARCHAR (5)   NULL,
    [QTR1]          VARCHAR (5)   NULL,
    [QTR2]          VARCHAR (5)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

