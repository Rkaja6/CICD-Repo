CREATE TABLE [dbo].[PTR_BROKER] (
    [u2_id]                  VARCHAR (255) NOT NULL,
    [EMAIL_ADDRESS]          VARCHAR (20)  NULL,
    [INFORMATION_PREFERENCE] VARCHAR (11)  NULL,
    [time_stamp]             DATETIME      NULL,
    [u2_checksum]            VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

