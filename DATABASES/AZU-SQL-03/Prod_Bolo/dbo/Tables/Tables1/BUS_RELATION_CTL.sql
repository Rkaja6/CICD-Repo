CREATE TABLE [dbo].[BUS_RELATION_CTL] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [DESCRIPTION]  VARCHAR (30)  NULL,
    [EDIT_ENABLED] VARCHAR (7)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

