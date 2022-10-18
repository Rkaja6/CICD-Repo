CREATE TABLE [dbo].[PRR_STATUS] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CODE]        VARCHAR (2)   NULL,
    [DESCRIPTION] VARCHAR (38)  NULL,
    [STATE]       VARCHAR (2)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

