CREATE TABLE [dbo].[TEN99_CODE] (
    [u2_id]       VARCHAR (255) NOT NULL,
    [BOX_NO]      NUMERIC (9)   NULL,
    [DESCRIPTION] VARCHAR (38)  NULL,
    [FORM]        VARCHAR (10)  NULL,
    [time_stamp]  DATETIME      NULL,
    [u2_checksum] VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

