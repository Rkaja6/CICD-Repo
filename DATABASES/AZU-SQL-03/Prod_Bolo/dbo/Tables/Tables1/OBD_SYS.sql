CREATE TABLE [dbo].[OBD_SYS] (
    [u2_id]                   VARCHAR (255) NOT NULL,
    [SUPPRESS_OH_OFFSET_ACCT] VARCHAR (8)   NULL,
    [time_stamp]              DATETIME      NULL,
    [u2_checksum]             VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

