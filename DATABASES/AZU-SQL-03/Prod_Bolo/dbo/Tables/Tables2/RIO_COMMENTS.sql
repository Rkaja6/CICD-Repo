CREATE TABLE [dbo].[RIO_COMMENTS] (
    [u2_id]          VARCHAR (255) NOT NULL,
    [BOLO_WELL]      VARCHAR (9)   NULL,
    [BOLO_WELL_NAME] VARCHAR (30)  NULL,
    [BOLO_WELL_NO]   VARCHAR (15)  NULL,
    [COMMNT]         VARCHAR (30)  NULL,
    [COMM_CD]        VARCHAR (10)  NULL,
    [DATA_SOURCE]    VARCHAR (11)  NULL,
    [DATE_]          DATETIME      NULL,
    [DATE_ENTERED]   VARCHAR (12)  NULL,
    [ID]             VARCHAR (126) NULL,
    [RIO_WELL]       VARCHAR (8)   NULL,
    [TIME_ENTERED]   VARCHAR (12)  NULL,
    [USR]            VARCHAR (10)  NULL,
    [WELL_COMM_CD]   VARCHAR (19)  NULL,
    [time_stamp]     DATETIME      NULL,
    [u2_checksum]    VARCHAR (25)  NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

