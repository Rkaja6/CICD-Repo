CREATE TABLE [dbo].[AREA] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [CC_TYPE]     VARCHAR (5)   NULL,
    [NAME]        VARCHAR (33)  NULL,
    [SHADOW_KEY]  VARCHAR (12)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

