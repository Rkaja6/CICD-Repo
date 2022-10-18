CREATE TABLE [dbo].[UPLOAD_COAX] (
    [u2_id]            VARCHAR (255) NOT NULL,
    [NEW_ACCOUNT]      VARCHAR (12)  NULL,
    [NEW_MAJOR]        VARCHAR (9)   NULL,
    [NEW_SUB]          VARCHAR (7)   NULL,
    [OLD_ACCOUNT]      VARCHAR (126) NULL,
    [OLD_BILL_ACCOUNT] VARCHAR (11)  NULL,
    [time_stamp]       DATETIME      NULL,
    [u2_checksum]      VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

