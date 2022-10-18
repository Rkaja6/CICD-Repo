CREATE TABLE [dbo].[INS_TYPE] (
    [u2_id]       VARCHAR (255)   NOT NULL,
    [COVERAGE]    NUMERIC (19, 2) NULL,
    [DESCRIPTION] VARCHAR (30)    NULL,
    [time_stamp]  DATETIME        NULL,
    [u2_checksum] VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

