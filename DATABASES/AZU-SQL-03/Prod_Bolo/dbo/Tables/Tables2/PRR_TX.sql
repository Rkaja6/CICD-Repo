CREATE TABLE [dbo].[PRR_TX] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [STATE_FIELD] VARCHAR (30)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

