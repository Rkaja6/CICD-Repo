CREATE TABLE [dbo].[WELL_STATUS] (
    [u2_id]             VARCHAR (255)   NOT NULL,
    [DESCRIPTION]       VARCHAR (32)    NULL,
    [REPORT_COLUMN]     VARCHAR (6)     NULL,
    [UPLOAD_PRECEDENCE] VARCHAR (10)    NULL,
    [WELL_COUNT_FACTOR] NUMERIC (19, 2) NULL,
    [time_stamp]        DATETIME        NULL,
    [u2_checksum]       VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

