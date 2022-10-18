CREATE TABLE [dbo].[MMS_API_CODE] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [BASE_NAME]   VARCHAR (50)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

