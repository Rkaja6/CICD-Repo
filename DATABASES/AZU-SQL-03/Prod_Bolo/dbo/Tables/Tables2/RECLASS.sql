CREATE TABLE [dbo].[RECLASS] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [DEFERRED_]   VARCHAR (8)   NULL,
    [DESCRIPTION] VARCHAR (30)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

