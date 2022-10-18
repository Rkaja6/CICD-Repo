CREATE TABLE [dbo].[CLIENT] (
    [u2_id]                   VARCHAR (255) NOT NULL,
    [THIRD_PARTY_VENDOR_FLAG] VARCHAR (6)   NULL,
    [time_stamp]              DATETIME      NULL,
    [u2_checksum]             VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

