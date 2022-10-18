CREATE TABLE [dbo].[CC_INDEX] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [USED_FLAG]   VARCHAR (4)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

