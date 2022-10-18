CREATE TABLE [dbo].[MKT] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [DESCRIPTION] VARCHAR (30)  NULL,
    [PURCHASER]   VARCHAR (20)  NULL,
    [REMITTER]    VARCHAR (20)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

