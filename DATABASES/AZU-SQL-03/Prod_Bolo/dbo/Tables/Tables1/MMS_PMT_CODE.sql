CREATE TABLE [dbo].[MMS_PMT_CODE] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [DESCRIPTION] VARCHAR (40)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

