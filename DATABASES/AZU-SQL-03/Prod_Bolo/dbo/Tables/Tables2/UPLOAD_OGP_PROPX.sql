CREATE TABLE [dbo].[UPLOAD_OGP_PROPX] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [GWIZ_OGP_PROP_ID] VARCHAR (15)  NULL,
    [ID]               VARCHAR (126) NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

