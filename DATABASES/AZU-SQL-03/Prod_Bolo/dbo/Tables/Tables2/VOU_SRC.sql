CREATE TABLE [dbo].[VOU_SRC] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [AUTO_POST_FLAG] VARCHAR (4)   NULL,
    [DESCRIPTION]    VARCHAR (35)  NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

