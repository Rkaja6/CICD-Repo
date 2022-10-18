CREATE TABLE [dbo].[PROJ_STATUS] (
    [u2_id]         VARCHAR (255) NOT NULL,
    [DESCRIPTION]   VARCHAR (30)  NULL,
    [PROJ_APPROVED] VARCHAR (8)   NULL,
    [PROJ_CLOSED]   VARCHAR (10)  NULL,
    [time_stamp]    DATETIME      NULL,
    [u2_checksum]   VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

