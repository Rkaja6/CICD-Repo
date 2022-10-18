CREATE TABLE [dbo].[CN_CC_MAP] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [ID]          VARCHAR (126) NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

