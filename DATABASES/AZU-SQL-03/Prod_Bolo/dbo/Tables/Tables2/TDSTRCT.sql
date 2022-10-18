CREATE TABLE [dbo].[TDSTRCT] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COUNTY]      VARCHAR (6)   NULL,
    [DESCRIPTION] VARCHAR (30)  NULL,
    [SCHOOL]      VARCHAR (6)   NULL,
    [STATE]       VARCHAR (2)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

