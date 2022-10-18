CREATE TABLE [dbo].[PRR_LA_SYS] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [ID]               VARCHAR (126) NULL,
    [OGP_EDI_FILENAME] VARCHAR (35)  NULL,
    [R5D_EDI_FILENAME] VARCHAR (35)  NULL,
    [ST_OPERATOR]      VARCHAR (10)  NULL,
    [_ID]              VARCHAR (126) NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

