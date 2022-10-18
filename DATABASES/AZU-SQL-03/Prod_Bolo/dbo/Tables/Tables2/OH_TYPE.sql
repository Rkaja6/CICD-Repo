CREATE TABLE [dbo].[OH_TYPE] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [DESCRIPTION]   VARCHAR (30)  NULL,
    [REPORT_COLUMN] VARCHAR (6)   NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

