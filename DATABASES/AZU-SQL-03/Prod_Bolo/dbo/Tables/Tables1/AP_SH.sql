CREATE TABLE [dbo].[AP_SH] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [DESCRIPTION]   VARCHAR (30)  NULL,
    [WIRE_TRANSFER] VARCHAR (4)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

