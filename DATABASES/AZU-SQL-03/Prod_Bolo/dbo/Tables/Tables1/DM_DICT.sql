CREATE TABLE [dbo].[DM_DICT] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [DESCRIPTION]  VARCHAR (30)  NULL,
    [FORMAT]       VARCHAR (6)   NULL,
    [VIRTUAL_FLAG] VARCHAR (7)   NULL,
    [XEQ_APP]      VARCHAR (6)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

