CREATE TABLE [dbo].[PROD_MO_STATUS] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [STATUS]      VARCHAR (10)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

