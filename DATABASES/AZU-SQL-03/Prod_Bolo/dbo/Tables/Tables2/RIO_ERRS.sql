CREATE TABLE [dbo].[RIO_ERRS] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [BOLO_WELL]      VARCHAR (9)   NULL,
    [BOLO_WELL_NAME] VARCHAR (30)  NULL,
    [BOLO_WELL_NO]   VARCHAR (7)   NULL,
    [DATE_]          VARCHAR (8)   NULL,
    [ERROR_DATE]     VARCHAR (8)   NULL,
    [ID]             VARCHAR (126) NULL,
    [RIO_TABLE]      VARCHAR (30)  NULL,
    [RIO_WELL]       VARCHAR (8)   NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

