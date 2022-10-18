CREATE TABLE [dbo].[CTY] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [API_NO]      VARCHAR (3)   NULL,
    [NAME]        VARCHAR (30)  NULL,
    [NONAPI_CD]   VARCHAR (3)   NULL,
    [REGION]      VARCHAR (10)  NULL,
    [REGION_KEY]  VARCHAR (10)  NULL,
    [REGION_NAME] VARCHAR (30)  NULL,
    [STATE]       VARCHAR (2)   NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

