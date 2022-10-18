CREATE TABLE [dbo].[CDX_CO] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [CDX_STATUS]    VARCHAR (6)   NULL,
    [DAVE_CO]       VARCHAR (4)   NULL,
    [INACTIVE_DATE] DATETIME      NULL,
    [NAME]          VARCHAR (30)  NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

