CREATE TABLE [dbo].[STATE_PRD] (
    [u2_id]           VARCHAR (255) NOT NULL,
    [ABBREV]          VARCHAR (4)   NULL,
    [DESCRIPTION]     VARCHAR (33)  NULL,
    [REPORT_NO_REMIT] VARCHAR (3)   NULL,
    [time_stamp]      DATETIME      NULL,
    [u2_checksum]     VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

