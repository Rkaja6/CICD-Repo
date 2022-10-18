CREATE TABLE [dbo].[OFP_PROP] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [COMPANY]     VARCHAR (3)   NULL,
    [TEMP_DATA]   VARCHAR (10)  NULL,
    [TEMP_DATE]   DATETIME      NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

