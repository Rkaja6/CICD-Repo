CREATE TABLE [dbo].[OFFSHORE_AREA] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [ABBREV]      VARCHAR (4)   NULL,
    [NAME]        VARCHAR (30)  NULL,
    [REPORT_NAME] VARCHAR (25)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

