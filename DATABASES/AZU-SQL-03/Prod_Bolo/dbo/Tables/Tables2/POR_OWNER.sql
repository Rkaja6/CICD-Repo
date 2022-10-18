CREATE TABLE [dbo].[POR_OWNER] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [OWNER_CODE_NO] VARCHAR (12)  NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

