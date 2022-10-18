CREATE TABLE [dbo].[LSE_SURVEY] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [ABSTRACT]    VARCHAR (8)   NULL,
    [DESCRIPTION] VARCHAR (60)  NULL,
    [STATE]       VARCHAR (11)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

