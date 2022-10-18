CREATE TABLE [dbo].[MMS_SA_CODES] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [DESCRIPTION] VARCHAR (46)  NULL,
    [TYPE]        VARCHAR (4)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

