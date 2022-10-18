CREATE TABLE [dbo].[AT_ASSET] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [ASSET]          VARCHAR (3)   NULL,
    [ASSET_CATEGORY] VARCHAR (4)   NULL,
    [ASSET_ID]       VARCHAR (3)   NULL,
    [AT_ASSET_ID]    VARCHAR (3)   NULL,
    [ID]             VARCHAR (126) NULL,
    [SERIAL_NO]      VARCHAR (10)  NULL,
    [XREF_STRING]    VARCHAR (6)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

