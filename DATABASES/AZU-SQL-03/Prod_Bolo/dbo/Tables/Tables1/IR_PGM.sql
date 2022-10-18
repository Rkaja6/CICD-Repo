CREATE TABLE [dbo].[IR_PGM] (
    [u2_id]        VARCHAR (255) NOT NULL,
    [COMPANY]      VARCHAR (7)   NULL,
    [DESCRIPTION]  VARCHAR (30)  NULL,
    [PROGRAM_TYPE] VARCHAR (4)   NULL,
    [RPTG_BASIS]   VARCHAR (5)   NULL,
    [time_stamp]   DATETIME      NULL,
    [u2_checksum]  VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

