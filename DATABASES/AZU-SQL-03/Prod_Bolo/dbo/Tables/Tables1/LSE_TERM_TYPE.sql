CREATE TABLE [dbo].[LSE_TERM_TYPE] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [DESCRIPTION]    VARCHAR (30)  NULL,
    [DISP]           VARCHAR (4)   NULL,
    [PROP_CHANGE_ID] VARCHAR (12)  NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

