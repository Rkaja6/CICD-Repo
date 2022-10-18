CREATE TABLE [dbo].[PRR_FACILITY] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [DESCRIPTION] VARCHAR (30)  NULL,
    [ID]          VARCHAR (126) NULL,
    [_ID]         VARCHAR (126) NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

