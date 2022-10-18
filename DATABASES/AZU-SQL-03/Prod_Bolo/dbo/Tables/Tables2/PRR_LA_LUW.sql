CREATE TABLE [dbo].[PRR_LA_LUW] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [FIELD_ID]    VARCHAR (10)  NULL,
    [ID]          VARCHAR (126) NULL,
    [NAME]        VARCHAR (30)  NULL,
    [_ID]         VARCHAR (126) NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

