CREATE TABLE [dbo].[PTR] (
    [u2_id]                  VARCHAR (255) NOT NULL,
    [DFLT_PAY_CODE]          VARCHAR (8)   NULL,
    [EMAIL_ADDRESS]          VARCHAR (40)  NULL,
    [INFORMATION_PREFERENCE] VARCHAR (11)  NULL,
    [INSIDE_COMPANY]         VARCHAR (7)   NULL,
    [time_stamp]             DATETIME      NULL,
    [u2_checksum]            VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

