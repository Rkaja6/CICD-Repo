CREATE TABLE [dbo].[ARIES_XREF] (
    [u2_id]       VARCHAR (255)   NOT NULL,
    [COMMNT]      VARCHAR (20)    NULL,
    [COMPL]       VARCHAR (10)    NULL,
    [INTEREST]    NUMERIC (19, 8) NULL,
    [WELL_NAME]   VARCHAR (20)    NULL,
    [time_stamp]  DATETIME        NULL,
    [u2_checksum] VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([u2_id] ASC)
);

