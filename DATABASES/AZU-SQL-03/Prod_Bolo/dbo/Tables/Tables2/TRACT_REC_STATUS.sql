CREATE TABLE [dbo].[TRACT_REC_STATUS] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [DESCRIPTION] VARCHAR (15)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

